package com.shxt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.shxt.db.DBHelper;
import com.shxt.model.BookInfo;
import com.shxt.model.BookOrder;

public class OrderDAO {
	private Connection ct = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	@SuppressWarnings("deprecation")
	public boolean addOrder(CarDAO car,String userId,float sendprice,float totalprice,String sendaddress,String sendmode,String paymode,int ispackage,int iscard) {
		boolean flag = true;
		
		//得到系统当前时间
		String times = (new java.util.Date()).toLocaleString();
		String order_id = this.Comb_str(times);
		String orderId = this.get_orderId(order_id);
		System.out.println(orderId);
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement("insert into bookorder(orderid, userid, sendprice, totalprice, sendaddress, sendmode, paymode, ispackage, iscard)" +
					"values(?,?,?,?,?,?,?,?,?)");
			ps.setString(1, orderId);
			ps.setString(2, userId);
			ps.setFloat(3, sendprice);
			ps.setFloat(4, totalprice);
			ps.setString(5, sendaddress);
			ps.setString(6, sendmode);
			ps.setString(7, paymode);
			ps.setInt(8, ispackage);
			ps.setInt(9, iscard);
			
			int a = ps.executeUpdate();
			if(a == 1) {
				//必须取出刚刚添加到orders表的那个订单号
				//取出最后那条的orders的id就是
				ps=ct.prepareStatement("select max(orderid) from bookorder");
				rs=ps.executeQuery();
				String ordersId="";
				if(rs.next()){
					ordersId=rs.getString(1);
				}
				
				//添加成功,之后开始要添加OrderDetail表了
				//从购物车中取出已近放入购物车的货物信息
				ArrayList al = car.showCar();
				//循环的将orderDetail表的信息添加进去,但是如果买的数量较多，那么的话就会多次的进行数据的添加操作，这样效率会很低的
				//所以，我们要使用“批量添加”的方法来进行，需要用到Statement
				Statement sm = ct.createStatement();
				for(int i=0;i<al.size();i++){
					BookInfo bi = (BookInfo) al.get(i);
					sm.addBatch("insert into bookcar values('"+ordersId+"','"+bi.getBook_id()+"','"+car.getNumById(bi.getBook_id()+"")+"','"+car.getOnePrice(bi.getBook_id()+"")+"','"+bi.getBook_type()+"','"+bi.getBook_name()+"')");
					
					//批量执行添加任务
					sm.executeBatch();
				}
			}
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return flag;
	}
	
	/**
	 * 从系统时间获得的字符串，将其中的‘--’去掉只剩下数字当做当前的订单号
	 * @param str：传入的系统时间的字符串
	 * @return：返回一个除掉特殊字符的字符串
	 */
	public String Comb_str(String str){
		int i = 0;
		String new_str = "";
		String str_1 = "";
		while(str.charAt(i)!='-'){
			new_str += str.charAt(i);
			i++;
		}
		i++;
		while(str.charAt(i)!='-'){
			str_1 += str.charAt(i);
			i++;
		}
		i++;
		if(str_1.length() == 1){
			new_str = new_str+'0'+str_1;
		}else{
			new_str = new_str+str_1;
		}
		str_1 = "";
		while(str.charAt(i)!=' '){
			str_1 += str.charAt(i);
			i++;
		}
		if(str_1.length() == 1){
			new_str = new_str + '0'+str_1;
		}
		else{
			new_str = new_str+str_1;
		}
		return new_str;
	}
	
	
	/**
	 * 获取订单表中最大的订单号，以便产生下一个订单号
	 * @param orderId：传入当前订单号
	 * @return：返回下一个订单号
	 */
	public String get_orderId(String orderId){
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement("select max(orderid) from bookorder");
			rs = ps.executeQuery();
			
			String max_orderId = "";
			if(rs.next()){
				max_orderId = rs.getString(1);
			}
			
			//如果数据库表中存在数据，则在检索到的最大订单号的基础上加1产生下一个订单号
			//否则以当前日期加‘0001’作为下一个订单号
			if(max_orderId != null){
				long id = Long.parseLong(max_orderId);
				id = id + 1;
				max_orderId = String.valueOf(id);
			}else{
				max_orderId = orderId.concat("0001");
			}
			return max_orderId;
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}finally{
			this.close();
		}
	}
	
	
	/**
	 * 获取订单表中刚产生的订单号
	 * @return：返回最大的订单号
	 */
	public String getNewOrderId(){
		String newOrderId = "";
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement("select max(orderid) from bookorder");
			rs = ps.executeQuery();
			
			if(rs.next()){
				newOrderId = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		return newOrderId;
	}
	
	/**
	 * 获得指定用户的订单信息
	 * @param userid：用户的id号
	 * @return：返回列表，用户的订单信息
	 */
	public ArrayList<BookOrder> getOrderByUserId(String userid){
		ArrayList<BookOrder> al = new ArrayList<BookOrder>();
		
		String sql = "select * from bookorder where userid='"+userid+"'";
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				BookOrder bo = new BookOrder();
				bo.setOrderid(rs.getString(1));
				bo.setUserid(rs.getString(2));
				bo.setOrderdate(rs.getDate(3));
				bo.setSendprice(rs.getFloat(4));
				bo.setTotalprice(rs.getFloat(5));
				bo.setSendaddress(rs.getString(6));
				bo.setSendmode(rs.getString(7));
				bo.setPaymode(rs.getString(8));
				bo.setIsConfirmed(rs.getInt(9));
				bo.setIspayed(rs.getInt(10));
				bo.setSendstatus(rs.getInt(11));
				bo.setIspackage(rs.getInt(12));
				bo.setIscard(rs.getInt(13));
				al.add(bo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return al;
	}
	
	/**
	 *得到所有的订单信息
	 * @return：返回订单列表
	 */
	public ArrayList<BookOrder> getAllOrders(int pageNow,int pageSize){
		ArrayList<BookOrder> al = new ArrayList<BookOrder>();
		int pageCount = pageNow*pageSize;
		pageNow = (pageNow-1)*pageSize;
		String sql = "select * from(select bf.*,rownum rn from (select * from bookorder) bf where rownum<="+pageCount+") where rn>"+pageNow;
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				BookOrder bo = new BookOrder();
				bo.setOrderid(rs.getString(1));
				bo.setUserid(rs.getString(2));
				bo.setOrderdate(rs.getDate(3));
				bo.setSendprice(rs.getFloat(4));
				bo.setTotalprice(rs.getFloat(5));
				bo.setSendaddress(rs.getString(6));
				bo.setSendmode(rs.getString(7));
				bo.setPaymode(rs.getString(8));
				bo.setIsConfirmed(rs.getInt(9));
				bo.setIspayed(rs.getInt(10));
				bo.setSendstatus(rs.getInt(11));
				bo.setIspackage(rs.getInt(12));
				bo.setIscard(rs.getInt(13));
				al.add(bo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return al;
	}
	
	
	/**
	 *得到未确认的订单信息
	 * @return：返回订单列表
	 */
	public ArrayList<BookOrder> getAllOrdersByUnConfirm(int pageNow,int pageSize){
		ArrayList<BookOrder> al = new ArrayList<BookOrder>();
		
		int pageCount = pageNow*pageSize;
		pageNow = (pageNow-1)*pageSize;
		String sql = "select * from(select bf.*,rownum rn from (select * from bookorder where isconfirmed=0) bf where rownum<="+pageCount+") where rn>"+pageNow;
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				BookOrder bo = new BookOrder();
				bo.setOrderid(rs.getString(1));
				bo.setUserid(rs.getString(2));
				bo.setOrderdate(rs.getDate(3));
				bo.setSendprice(rs.getFloat(4));
				bo.setTotalprice(rs.getFloat(5));
				bo.setSendaddress(rs.getString(6));
				bo.setSendmode(rs.getString(7));
				bo.setPaymode(rs.getString(8));
				bo.setIsConfirmed(rs.getInt(9));
				bo.setIspayed(rs.getInt(10));
				bo.setSendstatus(rs.getInt(11));
				bo.setIspackage(rs.getInt(12));
				bo.setIscard(rs.getInt(13));
				al.add(bo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return al;
	}
	
	/**
	 *得到未付款的订单信息
	 * @return：返回订单列表
	 */
	public ArrayList<BookOrder> getAllOrdersByUnPayed(int pageNow,int pageSize){
		ArrayList<BookOrder> al = new ArrayList<BookOrder>();
		
		int pageCount = pageNow*pageSize;
		pageNow = (pageNow-1)*pageSize;
		String sql = "select * from(select bf.*,rownum rn from (select * from bookorder where isconfirmed=1 and ispayed=0) bf where rownum<="+pageCount+") where rn>"+pageNow;
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				BookOrder bo = new BookOrder();
				bo.setOrderid(rs.getString(1));
				bo.setUserid(rs.getString(2));
				bo.setOrderdate(rs.getDate(3));
				bo.setSendprice(rs.getFloat(4));
				bo.setTotalprice(rs.getFloat(5));
				bo.setSendaddress(rs.getString(6));
				bo.setSendmode(rs.getString(7));
				bo.setPaymode(rs.getString(8));
				bo.setIsConfirmed(rs.getInt(9));
				bo.setIspayed(rs.getInt(10));
				bo.setSendstatus(rs.getInt(11));
				bo.setIspackage(rs.getInt(12));
				bo.setIscard(rs.getInt(13));
				al.add(bo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return al;
	}
	
	/**
	 *得到未发货的订单信息
	 * @return：返回订单列表
	 */
	public ArrayList<BookOrder> getAllOrdersByUnOutGoods(int pageNow,int pageSize){
		ArrayList<BookOrder> al = new ArrayList<BookOrder>();
		int pageCount = pageNow*pageSize;
		pageNow = (pageNow-1)*pageSize;
		String sql = "select * from(select bf.*,rownum rn from (select * from bookorder where isconfirmed=1 and ispayed=1 and sendstaus=0) bf where rownum<="+pageCount+") where rn>"+pageNow;
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				BookOrder bo = new BookOrder();
				bo.setOrderid(rs.getString(1));
				bo.setUserid(rs.getString(2));
				bo.setOrderdate(rs.getDate(3));
				bo.setSendprice(rs.getFloat(4));
				bo.setTotalprice(rs.getFloat(5));
				bo.setSendaddress(rs.getString(6));
				bo.setSendmode(rs.getString(7));
				bo.setPaymode(rs.getString(8));
				bo.setIsConfirmed(rs.getInt(9));
				bo.setIspayed(rs.getInt(10));
				bo.setSendstatus(rs.getInt(11));
				bo.setIspackage(rs.getInt(12));
				bo.setIscard(rs.getInt(13));
				al.add(bo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return al;
	}
	
	/**
	 *得到成功的订单信息
	 * @return：返回订单列表
	 */
	public ArrayList<BookOrder> getAllOrdersBySuccess(int pageNow,int pageSize){
		ArrayList<BookOrder> al = new ArrayList<BookOrder>();
		int pageCount = pageNow*pageSize;
		pageNow = (pageNow-1)*pageSize;
		String sql = "select * from(select bf.*,rownum rn from (select * from bookorder where isconfirmed=1 and ispayed=1 and sendstaus=1) bf where rownum<="+pageCount+") where rn>"+pageNow;
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				BookOrder bo = new BookOrder();
				bo.setOrderid(rs.getString(1));
				bo.setUserid(rs.getString(2));
				bo.setOrderdate(rs.getDate(3));
				bo.setSendprice(rs.getFloat(4));
				bo.setTotalprice(rs.getFloat(5));
				bo.setSendaddress(rs.getString(6));
				bo.setSendmode(rs.getString(7));
				bo.setPaymode(rs.getString(8));
				bo.setIsConfirmed(rs.getInt(9));
				bo.setIspayed(rs.getInt(10));
				bo.setSendstatus(rs.getInt(11));
				bo.setIspackage(rs.getInt(12));
				bo.setIscard(rs.getInt(13));
				al.add(bo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return al;
	}
	
	/**
	 * 返回指定用户下订单的数量
	 * @param userid：用户id
	 * @return：返回整型
	 */
	public int getNumOrderByUser(String userid) {
		int num = 0;
		String sql = "select count(*) from bookorder where userid='" +userid+ "'";
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return num;
	}
	
	/**
	 * 返回下订单的数量
	 * @return：返回整型
	 */
	public int getNumOrders() {
		int num = 0;
		String sql = "select count(*) from bookorder";
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return num;
	}
	
	/**
	 * 返回未确认的订单的数量
	 * @return：返回整型
	 */
	public int getNumOrdersByUnConfirmed() {
		int num = 0;
		String sql = "select count(*) from bookorder where isconfirmed=0";
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return num;
	}
	
	/**
	 * 返回未付款的订单的数量
	 * @return：返回整型
	 */
	public int getNumOrdersByUnPayed() {
		int num = 0;
		String sql = "select count(*) from bookorder where isconfirmed=1 and ispayed=0";
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return num;
	}
	
	
	/**
	 * 返回未发货的订单的数量
	 * @return：返回整型
	 */
	public int getNumOrdersByUnOutGoods() {
		int num = 0;
		String sql = "select count(*) from bookorder where isconfirmed=1 and ispayed=1 and sendstaus=0";
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return num;
	}
	
	/**
	 * 返回成功的订单的数量
	 * @return：返回整型
	 */
	public int getNumOrdersBySuccess() {
		int num = 0;
		String sql = "select count(*) from bookorder where isconfirmed=1 and ispayed=1 and sendstaus=1";
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return num;
	}
	
	/**
	 * 删除指定的订单信息
	 * @param orderid：订单号
	 * @return：返回布尔型
	 */
	public boolean deleteOrderByOrderId(String orderid) {
		boolean b = false;
		String sql = "delete bookorder where orderid='"+orderid+"'";
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			int n = ps.executeUpdate();
			if(n == 1) {
				b = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return b;
	}
	
	/**
	 * 进行对订单信息表的字段的修改
	 * @param sql
	 * @return
	 */
	public boolean changeOrder(String sql) {
		boolean b = false;
		int n = 0;
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			n = ps.executeUpdate();
			if(n!=0) {
				b = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return b;
	}
	
	public ArrayList<String> getOrderPrice(String sql) {
		ArrayList<String> al = new ArrayList<String>();
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				al.add(rs.getString("TOTALPRICE"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return al;
	}
	
	/**
	 * 得到所有订单的总金额
	 * @return
	 */
	public float getAllOrderPrice() {
		String sql = "select totalprice from bookorder";
		float totalPrice = 0.0f;
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				totalPrice += rs.getFloat("TOTALPRICE");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return totalPrice;
	}
	
	//关闭函数
	public void close(){
		try{
				
			if(rs!=null){
				rs.close();
				rs = null;
			}
			
			if(ps!=null){
				ps.close();
				ps = null;
			}
			
			if(ct!=null){
				ct.close();
				ct = null;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
