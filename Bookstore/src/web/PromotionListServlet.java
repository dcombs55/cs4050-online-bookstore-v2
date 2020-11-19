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

@WebServlet("/manage-promotions")
public class PromotionListServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
    private AdminDao adminDao;
    
    public void init() {
    	adminDao = new AdminDao();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        try {
        	HashMap<String, List<String>> returnData = adminDao.getPromotions();
    		request.setAttribute("returnData", returnData);
    		
    		//need to do an error check here if no returnData
    		
    		RequestDispatcher dispatcher = request.getRequestDispatcher("manage_promotions.jsp");
    		if(dispatcher != null) {
    			dispatcher.forward(request, response);
    		}
    		 
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
 
    }
}

