import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
*
*@author Adamya Singh
*
/
@MultipartConfig
public clas EditProfileServlet extends HttpServlet

{
/**
*Processes requests for HTTP<code> GET</code> and <code>Post</code> methods
*@param request servlet request
*param response servlet response
*@throws ServletException if a servlet - specific erorr occurs
*@throws IOexception if an I/O error occurs
*/
protected void processRequest(HttpServletRequest request,HttpServletResponse response
 throws ServletException, IOException
{
response.setContentType("text/html; charset = UTF-8");
try(PrintWriter out = response.getWriter())
{
System.out.println("<!DocType html>");
System.out.println("<html>");
System.out.println("<head>");
System.out.println("<title>Servlet EditProfileServlet</title>");
System.out.println("<body>");
System.out.println("<h1>Servlet EditServlet at " + request.getContextPath()+ "<h1>");

//fetch data
 String CustomerEmail = request.getParamater("emailAddress");
 String CustomerfirstName = request.getParamater("firstName");
 String CustomerlastName = request.getParamater("lastName");
 String Customerpassword = request.getParamater("password");
 Int CustomercreditCard = request.getParamater("creditCard");
 String CustomerbillingAddress = request.getParamater("billingAddress");
 Int Customerphone = request.getParamater("phone");



//get the user from the session

HttpSession r = request.getSession();
Customer customer = (Customer)r.getAttribute("Customer");
customer.setEmail(emailAddress);
customer.setfirstName(firstName);
customer.setlastName(lastName);
customer.setpassword(password);
customer.setcreditCard(creditCard);
customer.setbillingAddress(billingAddress);
customer.setphone = setphone(phone);


//update database
CustomerDao customerDao = new CustomerDao(ConnectionProvider.getConnection());
boolean ans = cusotmerDao.updateCustomer(customer);

if(ans)
{
Systme.out.println("updated to db");
}
else
{
System.out.println("Not Updated");
}

System.out.println("<body>");
System.out.println("<html>");
}
}
}


//Add this code to Customer DAO
/**
public boolean updateCustomer(Customer customer)
{
boolean f = false;
try
{

String query = "update customer set firstName=?, lastName=?, phone=?, password=?, creditCard=?,billingAddress=? where UserID=?";
PreparedStatement p = con.prepareStatement(query);
p.setString(1,customer.getfirstName());
p.setString(2,customer.getlastName());
p.setString(3,customer.getpassword());
p.setInt(4,customer.getphone());
p.setInt(5,customer.getcreditCard());
p.setString(6,customer.getbillingAddress());
p.setInt(7,customer.getUserID());

p.executeUpdate();


f=true;

}
catch(Exception e) 
{
e.printStackTrace();
}
return f;
}
*/
