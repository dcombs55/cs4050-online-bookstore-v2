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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.CustomerDao;
import bean.Customer;

@WebServlet("/register")
public class CustomerServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
    private CustomerDao customerDao;
    
    public void init() {
    	customerDao = new CustomerDao();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String emailAddress = request.getParameter("emailAddress");
        
        Customer customer = new Customer();
        customer.setFirstName(firstName);
        customer.setLastName(lastName);
        customer.setUsername(username);
        customer.setPassword(password);
        customer.setEmailAddress(emailAddress);
        
        try {
            customerDao.registerCustomer(customer);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        //Setting up credentials to send confirmation email
        String result;
        String from = ""; //change name to sendingEmail
        String to = emailAddress; //change name to recipientEmail
   
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true"); //sets if the email needs to be authenticated
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com"); //your email host
        properties.put("mail.smtp.port", "587"); //the port of your email
        
        String myAccountEmail = "";
        String password1 = "";
        //when using gMail you need to toggle it so that it allows less secure apps to access (fix this later)
        
        Session mailSession = Session.getInstance(properties, new Authenticator() {
        	@Override
        	protected PasswordAuthentication getPasswordAuthentication() {
        		return new PasswordAuthentication(myAccountEmail, password1);
        	}
        });
        
        try { //sending confirmation email
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(mailSession);
            
            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));
            
            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO,
                                     new InternetAddress(to));
            // Set Subject: header field
            message.setSubject("This is the Subject Line!");
            
            // Now set the actual message
            message.setText("This is actual message");
            
            // Send message
            Transport.send(message);
            result = "Sent message successfully....";
         } catch (MessagingException mex) {
            mex.printStackTrace();
            result = "Error: unable to send message....";
         }
        
        response.sendRedirect("confirmation.jsp");
    	        
    }
}
