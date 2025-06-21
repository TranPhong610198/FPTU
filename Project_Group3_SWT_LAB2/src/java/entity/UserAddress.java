package entity;

public class UserAddress {
    private int id;
    private int userId;
    private String recipientName;
    private String phone;
    private String address;
    private boolean isDefault;
    
    public UserAddress() {
    }
    
    public UserAddress(int id, int userId, String recipientName, String phone, String address, boolean isDefault) {
        this.id = id;
        this.userId = userId;
        this.recipientName = recipientName;
        this.phone = phone;
        this.address = address;
        this.isDefault = isDefault;
    }

    // Getters and setters for all fields (including id and userId)

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getRecipientName() {
        return recipientName;
    }

    public void setRecipientName(String recipientName) {
        this.recipientName = recipientName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

 public boolean getIsDefault() {
        return isDefault;
    }
    
    // You can keep both setters for flexibility
    public void setIsDefault(boolean isDefault) {
        this.isDefault = isDefault;
    }
    
    public boolean isDefault() {
        return isDefault;
    }
    
    public void setDefault(boolean isDefault) {
        this.isDefault = isDefault;
    }


    @Override
    public String toString() {  //Good for debugging
        return "UserAddress{" +
                "id=" + id +
                ", userId=" + userId +
                ", recipientName='" + recipientName + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", isDefault=" + isDefault +
                '}';
    }
}