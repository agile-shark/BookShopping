package com.shxt.util;

import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

public class ResourceToExcel {
	/**
	 * 将数据库中的数据添加到excel中
	 * 隋春雨
	 * 
	 */
	public static void ToExcel() {
		DataAccess da = new DataAccess();
		// 查询表中的字段信息
		//ResultSet title = da.Select("select ");
		ArrayList<String> title = new ArrayList<String>();
		title.add("订单号");title.add("用户号");title.add("下订单时间");title.add("邮寄费用");title.add("总价");title.add("发送地址");
		title.add("发送方式");title.add("支付方式");title.add("是否确认");title.add("是否付款");title.add("发货状态");title.add("有无包装");title.add("有无贺卡");
		// 查询表中的记录
		ResultSet res = da.Select("select * from bookorder");
	
		try {
			// 打开文件
			WritableWorkbook book = Workbook.createWorkbook(new File(
					"D:\\test.xls"));
			// 生成名为“第一页”的工作表，参数0表示这是第一页
			WritableSheet sheet = book.createSheet(" 第一页 ", 0);
			// 在Label对象的构造子中指名单元格位置是第一列第一行(0,0)
			// 以及单元格内容为test
			int x = 0;//用于控制标题插入的位置  即第一行的第几列
			for(int i=0;i<title.size();i++) {
				Label label = new Label(x, 0, title.get(i));//向k行i列中插入数据
				sheet.addCell(label);
				x++;
			}
            /**
             * 用于出入出标题外的数据  
             * 从第二行开始 使用res.next控制行
             * 使用for控制列 共x列  
             * */
			int k = 1;
			while (res.next()) {
				for (int i = 0; i < x; i++) {
					String ss = res.getString(i + 1);
					Label value = new Label(i, k, ss);//向k行i列中插入数据
					sheet.addCell(value);
				}
				k++;
			}
			// 写入数据并关闭文件
			book.write();
			book.close();

		} catch (SQLException e) {
			System.out.println(e);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
