/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tphon
 */
public class OrderItem {
    int orderItemId, orderId, productId, quantity;
    double price;
    
    Product product;

    public OrderItem() {
    }

    public OrderItem(int orderItemId, int orderId, int productId, int quantity, double price) {
        this.orderItemId = orderItemId;
        this.orderId = orderId;
        this.productId = productId;
        this.quantity = quantity;
        this.price = price;
    }

    public OrderItem(int orderItemId, int orderId, int productId, int quantity, double price, Product product) {
        this.orderItemId = orderItemId;
        this.orderId = orderId;
        this.productId = productId;
        this.quantity = quantity;
        this.price = price;
        this.product = product;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getOrderId() {
        return orderId;
    }

    public int getOrderItemId() {
        return orderItemId;
    }

    public double getPrice() {
        return price;
    }

    public int getProductId() {
        return productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public void setOrderItemId(int orderItemId) {
        this.orderItemId = orderItemId;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
}
