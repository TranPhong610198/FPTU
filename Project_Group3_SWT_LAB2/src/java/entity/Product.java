/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tphon
 */
public class Product {

    private int id;
    private String title;
    private int categoryId; 
    private BigDecimal originalPrice;
    private BigDecimal salePrice;
    private String thumbnail;
    private String status;
    private int stock;
    private String description;
    private int comboGroupId;
    private boolean isCombo;
    private String createdAt;
    private String updatedAt;

    private List<Product> comboProducts;
    private List<String> subImages;

    public Product() {
    }

    public Product(int id, String title, int categoryId, BigDecimal originalPrice, BigDecimal salePrice, String thumbnail, String status, int stock, String description, int comboGroupId, boolean isCombo, String createdAt, String updatedAt, List<Product> comboProducts, List<String> subImages) {
        this.id = id;
        this.title = title;
        this.categoryId = categoryId;
        this.originalPrice = originalPrice;
        this.salePrice = salePrice;
        this.thumbnail = thumbnail;
        this.status = status;
        this.stock = stock;
        this.description = description;
        this.comboGroupId = comboGroupId;
        this.isCombo = isCombo;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.comboProducts = comboProducts;
        this.subImages = subImages;
    }

    public Product(int id, String title, int categoryId, BigDecimal originalPrice, BigDecimal salePrice, String thumbnail, String status, int stock, String description, int comboGroupId, boolean isCombo, String createdAt, String updatedAt) {
        this.id = id;
        this.title = title;
        this.categoryId = categoryId;
        this.originalPrice = originalPrice;
        this.salePrice = salePrice;
        this.thumbnail = thumbnail;
        this.status = status;
        this.stock = stock;
        this.description = description;
        this.comboGroupId = comboGroupId;
        this.isCombo = isCombo;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public Product(int id, String title, int categoryId, BigDecimal originalPrice, BigDecimal salePrice, String thumbnail, String status, int stock) {
        this.id = id;
        this.title = title;
        this.categoryId = categoryId;
        this.originalPrice = originalPrice;
        this.salePrice = salePrice;
        this.thumbnail = thumbnail;
        this.status = status;
        this.stock = stock;
    }

    public int getComboGroupId() {
        return comboGroupId;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public String getDescription() {
        return description;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public boolean isIsCombo() {
        return isCombo;
    }

    public void setComboGroupId(int comboGroupId) {
        this.comboGroupId = comboGroupId;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setIsCombo(boolean isCombo) {
        this.isCombo = isCombo;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }

    // Getters và Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public BigDecimal getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(BigDecimal originalPrice) {
        this.originalPrice = originalPrice;
    }

    public BigDecimal getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(BigDecimal salePrice) {
        this.salePrice = salePrice;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public void setComboProducts(List<Product> comboProducts) {
        this.comboProducts = comboProducts;
    }

    public List<Product> getComboProducts() {
        return comboProducts;
    }

    public List<String> getSubImages() {
        return subImages;
    }

    public void setSubImages(List<String> subImages) {
        this.subImages = subImages;
    }

}
