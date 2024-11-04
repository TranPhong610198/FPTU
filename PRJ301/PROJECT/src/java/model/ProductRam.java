/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tphon
 */
public class ProductRam {
    int productId, ramId;

    public ProductRam() {
    }

    public ProductRam(int productId, int ramId) {
        this.productId = productId;
        this.ramId = ramId;
    }

    public int getProductId() {
        return productId;
    }

    public int getRamId() {
        return ramId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public void setRamId(int ramId) {
        this.ramId = ramId;
    }
    
}
