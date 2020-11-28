package web;

import java.io.*;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import javax.servlet.http.*;
import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import database.CustomerDao;
import database.AdminDao;
import database.LoginDao;
import bean.LoginBean;
import bean.Customer;
import bean.Address;
import bean.CreditCard;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
    private CustomerDao customerDao;
    private AdminDao adminDao;
    private LoginDao loginDao;
    
    public void init() {
    	customerDao = new CustomerDao();
    	adminDao = new AdminDao();
    	loginDao = new LoginDao();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	
    	String loginAction = request.getParameter("login-action");
    	String resetAction = request.getParameter("reset-action");
 
    	HttpSession session1 = request.getSession();
    	if(loginAction != null && loginAction.equals("Login")) {
    		
    	   	String username = request.getParameter("username");
            String password = request.getParameter("password");
            LoginBean login = new LoginBean();
            login.setUsername(username);
            login.setPassword(password);
            
    		try {
        		if(loginDao.validateCustomer(login)){
            		String user = login.getUsername();
            		session1.setAttribute("username", user);
            		String welcomeMessage = "<h1>You have logged in successfully " + login.getUsername() + "!</h1>";
                	session1.setAttribute("welcomeMessage", welcomeMessage);
                	response.sendRedirect("Logincheck.jsp");
            	}
            	else if(loginDao.validateAdmin(login)){
            		String user = login.getUsername();
            		session1.setAttribute("username", user);
            		response.sendRedirect("admin_hp.jsp");
            	}
            	else{
            		session1.setAttribute("error", "login error");
            		response.sendRedirect("login.jsp");
            	}
        	} catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
        	}
    	}
    	else if(loginAction != null && loginAction.equals("Reset Password")) {
    		response.sendRedirect("reset.jsp");
    	}
    	else if(resetAction != null) {
    		String user = request.getParameter("Username");
    		String pass1 = request.getParameter("Password1");
    		String pass2 = request.getParameter("Password2");
    		String oldPass = request.getParameter("OldPassword");
    		if(pass1.equals(pass2)) {
    			try {
    				if(!loginDao.resetPassword(user, oldPass, pass2)) {
    					session1.setAttribute("error", "reset error");
    				}else {
    					session1.setAttribute("success", "success");
    				}
    				response.sendRedirect("reset.jsp");
    			} catch (Exception e) {
    				e.printStackTrace();
    			}
    		}else {
    			session1.setAttribute("error", "reset error");
        		response.sendRedirect("reset.jsp");
    		}
    	}
    	
 
    }
}
