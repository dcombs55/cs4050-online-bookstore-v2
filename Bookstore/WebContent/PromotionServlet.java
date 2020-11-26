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

import database.PromotionDao;
import bean.Promotion;

@WebServlet("/add-promo")
public class PromotionServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
    private PromotionDao promotionDao;
    
    public void init() {
    	promotionDao = new PromotionDao();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	
    	HttpSession session = request.getSession();
    	if(session.getAttribute("errors") != null) {
			session.removeAttribute("errors");
		}
        String promoID = request.getParameter("promoID");
        String promoType = request.getParameter("promoType");
        String promoCode = request.getParameter("promoCode");
        String amount = request.getParameter("amount");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        
    	Promotion promotion = new Promotion();
        promotion.setPromoID(promoID);
        promotion.setType(Integer.parseInt(promoType));
        promotion.setCode(promoCode);
        promotion.setAmount(Integer.parseInt(amount));
        promotion.setStartDate(startDate); 
        promotion.setEndDate(endDate);
        try {
        	boolean validID = promotionDao.checkPromoID(promotion);
            boolean validCode = promotionDao.checkCode(promotion);
            boolean validAmount = promotionDao.checkAmount(promotion);
            
        	if(validID && validCode && validAmount) {
        		promotionDao.registerPromo(promotion);
        		
                response.sendRedirect("add_promotion.jsp");
        	}//if
        	else {
        		session = request.getSession();
        		String errors = "Errors: <ul>";
        		if(!validID) {
        			errors = errors + "<li>This promotion ID is already taken.</li>";
        		}
        		if(!validCode) {
        			errors = errors + "<li>This promotion code is already being used.</li>";
        		}
        		if(!validAmount) {
        			errors = errors + "<li>This amount is not valid. Please enter a number greater than zero.</li>";
        		}
        		errors = errors + "</ul>";
            	session.setAttribute("errors", errors);
            	response.sendRedirect("add_promotion.jsp");
        	}//else
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
 
    }
}
