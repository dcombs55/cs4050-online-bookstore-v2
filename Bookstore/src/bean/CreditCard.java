package bean;

import java.io.Serializable;

public class CreditCard implements Serializable {
	private static final long serialVersionUID = 1L;
    private String cardNum;
    private String cardType;
    private String expDate;
    private String CCV;
    
    public String getCardNum() {
        return cardNum;
    }
    public void setCardNum(String cardNum) {
        this.cardNum = cardNum;
    }
    public String getCardType() {
        return cardType;
    }
    public void setCardType(String cardType) {
        this.cardType = cardType;
    }
    public String getExpDate() {
        return expDate;
    }
    public void setExpDate(String expDate) {
        this.expDate = expDate;
    }
    public String getCCV() {
    	return CCV;
    }
	public void setCCV(String cCV) {
		// TODO Auto-generated method stub	
		this.CCV = cCV;
	}
}