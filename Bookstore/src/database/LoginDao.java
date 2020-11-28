package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.LoginBean;

public class LoginDao {
	 public boolean validateCustomer(LoginBean loginBean) throws ClassNotFoundException {
	        boolean status = false;

	        Class.forName("com.mysql.jdbc.Driver");
//	        String salt = loginBean.getUsername() + "sour";
//	        String key = "OpenSesame123"; // This will always be the key
//	  		String DECRYPT_Password = "replace(cast(aes_decrypt" +
//	 			"(Password, '\" + key + \"') as char(100)), salt, ''), salt from Bookstore.Customer";
	        try (Connection connection = DriverManager
	            .getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");

	            // Step 2:Create a statement using connection object
	            PreparedStatement preparedStatement = connection
	            .prepareStatement("select * from Bookstore.Customer where UserID= ? and Password = ? and (AccountType = ? OR AccountType = ?)"
	            		+ " and (AccountState = ? OR AccountState = ?)")) {
	            preparedStatement.setString(1, loginBean.getUsername());
	            preparedStatement.setString(2, loginBean.getPassword());
	            preparedStatement.setInt(3, 1);
	            preparedStatement.setInt(4, 2);
	            preparedStatement.setString(5, "Active");
	            preparedStatement.setString(6, "Inactive");

	            System.out.println(preparedStatement);
	            ResultSet rs = preparedStatement.executeQuery();
	            status = rs.next();

	        } catch (SQLException e) {
	            // process sql exception
	            printSQLException(e);
	        }
	        return status;
	    }
	 
	 public boolean validateAdmin(LoginBean loginBean) throws ClassNotFoundException {
	        boolean status = false;

	        Class.forName("com.mysql.jdbc.Driver");
//	        String salt = loginBean.getUsername() + "sour";
//	        String key = "OpenSesame123"; // This will always be the key
//	  		String DECRYPT_Password = "replace(cast(aes_decrypt" +
//	 			"(Password, '\" + key + \"') as char(100)), salt, ''), salt from Bookstore.Customer";
	        try (Connection connection = DriverManager
	            .getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");

	            // Step 2:Create a statement using connection object
	            PreparedStatement preparedStatement = connection
	            .prepareStatement("select * from Bookstore.Customer where UserID= ? and Password = ? and AccountType = ? and (AccountState = ? or AccountState = ?)")) {
	            preparedStatement.setString(1, loginBean.getUsername());
	            preparedStatement.setString(2, loginBean.getPassword());
	            preparedStatement.setInt(3, 3);
	            preparedStatement.setString(4, "Active");
	            preparedStatement.setString(5, "Inactive");

	            System.out.println(preparedStatement);
	            ResultSet rs = preparedStatement.executeQuery();
	            status = rs.next();

	        } catch (SQLException e) {
	            // process sql exception
	            printSQLException(e);
	        }
	        return status;
	    }
	 
	 public boolean resetPassword(String username, String oldPassword, String newPassword) throws ClassNotFoundException {
		 Class.forName("com.mysql.jdbc.Driver");
		 try (Connection connection = DriverManager.getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");
		 	    PreparedStatement ps = connection
		 	    .prepareStatement("update Bookstore.Customer set Password=? where UserID=? AND Password=?")) {
		 		ps.setString(3, oldPassword);
		 	    ps.setString(2, username);
		 	    ps.setString(1, newPassword);
		 	    int i = ps.executeUpdate();
		 	    if(i > 0){
		 	    	return true;
		 	    }
		 } catch (SQLException e) {
		 	    printSQLException(e);
		 }
		 
		 return false;
	 }

	    private void printSQLException(SQLException ex) {
	        for (Throwable e: ex) {
	            if (e instanceof SQLException) {
	                e.printStackTrace(System.err);
	                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
	                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
	                System.err.println("Message: " + e.getMessage());
	                Throwable t = ex.getCause();
	                while (t != null) {
	                    System.out.println("Cause: " + t);
	                    t = t.getCause();
	                }
	            }
	        }
	    }
}
