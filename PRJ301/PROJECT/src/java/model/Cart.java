/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tphon
 */
public class Cart {
    int cart_id, user_id;

    public Cart() {
    }

    public Cart(int cart_id, int user_id) {
        this.cart_id = cart_id;
        this.user_id = user_id;
    }

    public int getCart_id() {
        return cart_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
    
}
