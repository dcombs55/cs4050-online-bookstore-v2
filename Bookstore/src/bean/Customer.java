
package bean;

import java.io.Serializable;

public class Customer implements Serializable {
	private static final long serialVersionUID = 1L;
    private String firstName;
    private String lastName;
    private String username;
    private String password;
    private String emailAddress;
    private String phoneNumber;
    private int activateCode;
    private CreditCard creditCard;
    private Address address;
    private int accountType;
    private String SubscribedtoPromotions;

    public String getFirstName() {
        return firstName;
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getLastName() {
        return lastName;
    }
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getEmailAddress() {
        return emailAddress;
    }
    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
   public String getSubscribedtoPromotions()//yes or no
{
return SubscribedtoPromotions;
}

    public int getActivateCode() {
        return activateCode;
    }
    public void setActivateCode(int activateCode) {
        this.activateCode = activateCode;
    }
    
    public CreditCard getCreditCard() {
    	return creditCard;
    }
    public void setCreditCard(CreditCard creditCard) {
    	this.creditCard = creditCard;
    }
    
    public Address getAddress() {
    	return address;
    }
    public void setAddress(Address address) {
    	this.address = address;
    }
    
    public int getAccountType() {
    	return this.accountType;
    }
    public void setAccountType(int accountType) {
    	this.accountType = accountType;
    }

}
