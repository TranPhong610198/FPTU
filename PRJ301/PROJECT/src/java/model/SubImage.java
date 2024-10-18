/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tphon
 */
public class SubImage {
    int subImageId;
    int productId;
    String subImagePath;

    public SubImage() {
    }

    public SubImage(int subImageId, int productId, String subImagePath) {
        this.subImageId = subImageId;
        this.productId = productId;
        this.subImagePath = subImagePath;
    }

    public int getSubImageId() {
        return subImageId;
    }

    
    public int getProductId() {
        return productId;
    }

    public String getSubImagePath() {
        return subImagePath;
    }

    public void setSubImageId(int subImageId) {
        this.subImageId = subImageId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public void setSubImagePath(String subImagePath) {
        this.subImagePath = subImagePath;
    }
    
}
