package database;

import java.sql.*;

import bean.Customer;

public class CreditCardEncryption {
	
	public int addCreditCard(Customer customer) throws ClassNotFoundException{
		int result = 0;
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try (Connection connection = DriverManager
				.getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");
					){
				
			} catch (SQLException e) {
				printSQLException(e);
			}
		
		return result;
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
