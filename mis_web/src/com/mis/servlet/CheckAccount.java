package com.mis.servlet;

import java.util.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;
import com.mis.dao.bean.Book;
import com.mis.dao.factory.DAOFactory;
import com.mis.common.JSONHelper;

/**
 * Servlet implementation class CheckAccount1
 */
@WebServlet("/CheckAccount1")
public class CheckAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
/*		   HttpSession session = req.getSession();
		   AccountBean account = new AccountBean();
		   String username = req.getParameter("username");
		    String pwd = req.getParameter("pwd");
		   account.setPassword(pwd);
		    account.setUsername(username);
		   if((username != null)&&(username.trim().equals("jsp"))) {
		     if((pwd != null)&&(pwd.trim().equals("1"))) {
		      System.out.println("success");
		      session.setAttribute("account", account);
		     String login_suc = "success.jsp";
		      resp.sendRedirect(login_suc);
		     return;
		     }
		    }
		    String login_fail = "fail.jsp";
		    resp.sendRedirect(login_fail);
		   return;*/
		List<Book> alllist=null;
		try {
			alllist=DAOFactory.getIBookDAOInstance().findAll("");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		resp.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		resp.setContentType("application/json);charset=utf-8");
		String jsonStr="{\"name\":\"michael\",\"age\":\"20\"}";
		jsonStr=JSONHelper.toJSONString(alllist);
		resp.getWriter().write(jsonStr);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
