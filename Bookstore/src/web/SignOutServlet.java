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

@WebServlet("/sign-out")
public class SignOutServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
    private AdminDao adminDao;
    private CustomerDao customerDao;
    
    public void init() {
    	adminDao = new AdminDao();
    	customerDao = new CustomerDao();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    	HttpSession session = request.getSession();
        
		if(session != null && session.getAttribute("adminUsername") != null) {
			session.removeAttribute("adminUsername");
		}
		else if(session != null && session.getAttribute("username") != null) {
			session.removeAttribute("username");
		}
		response.sendRedirect("homepage.html");
    }
}
