package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import bean.Promotion;

public class BookDao {
	public HashMap<String, List<String>> getAllBooks() throws ClassNotFoundException {

	 	HashMap<String, List<String>> returnData = new HashMap<>();
	 	List<String> bookIDData = new ArrayList<>();
	 	List<String> bookNameData = new ArrayList<>();
	 	List<String> authorData = new ArrayList<>();
	 	List<String> isbnData = new ArrayList<>();
	 	List<String> pictureURLData = new ArrayList<>();
	 	
	 	ResultSet rs;

        Class.forName("com.mysql.jdbc.Driver");
        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection
            .prepareStatement("select * from Bookstore.Book")) {
            System.out.println(preparedStatement);
            
            rs = preparedStatement.executeQuery();
            while(rs.next()) {
            	bookIDData.add(rs.getString("BookID"));
            	bookNameData.add(rs.getString("BookName"));
            	authorData.add(rs.getString("Author"));
            	isbnData.add(rs.getString("IBSN"));
            	pictureURLData.add(rs.getString("PictureURL"));
            }
            rs.close();
            returnData.put("BookID", bookIDData);
            returnData.put("BookName", bookNameData);
            returnData.put("Author", authorData);
            returnData.put("ISBN", isbnData);
            returnData.put("PictureURL", pictureURLData);

            return returnData;
        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return returnData;
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
