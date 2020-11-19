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
import bean.Customer;
import bean.Address;
import bean.CreditCard;
import java.util.*;

@WebServlet("/manage-employees")
public class ManageEmployeesServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
    private AdminDao adminDao;
    
    public void init() {
    	adminDao = new AdminDao();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String manageAction = request.getParameter("manage-action");
        String[] employeesToManage = request.getParameterValues("employee");
        
        HttpSession session = request.getSession();
		String adminUser = (String)session.getAttribute("username");
        
        if(adminUser != null) {
        	try {
            	if(employeesToManage != null) {
            		if(manageAction.equals("Suspend")) {
                   		adminDao.suspendAccounts(adminUser, employeesToManage);
                    }else if(manageAction.equals("Unsuspend")) {
                    	adminDao.unsuspendAccounts(adminUser, employeesToManage);
                    }else if(manageAction.equals("Promote")) {
                    	adminDao.promoteAccounts(adminUser, employeesToManage);
                    }else if(manageAction.equals("De-promote")) {
                    	adminDao.dePromoteEmployees(adminUser, employeesToManage);
                    }
            	}
               	
        		RequestDispatcher dispatcher = request.getRequestDispatcher("/employees");
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
    }//doPost
}
