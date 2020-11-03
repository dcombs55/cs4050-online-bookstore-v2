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
import bean.Customer;

@WebServlet("/activate")
public class AccountActivationServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
    private CustomerDao customerDao;
    
    public void init() {
    	customerDao = new CustomerDao();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	
    	HttpSession session = request.getSession();
    	if(session.getAttribute("errors") != null) {
			session.removeAttribute("errors");
		}
    	
    	String userName = (String)session.getAttribute("username");
    	String emailAddress = (String)session.getAttribute("emailAddress");
    	int enteredCode = Integer.parseInt(request.getParameter("activateCode"));
        
        try {
        	boolean validActivationCode = customerDao.checkActivationCode(userName, emailAddress, enteredCode);

        	if(validActivationCode) {
        		customerDao.updateAccountState(userName, emailAddress, "Active");
                response.sendRedirect("homepage.html");
        	}
        	else {
        		session = request.getSession();
        		String errors = "Errors: <ul>";
        		errors = errors + "<li>The code entered is invalid. Please try again.</li>";
        		errors = errors + "</ul>";
            	session.setAttribute("errors", errors);
            	response.sendRedirect("confirmation.jsp");
        	} 
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    	        
    }
}
