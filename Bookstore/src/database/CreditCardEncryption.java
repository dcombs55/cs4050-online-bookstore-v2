package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.Customer;

public class CreditCardEncryption {
	
	private String key = "@2334dgdfg@#$%dsgdf"; 
    private String user = ""; 
    private String key2 = "@1567sedf#2@"; 
    private String pass = "";
    
    public String getKey() {return key;} 
    public String getUser() {return user;} 
    public String getKey2() {return key2;} 
    public String getPass() {return pass;} 
	
	public int encrypt(Customer customer) throws ClassNotFoundException{
		
		
		catch (SQLException e) {
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
