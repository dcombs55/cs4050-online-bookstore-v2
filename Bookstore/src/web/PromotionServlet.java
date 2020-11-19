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
import database.CustomerDao;
import database.AdminDao;

@WebServlet("/addPromo")
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
        		
                response.sendRedirect("confirmation.jsp");
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
	    
	 
                 try
             {
                 String stp = customerDao.getSubscribedtoPromotions();
        	
        	if(stp=="yes") 
                       {
        		customerDao.registerCustomer(customer);
        		session = request.getSession();
        		session.setMaxInactiveInterval(600);
        		session.setAttribute("username", username);
        		session.setAttribute("emailAddress", emailAddress);

            String result;
            String from = washingtont.bookstore@gmail.com;
            String to = emailAddress;

   
    	   Properties properties = new Properties();
           properties.put("mail.smtp.auth", "true"); //sets if the email needs to be authenticated
           properties.put("mail.smtp.starttls.enable", "true");
           properties.put("mail.smtp.host", "smtp.gmail.com"); //your email host
           properties.put("mail.smtp.port", "587"); //the port of your email
 
        String myAccountEmail = washingtont.bookstore@gmail.com";
        String password1 = "softwareengr2";
       Session mailSession = Session.getInstance(properties, new Authenticator() {
    		    	@Override
    		    	protected PasswordAuthentication getPasswordAuthentication() {
    		    		return new PasswordAuthentication(myAccountEmail, password1);
    		    	}
    		    });
try
{


   ArrayList email= new ArrayList();
   while(rs.next()) 
{
          email.add(rs.getString("Email"));
      }


    MimeMessage message = new MimeMessage(mailSession);

   InternetAddress[] address = new InternetAddress[email.size()];
    for (int i = 0; i < email.size(); i++) {
        address[i] = new InternetAddress(email.get(i));
    }
     message.setRecipients(Message.RecipientType.TO, address);

  message.SetSubject("Promotion!");

 String messageContent = "<h1>Hi " + firstName + ", <h1>"
    		        		+ "<center><p> Dear Washington T. Bookstore customer"
    		        		+ "<br/>Check out our latest promotion"
    		        		+ "<br/>" + AdminDao.getPromotion()+ "</p></center>";
    		        
   message.setContent(messageContent, "text/html");

    Transport.send(message);
    result = "Sent message successfully....";
}
catch(MessagingException mex)
{
mex.printStackTrace();
result  = "Error : unable to send message...";
}


   
 
    }
}
