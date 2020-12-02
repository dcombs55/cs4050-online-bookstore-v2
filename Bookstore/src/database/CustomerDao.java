package database;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.Customer;
import bean.CreditCard; 
import bean.Address;

public class CustomerDao 
{
	/*	COMMAND TO DECRYPT -------------------------------------------------------------------------------------
	String salt = customer.getUsername() + "NaCl";
  	String DECRYPT_CARDNUM = "replace(cast(aes_decrypt" +
 			"(CardNum, '\" + key + \"') as char(100)), salt, ''), salt from Bookstore.CreditCard";
 */
	public int registerCustomer(Customer customer) throws ClassNotFoundException{
		String INSERT_CUSTOMERS_SQL = "INSERT INTO Bookstore.Customer" + 
				" (UserID, FirstName, LastName, Email, PhoneNumber, Password, ActivateCode, AccountState, AccountType,Subscribed) VALUES " +
				" (?, ?, ?, ?, ?, ?, ?, ?, ?,?);"; 
        /* Encryption
        String salt = customer.getUsername(); // This is the universal salt formula for all users
		String key = "321OS"; // This will always be the key
		String ENCRYPT_PASS = "aes_encrypt" +
				"('" + customer.getPassword() + salt +"', '" +
				key + "')";*/
		int result = 0;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try (Connection connection = DriverManager
			.getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");
				
			PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMERS_SQL)){
			preparedStatement.setString(1, customer.getUsername());
			preparedStatement.setString(2, customer.getFirstName());
			preparedStatement.setString(3, customer.getLastName());
			preparedStatement.setString(4, customer.getEmailAddress());
			preparedStatement.setString(5, customer.getPhoneNumber());
			preparedStatement.setString(6, customer.getPassword());
			//preparedStatement.setString(6, ENCRYPT_PASS);
			preparedStatement.setInt(7, customer.getActivateCode());
			preparedStatement.setString(8, "Inactive");
			preparedStatement.setInt(9, 1);
                        preparedStatement.setString(10,customer.getSubscribed());//added this column to database for promotions
			
			System.out.println(preparedStatement);
			result = preparedStatement.executeUpdate();
			
			setCustomerAddress(customer.getAddress());
			setCustomerCreditCard(customer.getUsername(), customer.getCreditCard());
			
		} catch (SQLException e) {
			printSQLException(e);
		}
		
		return result;
	}



	public int setCustomerAddress(Address customerAddress) throws ClassNotFoundException{
		String INSERT_ADDRESS_SQL = "INSERT INTO Bookstore.Address" + 
				" (Street, City, State, Customer_UserID) VALUES " +
				" (?, ?, ?, ?);";
		
		int result = 0;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try (Connection connection = DriverManager
			.getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");
				
			PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ADDRESS_SQL)){
			preparedStatement.setString(1, customerAddress.getStreet());
			preparedStatement.setString(2, customerAddress.getCity());
			preparedStatement.setString(3, customerAddress.getState());
			preparedStatement.setString(4, customerAddress.getCustomerUserId());
			
			System.out.println(preparedStatement);
			result = preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			printSQLException(e);
		}
		
		return result;
	}
	
	public int setCustomerCreditCard(String username, CreditCard customerCard) throws ClassNotFoundException{
		String INSERT_CARD_SQL = "INSERT INTO Bookstore.CreditCard" + 
				" (CardNum, CardType, ExpDate, UserID, CCV) VALUES " +
				" (?, ?, ?, ?, ?);";
		
		int result = 0;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try (Connection connection = DriverManager
			.getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");
				
			PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CARD_SQL)){
			preparedStatement.setString(1, customerCard.getCardNum());
			preparedStatement.setString(2, customerCard.getCardType());
			preparedStatement.setString(3, customerCard.getExpDate());
			preparedStatement.setString(4, username);
			preparedStatement.setString(5, customerCard.getCCV());
			
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
	
	public boolean checkActivationCode (String username, String emailAddress, int enteredCode) throws ClassNotFoundException{
		String CHECK_EMAIL_SQL = "SELECT * FROM Bookstore.Customer WHERE UserID=? AND Email=? AND ActivateCode=?;";
		
		ResultSet result;
		boolean validActivationCode = false;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try (Connection connection = DriverManager
			.getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");
				
			PreparedStatement preparedStatement = connection.prepareStatement(CHECK_EMAIL_SQL)){
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, emailAddress);
			preparedStatement.setInt(3, enteredCode);
			
			System.out.println(preparedStatement);
			result = preparedStatement.executeQuery();
			if(result.next()) {
				validActivationCode = true;
			}
			
		} catch (SQLException e) {
			printSQLException(e);
		}
		
		return validActivationCode;
	}
	
	public void updateAccountState(String username, String emailAddress, String accountState) throws ClassNotFoundException{
		String UPDATE_ACCOUNT_STATE_SQL = "UPDATE Bookstore.Customer SET AccountState=? WHERE UserID=? AND Email=?;";
		
		int result;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try (Connection connection = DriverManager
			.getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");
				
			PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ACCOUNT_STATE_SQL)){
			preparedStatement.setString(1, accountState);
			preparedStatement.setString(2, username);
			preparedStatement.setString(3, emailAddress);
			
			System.out.println(preparedStatement);
			result = preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			printSQLException(e);
		}
		
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