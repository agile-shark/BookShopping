package com.shxt.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		this.doPost(request, response);
	}

	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String fileurl=this.getServletContext().getRealPath("face");
		
		DiskFileItemFactory dff = new DiskFileItemFactory();
		ServletFileUpload sfu = new ServletFileUpload(dff);
		Map<String,String> map = new HashMap<String,String>();
		try {
			List<FileItem> list = sfu.parseRequest(request);
			for(int i = 0; i < list.size(); i++) {
				FileItem fileItem = list.get(i);
				String fieldName = fileItem.getFieldName();
				if(fileItem.isFormField()) {
					String fieldValue = fileItem.getString("utf-8");
					map.put(fieldName, fieldValue);
				} else {
					String fileName = fileItem.getName();
					System.out.println(fileName);
					if(!"".equals(fileName)) {
						fileName = UUID.randomUUID()+fileName.substring(fileName.indexOf("."));
						try {
							fileItem.write(new File(fileurl,fileName));
						} catch (Exception e) {
							e.printStackTrace();
						}
						map.put(fieldName, fileName);
					}
				}
			}
			
			request.getSession().setAttribute("photo", map.get("photo"));
//			out.println("<h3>用户名："+map.get("username")+"</h3>");
//			out.println("<h3>密码："+map.get("password")+"</h3>");
//			out.println("<h3>图片："+map.get("photo")+"</h3>");
//			out.println("<img src='image/"+map.get("photo")+"'>");
			request.getRequestDispatcher("GetProvince").forward(request, response);
			
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		out.flush();
		out.close();
	}

}
