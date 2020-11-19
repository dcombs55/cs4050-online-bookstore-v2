package bean;

import java.io.Serializable;

public class Promotion implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String promoID;
	private int type;
	private String code;
	private double amount;
	private int totalUsers;
	private String startDate;
	private String endDate;
	
	public String getPromoID() {
		return promoID;
	}
	
	public void setPromoID(String promoID) {
		this.promoID = promoID;
	}
	
	public int getType() {
		return type;
	}
	
	public void setType(int type) {
		this.type = type;
	}
	
	public String getCode() {
		return code;
	}
	
	public void setCode(String code) {
		this.code = code;
	}
	
	public double getAmount() {
		return amount;
	}
	
	public void setAmount(double amount) {
		this.amount = amount;
	}
	
	public int getTotalUsers() {
		return totalUsers;
	}
	
	public void setTotalUsers(int totalUsers) {
		this.totalUsers = totalUsers;
	}
	
	public String getStartDate() {
		return startDate;
	}
	
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	
	public String getEndDate() {
		return endDate;
	}
	
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
}
