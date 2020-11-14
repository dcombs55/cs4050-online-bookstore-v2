package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import bean.LoginBean;

public class AdminDao {
	 public HashMap<String, List<String>> getEmployees() throws ClassNotFoundException {
		 	
		 	HashMap<String, List<String>> returnData = new HashMap<>();
		 	List<String> userNameData = new ArrayList<>();
		 	List<String> firstNameData = new ArrayList<>();
		 	List<String> lastNameData = new ArrayList<>();
		 	List<String> emailData = new ArrayList<>();
		 	List<String> phoneNumberData = new ArrayList<>();
		 	List<String> accountStateData = new ArrayList<>();
		 	List<String> accountTypeData = new ArrayList<>();
		 	
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
	            while(rs.next()) {
	            	String accountType = "";
	            	if(rs.getInt("AccountType") == 2) {
	            		accountType = "Employee";
	            	}else {
	            		accountType = "Admin";
	            	}
	            	
	            	userNameData.add(rs.getString("UserID"));
	            	firstNameData.add(rs.getString("FirstName"));
	            	lastNameData.add(rs.getString("LastName"));
	            	emailData.add(rs.getString("Email"));
	            	phoneNumberData.add(rs.getString("PhoneNumber"));
	            	accountStateData.add(rs.getString("AccountState"));
	            	accountTypeData.add(accountType);
	            }
	            rs.close();
	            returnData.put("UserID", userNameData);
	            returnData.put("FirstName", firstNameData);
	            returnData.put("LastName", lastNameData);
	            returnData.put("Email", emailData);
	            returnData.put("PhoneNumber", phoneNumberData);
	            returnData.put("AccountState", accountStateData);
	            returnData.put("AccountType", accountTypeData);

	            return returnData;
	        } catch (SQLException e) {
	            // process sql exception
	            printSQLException(e);
	        }
	        return returnData;
	    }
	 
	 	public void suspendEmployees(String[] employeesToManage) throws ClassNotFoundException{
	 		String SUSPEND_ACCOUNT_SQL = "UPDATE Bookstore.Customer SET AccountState=? WHERE UserID=?;";

	        Class.forName("com.mysql.jdbc.Driver");
	        
	        try (Connection connection = DriverManager
	            .getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");

	            PreparedStatement preparedStatement = connection
	            .prepareStatement(SUSPEND_ACCOUNT_SQL)) {
	            preparedStatement.setString(1, "Suspended");
	            
	            for(int i = 0; i < employeesToManage.length; i++) {
	            	preparedStatement.setString(2, employeesToManage[i]);
	            	preparedStatement.executeUpdate();
	            }
	            
	        } catch (SQLException e) {
	            // process sql exception
	            printSQLException(e);
	        }
	 	}
	 	
	 	public void promoteEmployees(String[] employeesToManage) throws ClassNotFoundException{
	 		String PROMOTE_ACCOUNT_SQL = "UPDATE Bookstore.Customer SET AccountType=? WHERE UserID=?;";

	        Class.forName("com.mysql.jdbc.Driver");
	        
	        try (Connection connection = DriverManager
	            .getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");

	            PreparedStatement preparedStatement = connection
	            .prepareStatement(PROMOTE_ACCOUNT_SQL)) {
	            
	            for(int i = 0; i < employeesToManage.length; i++) {
	            	int accountType = getEmployeeAccountType(employeesToManage[i]);
	            	if(accountType == 2) {
	            		accountType = 3;
	            	}
	            	preparedStatement.setInt(1, accountType);
	            	
	            	preparedStatement.setString(2, employeesToManage[i]);
	            	preparedStatement.executeUpdate();
	            }
	            
	        } catch (SQLException e) {
	            // process sql exception
	            printSQLException(e);
	        }
	 	}
	 	
	 	public void dePromoteEmployees(String[] employeesToManage) throws ClassNotFoundException{
	 		String DEPROMOTE_ACCOUNT_SQL = "UPDATE Bookstore.Customer SET AccountType=? WHERE UserID=?;";

	        Class.forName("com.mysql.jdbc.Driver");
	        
	        try (Connection connection = DriverManager
	            .getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");

	            PreparedStatement preparedStatement = connection
	            .prepareStatement(DEPROMOTE_ACCOUNT_SQL)) {
	            
	            for(int i = 0; i < employeesToManage.length; i++) {
	            	int accountType = getEmployeeAccountType(employeesToManage[i]);
	            	if(accountType == 2) {//depromote employee to customer
	            		accountType = 1;
	            	}
	            	else if(accountType == 3) {//depromote admin to employee
	            		accountType = 2;
	            	}
	            	preparedStatement.setInt(1, accountType);
	            	
	            	preparedStatement.setString(2, employeesToManage[i]);
	            	preparedStatement.executeUpdate();
	            }
	            
	        } catch (SQLException e) {
	            // process sql exception
	            printSQLException(e);
	        }
	 	}
	 	
	 	private int getEmployeeAccountType(String employee) throws ClassNotFoundException{
	 		String GET_EMPLOYEE_SQL = "select * from Bookstore.Customer where UserID = ?;";
	 		
	 		ResultSet rs;
	 		
	 		int accountType = -1;
	 		
	        Class.forName("com.mysql.jdbc.Driver");
	        
	        try (Connection connection = DriverManager
	            .getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");

	            PreparedStatement preparedStatement = connection
	            .prepareStatement(GET_EMPLOYEE_SQL)) {
	            preparedStatement.setString(1, employee);
	            
	            rs = preparedStatement.executeQuery();
	            
	            if(rs.next()) {
	            	return rs.getInt("AccountType");
	            }
	            
	            rs.close();
	            
	        } catch (SQLException e) {
	            // process sql exception
	            printSQLException(e);
	        }
	        
	        return accountType;
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
