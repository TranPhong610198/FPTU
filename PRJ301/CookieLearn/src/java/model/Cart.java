/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tphon
 */
public class Cart {

    public List<Product> getCart(String txt) {
        List<Product> list = new ArrayList<>();
        try {
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split("/");
                for (String i : s) {
                    String[] n = i.split(":");
                    String id = n[0];
                    int quantity = Integer.parseInt(n[1]);
                    Product p = new Product(id, "", 1, quantity);
                    list.add(p);
                }
            }
        } catch (NumberFormatException e) {
        }
        return list;
    }
}
