package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.Promotion;

public class PromotionDao {
	public int registerPromo(Promotion promotion) throws ClassNotFoundException {
		String INSERT_PROMOTIONS_SQL = "INSERT INTO Bookstore.Promotion" + 
				" (PromoID, PromoType, PromoCode, PromoAmount, TotalUsers, StartDate, EndDate) VALUES " +
				" (?, ?, ?, ?, ?, ?, ?);"; 
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
				
			PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PROMOTIONS_SQL)){
			preparedStatement.setString(1, promotion.getPromoID());
			preparedStatement.setInt(2, promotion.getType());
			preparedStatement.setString(3, promotion.getCode());
			preparedStatement.setDouble(4, promotion.getAmount());
			preparedStatement.setInt(5, promotion.getTotalUsers());
			preparedStatement.setString(6, promotion.getStartDate());
			preparedStatement.setString(7, promotion.getEndDate());
			
			System.out.println(preparedStatement);
			result = preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			printSQLException(e);
		}
		
		return result;
	}
	
	public boolean checkPromoID (Promotion promotion) throws ClassNotFoundException{
		String CHECK_ID_SQL = "SELECT * FROM Bookstore.Promotion WHERE PromoID=?;";
		
		ResultSet result;
		boolean validID = false;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try (Connection connection = DriverManager
			.getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");
				
			PreparedStatement preparedStatement = connection.prepareStatement(CHECK_ID_SQL)){
			preparedStatement.setString(1, promotion.getPromoID());
			
			System.out.println(preparedStatement);
			result = preparedStatement.executeQuery();
			if(!result.next()) {
				validID = true;
			}
			
		} catch (SQLException e) {
			printSQLException(e);
		}
		
		return validID;
	}
	
	public boolean checkCode (Promotion promotion) throws ClassNotFoundException{
		String CHECK_CODE_SQL = "SELECT * FROM Bookstore.Promotion WHERE PromoCode=?;";
		
		ResultSet result;
		boolean validCode = false;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try (Connection connection = DriverManager
			.getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");
				
			PreparedStatement preparedStatement = connection.prepareStatement(CHECK_CODE_SQL)){
			preparedStatement.setString(1, promotion.getCode());
			
			System.out.println(preparedStatement);
			result = preparedStatement.executeQuery();
			if(!result.next()) {
				validCode = true;
			}
			
		} catch (SQLException e) {
			printSQLException(e);
		}
		
		if(promotion.getCode().indexOf(" ") != -1)
			validCode = false;
		
		return validCode;
	}
	
	public boolean checkAmount (Promotion promotion) throws ClassNotFoundException{
		ResultSet result;
		boolean validAmount = false;
		
		if(!(promotion.getType() == 2 && promotion.getAmount() > 100)) {
			validAmount = true;
		}
		
		return validAmount;
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
