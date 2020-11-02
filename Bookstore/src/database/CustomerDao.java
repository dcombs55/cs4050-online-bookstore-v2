package database;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.Customer;

public class CustomerDao {
	
	public int registerCustomer(Customer customer) throws ClassNotFoundException{
		String INSERT_CUSTOMERS_SQL = "INSERT INTO Bookstore.Customer" + 
				" (UserID, FirstName, LastName, Email, Password, AccountState) VALUES " +
				" (?, ?, ?, ?, ?, ?);";
		
		int result = 0;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try (Connection connection = DriverManager
			.getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");
				
			PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMERS_SQL)){
			preparedStatement.setString(1, customer.getUsername());
			preparedStatement.setString(2, customer.getFirstName());
			preparedStatement.setString(3, customer.getLastName());
			preparedStatement.setString(4, customer.getEmailAddress());
			preparedStatement.setString(5, customer.getPassword());
			preparedStatement.setString(6, "Active");
			
			System.out.println(preparedStatement);
			result = preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			printSQLException(e);
		}
		
		return result;
	}
	
	public boolean checkCustomerUsername (Customer customer) throws ClassNotFoundException{
		String CHECK_USERNAME_SQL = "SELECT * FROM Bookstore.Customer WHERE UserID=?;";
		
		ResultSet result;
		boolean validUsername = false;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try (Connection connection = DriverManager
			.getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");
				
			PreparedStatement preparedStatement = connection.prepareStatement(CHECK_USERNAME_SQL)){
			preparedStatement.setString(1, customer.getUsername());
			
			System.out.println(preparedStatement);
			result = preparedStatement.executeQuery();
			if(!result.next()) {
				validUsername = true;
			}
			
		} catch (SQLException e) {
			printSQLException(e);
		}
		
		return validUsername;
	}
	
	public boolean checkCustomerEmail (Customer customer) throws ClassNotFoundException{
		String CHECK_EMAIL_SQL = "SELECT * FROM Bookstore.Customer WHERE Email=?;";
		
		ResultSet result;
		boolean validEmail = false;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try (Connection connection = DriverManager
			.getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");
				
			PreparedStatement preparedStatement = connection.prepareStatement(CHECK_EMAIL_SQL)){
			preparedStatement.setString(1, customer.getEmailAddress());
			
			System.out.println(preparedStatement);
			result = preparedStatement.executeQuery();
			if(!result.next()) {
				validEmail = true;
			}
			
		} catch (SQLException e) {
			printSQLException(e);
		}
		
		return validEmail;
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
