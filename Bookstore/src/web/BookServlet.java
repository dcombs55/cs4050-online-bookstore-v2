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
import database.BookDao;
import bean.Customer;
import bean.Address;
import bean.CreditCard;
import java.util.*;

@WebServlet("/book-search")
public class BookServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
    private BookDao bookDao;
    
    public void init() {
    	bookDao = new BookDao();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    	HttpSession session = request.getSession();
    	HashMap<String, List<String>> returnData;
        try {
        	if(request.getAttribute("no-search") != null) {
        		returnData = bookDao.getAllBooks();
        		request.removeAttribute("no-search");
        	}else {
        		String bookName = request.getParameter("title");
                String author = request.getParameter("author");
                String isbn = request.getParameter("isbn");
                returnData = bookDao.getBooks(bookName, author, isbn);
        	}
        	
        	request.setAttribute("returnData", returnData);
        	RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
    		if(dispatcher != null) {
    			dispatcher.forward(request, response);
    		}
    		 
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
    protected void service(HttpServletRequest request, HttpServletResponse   response) throws ServletException, IOException {
        doPost(request, response);
    }
}
