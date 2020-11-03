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

@WebServlet("/register")
public class CustomerServlet extends HttpServlet {

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
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String emailAddress = request.getParameter("emailAddress");
        String phoneNumber = request.getParameter("phone");
        phoneNumber = phoneNumber.replaceAll("-", "");
        
        Random r = new Random();
        int activateCode = r.nextInt(8999 + 1) + 1000;
        System.out.println(activateCode);
        
    	Customer customer = new Customer();
        customer.setFirstName(firstName);
        customer.setLastName(lastName);
        customer.setUsername(username);
        customer.setPassword(password);
        customer.setEmailAddress(emailAddress); 
        customer.setPhoneNumber(phoneNumber);
        customer.setActivateCode(activateCode);
        
        try {
        	boolean validUsername = customerDao.checkCustomerUsername(customer);
            boolean validEmail = customerDao.checkCustomerEmail(customer);
            boolean passwordsMatch = password.equals(confirmPassword);
            
        	if(validUsername && validEmail && passwordsMatch) {
        		customerDao.registerCustomer(customer);
        		session = request.getSession();
        		session.setMaxInactiveInterval(600);
        		session.setAttribute("username", username);
        		session.setAttribute("emailAddress", emailAddress);
                response.sendRedirect("confirmation.jsp");
        	}
        	else {
        		session = request.getSession();
        		String errors = "Errors: <ul>";
        		if(!validUsername) {
        			errors = errors + "<li>This username is already taken. Please choose another username.</li>";
        		}
        		if(!validEmail) {
        			errors = errors + "<li>This email address is already being used.</li>";
        		}
        		if(!passwordsMatch) {
        			errors = errors + "<li>Passwords do not match!</li>";
        		}
        		errors = errors + "</ul>";
            	session.setAttribute("errors", errors);
            	response.sendRedirect("registration.jsp");
        	} 
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    

        //Setting up credentials to send confirmation email
//        String result;
//        String from = ""; //change name to sendingEmail
//        String to = emailAddress; //change name to recipientEmail
//   
//        Properties properties = new Properties();
//        properties.put("mail.smtp.auth", "true"); //sets if the email needs to be authenticated
//        properties.put("mail.smtp.starttls.enable", "true");
//        properties.put("mail.smtp.host", "smtp.gmail.com"); //your email host
//        properties.put("mail.smtp.port", "587"); //the port of your email
//        
//        String myAccountEmail = "";
//        String password1 = "";
//        //when using gMail you need to toggle it so that it allows less secure apps to access (fix this later)
//        
//        Session mailSession = Session.getInstance(properties, new Authenticator() {
//        	@Override
//        	protected PasswordAuthentication getPasswordAuthentication() {
//        		return new PasswordAuthentication(myAccountEmail, password1);
//        	}
//        });
//        
//        try { //sending confirmation email
//            // Create a default MimeMessage object.
//            MimeMessage message = new MimeMessage(mailSession);
//            
//            // Set From: header field of the header.
//            message.setFrom(new InternetAddress(from));
//            
//            // Set To: header field of the header.
//            message.addRecipient(Message.RecipientType.TO,
//                                     new InternetAddress(to));
//            // Set Subject: header field
//            message.setSubject("This is the Subject Line!");
//            
//            // Now set the actual message
//            message.setText("This is actual message");
//            
//            // Send message
//            Transport.send(message);
//            result = "Sent message successfully....";
//         } catch (MessagingException mex) {
//            mex.printStackTrace();
//            result = "Error: unable to send message....";
//         }
    	        
    }
}
