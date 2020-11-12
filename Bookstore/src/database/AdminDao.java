package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.LoginBean;

public class AdminDao {
	 public ResultSet getEmployees() throws ClassNotFoundException {
	        ResultSet rs;

	        Class.forName("com.mysql.jdbc.Driver");
//	        String salt = loginBean.getUsername() + "sour";
//	        String key = "OpenSesame123"; // This will always be the key
//	  		String DECRYPT_Password = "replace(cast(aes_decrypt" +
//	 			"(Password, '\" + key + \"') as char(100)), salt, ''), salt from Bookstore.Customer";
	        try (Connection connection = DriverManager
	            .getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");

	            // Step 2:Create a statement using connection object
	            PreparedStatement preparedStatement = connection
	            .prepareStatement("select * from Bookstore.Customer where (AccountType = ? OR AccountType = ?) ")) {
	            preparedStatement.setInt(1, 2);
	            preparedStatement.setInt(2, 3);

	            System.out.println(preparedStatement);
	            rs = preparedStatement.executeQuery();
	            if(rs.next()) {
	            	return rs;
	            }

	        } catch (SQLException e) {
	            // process sql exception
	            printSQLException(e);
	        }
	        return null;
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
