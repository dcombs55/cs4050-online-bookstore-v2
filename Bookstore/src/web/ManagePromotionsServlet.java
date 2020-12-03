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
import database.AdminDao;

@WebServlet("/manage-promotions")
public class ManagePromotionsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
    private AdminDao adminDao;
    
    public void init() {
    	adminDao = new AdminDao();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String manageAction = request.getParameter("manage-action");
        String[] promotionsToManage = request.getParameterValues("promotion");
        String[] newData = new String[6];
        newData[0] = request.getParameter("promoType");
        newData[1] = request.getParameter("promoCode");
        newData[2] = request.getParameter("amount");
        newData[3] = request.getParameter("reset");
        newData[4] = request.getParameter("startDate");
        newData[5] = request.getParameter("endDate");
        try {
        	if(promotionsToManage != null) {
        		if(manageAction.equals("Delete")) {
                	adminDao.deletePromos(promotionsToManage);
        		}
        		else if(manageAction.equals("Edit")) {
                	adminDao.editPromos(promotionsToManage, newData);
        		// TODO: need to do error check if manageAction is null
        		}
	    		RequestDispatcher dispatcher = request.getRequestDispatcher("/promotions-list");
	    		if(dispatcher != null) {
	    			dispatcher.forward(request, response);
	    		}
    		}
    		 
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
 
    }
}
