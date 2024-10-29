/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tphon
 */
public class Order {
    int orderId, userId;
    double total;
    String orderStatus;
    String date;
    public Order() {
    }

    public Order(int orderId, int userId, double total, String orderStatus) {
        this.orderId = orderId;
        this.userId = userId;
        this.total = total;
        this.orderStatus = orderStatus;
    }

    public Order(int orderId, int userId, double total, String orderStatus, String date) {
        this.orderId = orderId;
        this.userId = userId;
        this.total = total;
        this.orderStatus = orderStatus;
        this.date = date;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
 
    
    
    public int getOrderId() {
        return orderId;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public double getTotal() {
        return total;
    }

    public int getUserId() {
        return userId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    
}
