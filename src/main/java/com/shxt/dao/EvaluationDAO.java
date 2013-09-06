package com.shxt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shxt.db.DBHelper;
import com.shxt.model.Evaluation;

public class EvaluationDAO {
	Connection ct = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	/**
	 * 得到指定图书编号的评论记录数
	 * @param bookid：图书id号
	 * @return：整型数据
	 */
	public int getEvaluateNum(String bookid) {
		int num = 0;
		String sql = "select count(*) from bookevaluation where bookid="+bookid;
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
	 * 得到指定用户的评论记录数
	 * @param bookid：用户id号
	 * @return：整型数据
	 */
	public int getEvaluateNumByUserId(String userid) {
		int num = 0;
		String sql = "select count(*) from bookevaluation where userid="+userid;
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
	 * 得到指定图书的评论列表
	 * @param bookid：图书id号
	 * @return：返回ArrayList
	 */
	public ArrayList<Evaluation> getEvaluationList(String bookid) {
		ArrayList<Evaluation> list = new ArrayList<Evaluation>();
		String sql = "select * from bookevaluation where bookid="+bookid+" order by evaid desc";
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				Evaluation eva = new Evaluation();
				eva.setEvaid(rs.getInt(1));
				eva.setBookid(rs.getString(2));
				eva.setUserid(rs.getString(3));
				eva.setUsername(rs.getString(4));
				eva.setEvacontent(rs.getString(5));
				eva.setEvatitle(rs.getString(6));
				eva.setEvadate(rs.getDate(7));
				eva.setEvarank(rs.getString(8));
				eva.setEvaimage(rs.getString(9));
				list.add(eva);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return list;
	}
	
	
	/**
	 * 得到指定图书的评论列表
	 * @param bookid：图书id号
	 * @return：返回ArrayList
	 */
	public ArrayList<Evaluation> getEvaluationListByUserId(String userid) {
		ArrayList<Evaluation> list = new ArrayList<Evaluation>();
		String sql = "select * from bookevaluation where userid="+userid;
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				Evaluation eva = new Evaluation();
				eva.setEvaid(rs.getInt(1));
				eva.setBookid(rs.getString(2));
				eva.setUserid(rs.getString(3));
				eva.setUsername(rs.getString(4));
				eva.setEvacontent(rs.getString(5));
				eva.setEvatitle(rs.getString(6));
				eva.setEvadate(rs.getDate(7));
				eva.setEvarank(rs.getString(8));
				eva.setEvaimage(rs.getString(9));
				list.add(eva);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return list;
	}
	
	//将用户评论的信息插入到数据库中
	public boolean insertEvaluation(String bookid,String userid,String username,String evaTitle,String evaRank,String evaContent,String userimage) {
		boolean b = false;
		int evaid = this.getNewEvaId();
		String sql = "insert into bookevaluation(evaid, bookid, userid, username, evacontent, evatitle, evarank,userimage) values(" + evaid + ",'"+bookid+"','"+userid+"','"+username+"','"+evaContent+"','"+evaTitle+"',"+evaRank+",'"+userimage+"')";
		System.out.println(sql);
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			int n = ps.executeUpdate();
			if(n==1) {
				b = true;
			}
		} catch (Exception e) {
			System.out.println("插入数据的时候，数据库出错了!");
		} finally {
			this.close();
		}
		return b;
	}
	
	/**
	 * 得到评论信息的分页信息
	 * @param bookid：指定的图书id号
	 * @param rownum：指定的一页显示几条记录
	 * @return：返回评论信息
	 */
	public ArrayList<Evaluation> getEvaluatePage(String bookid,int pagenow,int rownum) {
		ArrayList<Evaluation> al = new ArrayList<Evaluation>();
		int pageSize = pagenow*rownum;
		pagenow = (pagenow-1)*rownum;
		String sql = "select * from (select a.* , rownum rn from(select * from bookevaluation where bookid="+bookid+" order by evaid desc) a where rownum<="+pageSize+") where rn>"+pagenow;
		System.out.println(sql);
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				Evaluation eva = new Evaluation();
				eva.setEvaid(rs.getInt(1));
				eva.setBookid(rs.getString(2));
				eva.setUserid(rs.getString(3));
				eva.setUsername(rs.getString(4));
				eva.setEvacontent(rs.getString(5));
				eva.setEvatitle(rs.getString(6));
				eva.setEvadate(rs.getDate(7));
				eva.setEvarank(rs.getString(8));
				eva.setEvaimage(rs.getString(9));
				al.add(eva);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("分页的时候，数据库出现错误了!");
		} finally {
			this.close();
		}
		
		return al;
	}
	
	/**
	 * 得到某一类书籍评论信息的页数
	 * @param pageSize：一页显示的评论数
	 * @param bookid：指定的图书id号
	 * @return：返回具体的页数
	 */
	public int getPageWithEvaluate(int pageSize,String bookid) {
		int n = 0;
		String sql = "select count(*) from bookevaluation where bookid="+bookid;
		int pageCount = 0;
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				n = rs.getInt(1);
			}
			if(n%pageSize==0){
				pageCount = n/pageSize;
			}else {
				pageCount = n/pageSize + 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("在计算一类书籍的评论页数时，数据库发生错误了!");
		} finally {
			this.close();
		}
		
		return pageCount;
	}
	
	
	/**
	 * 获取评论表中应该插入的下一个id号
	 * @return：返回该插入的评论id号
	 */
	public int getNewEvaId(){
		int newEvaId = 0;
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement("select max(evaid) from bookevaluation");
			rs = ps.executeQuery();
			
			if(rs.next()){
				newEvaId = rs.getInt(1) + 1;
			}
		} catch (Exception e) {
			System.out.println("查询评论最大号的时候数据库出错了!");
		}finally{
			this.close();
		}
		return newEvaId;
	}
	
	public boolean deleteEvaluationByEvaId(String evaid) {
		boolean b = false;
		String sql = "delete bookevaluation where evaid='"+evaid+"'";
		System.out.println("删除评论语句："+sql);
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
	 * 关闭函数
	 */
	private void close(){
		try {
			if(rs!=null){
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(ps!=null){
				ps.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(ct!=null && !ct.isClosed()){
				ct.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
