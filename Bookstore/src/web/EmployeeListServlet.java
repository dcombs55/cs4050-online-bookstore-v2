package web;

import java.io.*;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import javax.servlet.http.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;

import database.CustomerDao;
import database.AdminDao;
import bean.Customer;
import bean.Address;
import bean.CreditCard;
import java.util.*;

@WebServlet("/employees")
public class EmployeeListServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
    private AdminDao adminDao;
    
    public void init() {
    	adminDao = new AdminDao();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    	HttpSession session = request.getSession();
		String adminUser = (String)session.getAttribute("username");
        
        if(adminUser != null) {
	        try {
	        	HashMap<String, List<String>> returnData = adminDao.getEmployees();
	    		request.setAttribute("returnData", returnData);
	    		
	    		RequestDispatcher dispatcher = request.getRequestDispatcher("manage_employees.jsp");
	    		if(dispatcher != null) {
	    			dispatcher.forward(request, response);
	    		}
	    		 
	        } catch (Exception e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
        }//if
        else {
        	RequestDispatcher dispatcher = request.getRequestDispatcher("/sign-out");
    		if(dispatcher != null) {
    			dispatcher.forward(request, response);
    		}
        }
    }
}
