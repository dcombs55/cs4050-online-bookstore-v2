package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import bean.LoginBean;
import bean.Promotion;

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

	public HashMap<String, List<String>> getCustomers() throws ClassNotFoundException {

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
	            .prepareStatement("select * from Bookstore.Customer where AccountType = ?")) {
	            preparedStatement.setInt(1, 1);

	            System.out.println(preparedStatement);
	            rs = preparedStatement.executeQuery();
	            while(rs.next()) {
	            	String accountType = "";
	            	if(rs.getInt("AccountType") == 1) {
	            		accountType = "Customer";
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

	public HashMap<String, List<String>> getPromotions() throws ClassNotFoundException {

	 	HashMap<String, List<String>> returnData = new HashMap<>();
	 	List<String> promoIDData = new ArrayList<>();
	 	List<String> promoTypeData = new ArrayList<>();
	 	List<String> promoCodeData = new ArrayList<>();
	 	List<String> promoAmountData = new ArrayList<>();
	 	List<String> totalUsersData = new ArrayList<>();
	 	List<String> startDateData = new ArrayList<>();
	 	List<String> endDateData = new ArrayList<>();

	 	ResultSet rs;

        Class.forName("com.mysql.jdbc.Driver");
//        String salt = loginBean.getUsername() + "sour";
//        String key = "OpenSesame123"; // This will always be the key
//  		String DECRYPT_Password = "replace(cast(aes_decrypt" +
// 			"(Password, '\" + key + \"') as char(100)), salt, ''), salt from Bookstore.Customer";
        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection
            .prepareStatement("select * from Bookstore.Promotion ")) {

            System.out.println(preparedStatement);
            rs = preparedStatement.executeQuery();
            while(rs.next()) {
            	promoIDData.add(rs.getString("PromoID"));
            	promoTypeData.add(rs.getInt("PromoType") + "");
            	promoCodeData.add(rs.getString("PromoCode"));
            	promoAmountData.add(rs.getDouble("PromoAmount") + "");
            	totalUsersData.add(rs.getInt("TotalUsers") + "");
            	startDateData.add(rs.getString("StartDate"));
            	endDateData.add(rs.getString("EndDate"));
            }
            rs.close();
            returnData.put("PromoID", promoIDData);
            returnData.put("PromoType", promoTypeData);
            returnData.put("PromoCode", promoCodeData);
            returnData.put("PromoAmount", promoAmountData);
            returnData.put("TotalUsers", totalUsersData);
            returnData.put("StartDate", startDateData);
            returnData.put("EndDate", endDateData);

            return returnData;
        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return returnData;
    }
	
 	public void suspendAccounts(String adminUser, String[] accountsToManage) throws ClassNotFoundException{
 		String SUSPEND_ACCOUNT_SQL = "UPDATE Bookstore.Customer SET AccountState=? WHERE UserID=?;";

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");

            PreparedStatement preparedStatement = connection
            .prepareStatement(SUSPEND_ACCOUNT_SQL)) {
            preparedStatement.setString(1, "Suspended");

            for(int i = 0; i < accountsToManage.length; i++) {
            	if(!adminUser.equals(accountsToManage[i])) {
            		preparedStatement.setString(2, accountsToManage[i]);
	            	preparedStatement.executeUpdate();
            	}
            }

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
 	}

 	public void unsuspendAccounts(String adminUser, String[] accountsToManage) throws ClassNotFoundException{
 		String SUSPEND_ACCOUNT_SQL = "UPDATE Bookstore.Customer SET AccountState=? WHERE UserID=?;";

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");

            PreparedStatement preparedStatement = connection
            .prepareStatement(SUSPEND_ACCOUNT_SQL)) {
            preparedStatement.setString(1, "Active");

            for(int i = 0; i < accountsToManage.length; i++) {
            	if(!adminUser.equals(accountsToManage[i])) {
            		preparedStatement.setString(2, accountsToManage[i]);
	            	preparedStatement.executeUpdate();
            	}
            }

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
 	}

 	public void promoteAccounts(String adminUser, String[] accountsToManage) throws ClassNotFoundException{
 		String PROMOTE_ACCOUNT_SQL = "UPDATE Bookstore.Customer SET AccountType=? WHERE UserID=?;";

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");

            PreparedStatement preparedStatement = connection
            .prepareStatement(PROMOTE_ACCOUNT_SQL)) {

            for(int i = 0; i < accountsToManage.length; i++) {
            	if(!adminUser.equals(accountsToManage[i])) {
            		int accountType = getEmployeeAccountType(accountsToManage[i]);
	            	if(accountType == 1) {
	            		accountType = 2;
	            	}
	            	else if(accountType == 2) {
	            		accountType = 3;
	            	}
	            	preparedStatement.setInt(1, accountType);

	            	preparedStatement.setString(2, accountsToManage[i]);
	            	preparedStatement.executeUpdate();
            	}
            }

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
 	}

 	public void dePromoteEmployees(String adminUser, String[] employeesToManage) throws ClassNotFoundException{
 		String DEPROMOTE_ACCOUNT_SQL = "UPDATE Bookstore.Customer SET AccountType=? WHERE UserID=?;";

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");

            PreparedStatement preparedStatement = connection
            .prepareStatement(DEPROMOTE_ACCOUNT_SQL)) {

            for(int i = 0; i < employeesToManage.length; i++) {
            	if(!adminUser.equals(employeesToManage[i])) {
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

 	public void deletePromos(String[] promotionsToManage) throws ClassNotFoundException{
	 		String DELETE_PROMOTION_SQL = "DELETE FROM Bookstore.Promotion WHERE PromoID=?;";

	        Class.forName("com.mysql.jdbc.Driver");

	        try (Connection connection = DriverManager
	            .getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");

	            PreparedStatement preparedStatement = connection
	            .prepareStatement(DELETE_PROMOTION_SQL)) {

	            for(int i = 0; i < promotionsToManage.length; i++) {
	            	preparedStatement.setString(1, promotionsToManage[i]);
	            	preparedStatement.executeUpdate();
	            }

	        } catch (SQLException e) {
	            // process sql exception
	            printSQLException(e);
	        }
	 	}
 	
 	public void editPromos(String[] promotionsToManage, String[] newData) throws ClassNotFoundException{
 		int codeInd = 0, amntInd = 0, restInd = 0, stDtInd = 0, edDtInd = 0, promInd = 1; // Index values of the parameters
 		
 		String EDIT_PROMOTION_SQL = "UPDATE Bookstore.Promotion SET "; // This statement will be built depending on null values
				//"PromoType=?, PromoCode=?, PromoAmount=?, TotalUsers=?, StartDate=?, EndDate=? WHERE PromoCode=?";
 		if(newData[0] != null) {
 	 		EDIT_PROMOTION_SQL = EDIT_PROMOTION_SQL.concat("PromoType=?, ");
 	 		codeInd++;
 	 		amntInd++;
 	 		restInd++;
 	 		stDtInd++;
 	 		edDtInd++;
 	 		promInd++;
 		}
 		if(newData[1] != null && promotionsToManage.length == 1) { // No more than one promotion may have a particular code
 	 		EDIT_PROMOTION_SQL = EDIT_PROMOTION_SQL.concat("PromoCode=?, ");
 	 		codeInd++;
 	 		amntInd++;
 	 		restInd++;
 	 		stDtInd++;
 	 		edDtInd++;
 	 		promInd++;
 		}
 		if(newData[2] != null) {
 	 		EDIT_PROMOTION_SQL = EDIT_PROMOTION_SQL.concat("PromoAmount=?, ");
 	 		amntInd++;
 	 		restInd++;
 	 		stDtInd++;
 	 		edDtInd++;
 	 		promInd++;
 		}
 		if(newData[3] != null) {
 	 		EDIT_PROMOTION_SQL = EDIT_PROMOTION_SQL.concat("TotalUsers=?, ");
 	 		restInd++;
 	 		stDtInd++;
 	 		edDtInd++;
 	 		promInd++;
 		}
 		if(newData[4] != null) {
 	 		EDIT_PROMOTION_SQL = EDIT_PROMOTION_SQL.concat("StartDate=?, ");
 	 		stDtInd++;
 	 		edDtInd++;
 	 		promInd++;
 		}
 		if(newData[5] != null) {
 	 		EDIT_PROMOTION_SQL = EDIT_PROMOTION_SQL.concat("EndDate=?,");
 	 		edDtInd++;
 	 		promInd++;
 		}
 		EDIT_PROMOTION_SQL = EDIT_PROMOTION_SQL.substring(0,EDIT_PROMOTION_SQL.lastIndexOf(","));
 		EDIT_PROMOTION_SQL = EDIT_PROMOTION_SQL.concat(" WHERE PromoID=?");
 		if(edDtInd == 0 || promotionsToManage.length == 0) // If this index never updated, everything was null
 			return;
 		Class.forName("com.mysql.jdbc.Driver");
 		System.out.println(EDIT_PROMOTION_SQL);
 		System.out.println(newData[0] + " index: " + 1);
 		System.out.println(newData[1] + " index: " + codeInd);
 		System.out.println(newData[2] + " index: " + amntInd);
 		System.out.println(newData[3] + " index: " + restInd);
 		System.out.println(newData[4] + " index: " + stDtInd);
 		System.out.println(newData[5] + " index: " + edDtInd);
        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");

            PreparedStatement preparedStatement = connection
            .prepareStatement(EDIT_PROMOTION_SQL)) {
        	if(newData[0] != null)
        		preparedStatement.setInt(1, Integer.parseInt(newData[0]));
        	if(newData[1] != null && promotionsToManage.length == 1)
        		preparedStatement.setString(codeInd, newData[1]);
        	if(newData[2] != null)
        		preparedStatement.setInt(amntInd, Integer.parseInt(newData[2]));
        	if(newData[3] != null)
        		preparedStatement.setInt(restInd, 0);
        	if(newData[4] != null)
        		preparedStatement.setString(stDtInd, newData[4]);
        	if(newData[5] != null)
        		preparedStatement.setString(edDtInd, newData[5]);
        	        	
            for(int i = 0; i < promotionsToManage.length; i++) {
            	preparedStatement.setString(promInd, promotionsToManage[i]);
            	preparedStatement.executeUpdate();
            }

        } catch (SQLException e) {
            // process sql exception
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
