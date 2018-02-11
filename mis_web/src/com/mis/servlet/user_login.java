package com.mis.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mis.dao.impl.UserImpl;
import com.mis.dao.impl.loginlogImpl;
import com.mis.dao.bean.*;

/**
 * Servlet implementation class user_login
 */
@WebServlet("/user_login")
public class user_login extends HttpServlet {
	private static final long serialVersionUID = 3L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public user_login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String result="";
		String action=request.getParameter("action");
		
		String ip="";
		String city=request.getParameter("city");
		String remember=request.getParameter("remember");
		String name=request.getParameter("loginName");
		String pwd=request.getParameter("loginPwd");
		
		switch (action) {
		case "login":
			try {
				result=login(ip,city,remember,name,pwd);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				//result=e.toString();
				 result= "{\"msg\":\""+e.toString() +"\",\"success\":false}";
				e.printStackTrace();
			}
			break;
		}
		response.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json);charset=utf-8");
		response.getWriter().write(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private String login(String ip,String city,String remember,String name,String pwd) throws Exception {
		String result="";
		Calendar  lastLoginTime=Calendar.getInstance();

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String lastLoginTimeStr=df.format(lastLoginTime.getTime());
		
		
		 
		  
	  String loginTimes=	loginlogImpl.CheckLogin(ip,lastLoginTimeStr);
	  if(loginTimes!=null) {
		  lastLoginTime.add(Calendar.MINUTE,5);
		  String afterTime=df.format(lastLoginTime.getTime());
		  result="{\"msg\":\"密码错误次数达到5次，请在" +afterTime + "之后再登陆！\",\"success\":false}";
	  }
	  else {
		  LoginLog loginInfo=new LoginLog();
		  loginInfo.setUserName(name);
		  loginInfo.setUserIp(ip);
		  loginInfo.setCity(city);
		  User currenUser= UserImpl.UserLogin(name,pwd);
		  if(currenUser==null) {
			  loginInfo.setSuccess(false);
			  result="{\"msg\":\"用户名或密码错误！\",\"success\":false}";
		  }
		  else if(currenUser.isIsAble()==false) {
			  loginInfo.setSuccess(false);
			  result="{\"msg\":\"用户已被禁用！\",\"success\":false}";
		  }
		  else {
			  result= "{\"msg\":\"登录成功！\",\"success\":true}";
		  }
		  
		  
	  }
	  return result;
	}
	

}
