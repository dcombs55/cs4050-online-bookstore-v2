package database;

import java.sql.*;

import bean.Customer;
import bean.CreditCard;

public class CreditCardEncryption {
	/*	COMMAND TO DECRYPT -------------------------------------------------------------------------------------
	 * 		String DECRYPT_CARDNUM = "replace(cast(aes_decrypt" +
	 *		"(CardNum, '\" + key + \"') as char(100)), Salt, ''), Salt from Bookstore.CreditCard";
	 */
	public int addCreditCard(Customer customer, CreditCard creditCard) throws ClassNotFoundException{
		int result = 0;
		Class.forName("com.mysql.cj.jdbc.Driver");
		String cardNum = creditCard.getCardNum();
		
		String salt = customer.getUsername() + "NaCl";
		String key = "123OpenSesame"; // This will always be the key
		
		String INSERT_CREDIT_SQL = "INSERT INTO Bookstore.CreditCard" + 
				" (UserID, CardNum, CardType, ExpDate, Salt) VALUES " +
				" (?, ?, ?, ?, ?);";
		String ENCRYPT_CARDNUM = "aes_encrypt" +
				"(concat('" + cardNum + "', '" + salt + "'), '" +
				key + "');";
		
		try (Connection connection = DriverManager
				.getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CREDIT_SQL)){
				preparedStatement.setString(1, customer.getUsername());
				preparedStatement.setString(2, ENCRYPT_CARDNUM);
				preparedStatement.setString(3, creditCard.getCardType());
				preparedStatement.setString(4, creditCard.getExpDate());
				preparedStatement.setString(5, salt);
				
				System.out.println(preparedStatement);
				result = preparedStatement.executeUpdate();
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
