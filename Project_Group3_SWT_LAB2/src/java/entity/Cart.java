package entity;

import java.sql.Timestamp;
import java.util.List;

public class Cart {
    private int id;
    private int userId;
    private Timestamp createdAt;
    private List<CartItem> items;
    private double totalAmount;

    // Constructor mặc định
    public Cart() {
    }

    // Constructor đầy đủ
    public Cart(int id, int userId, Timestamp createdAt) {
        this.id = id;
        this.userId = userId;
        this.createdAt = createdAt;
    }

    // Getter và setter cho id
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    // Getter và setter cho userId  
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    // Getter và setter cho createdAt
    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    // Getter và setter cho items
    public List<CartItem> getItems() {
        return items;
    }

    public void setItems(List<CartItem> items) {
        this.items = items;
        calculateTotal();
    }

    // Getter cho totalAmount
    public double getTotalAmount() {
        return totalAmount;
    }

    // Method tính tổng tiền
    public void calculateTotal() {
        this.totalAmount = 0;
        if (items != null) {
            for (CartItem item : items) {
                this.totalAmount += item.getProductPrice() * item.getQuantity();
            }
        }
    }
}