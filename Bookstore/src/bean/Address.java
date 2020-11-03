package bean;

import java.io.Serializable;

public class Address implements Serializable {
	private static final long serialVersionUID = 1L;
    private String street;
    private String city;
    private String state;
    private String customer_UserId;

    public String getStreet() {
        return street;
    }
    public void setStreet(String street) {
        this.street = street;
    }
    public String getCity() {
        return city;
    }
    public void setCity(String city) {
        this.city = city;
    }
    public String getState() {
        return state;
    }
    public void setState(String state) {
        this.state = state;
    }
    public String getCustomerUserId() {
        return customer_UserId;
    }
    public void setCustomerUserId(String customer_UserId) {
        this.customer_UserId = customer_UserId;
    }
}
