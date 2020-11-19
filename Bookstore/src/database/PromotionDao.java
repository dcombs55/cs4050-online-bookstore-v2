package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.Customer;
import bean.Promotion;

public class PromotionDao {
	private void registerPromo(Promotion promo) {
		// TODO: This
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
