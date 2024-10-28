/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tphon
 */
public class CartItem {

    private int cartItemId;
    private int cartId;
    private int productId;
    private int quantity;

    // Thông tin bổ sung về sản phẩm (có thể cần cho việc hiển thị trong giỏ hàng)
    private String productName;
    private String productImage;
    private double price;

    // Constructor không tham số
    public CartItem() {
    }

    // Constructor với các tham số chính
    public CartItem(int cartItemId, int cartId, int productId, int quantity) {
        this.cartItemId = cartItemId;
        this.cartId = cartId;
        this.productId = productId;
        this.quantity = quantity;
    }

    // Constructor với các tham số đầy đủ, bao gồm thông tin bổ sung về sản phẩm
    public CartItem(int cartItemId, int cartId, int productId, int quantity, String productName, double price, String productImage) {
        this.cartItemId = cartItemId;
        this.cartId = cartId;
        this.productId = productId;
        this.quantity = quantity;
        this.productName = productName;
        this.price = price;
        this.productImage = productImage;
    }

    // Getter và Setter cho các thuộc tính
    
    public String getProductImage() {
        return productImage;
    }

    public int getCartItemId() {
        return cartItemId;
    }

    public void setCartItemId(int cartItemId) {
        this.cartItemId = cartItemId;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    
    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    // Phương thức tính tổng giá trị của mục trong giỏ hàng
    public double getTotalPrice() {
        return this.price * this.quantity;
    }

    @Override
    public String toString() {
        return "CartItem{"
                + "cartItemId=" + cartItemId
                + ", cartId=" + cartId
                + ", productId=" + productId
                + ", quantity=" + quantity
                + ", productName='" + productName + '\''
                + ", price=" + price
                + '}';
    }
}
