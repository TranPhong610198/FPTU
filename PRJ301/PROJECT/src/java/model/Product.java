/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tphon
 */
import java.math.BigDecimal;
import java.util.List;

public class Product {

    private int id;
    private String name;
    private String description;
    private BigDecimal price;
    private int stock;
    private int brandId;
    private int categoryId;
    private String imageUrl;
    private List<String> subImages;
    private List<Brand> listBrand;
    private List<Category> listCategory;
    private List<SubImage> listSubImages;

    

    // Constructor không đối số
    public Product() {
    }

    // Constructor có đối số
    public Product(int id, String name, String description, BigDecimal price, int stock, int brandId, int categoryId, String imageUrl) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.stock = stock;
        this.brandId = brandId;
        this.categoryId = categoryId;
        this.imageUrl = imageUrl;
    }

    public Product(String name, String description, BigDecimal price, int stock, int brandId, int categoryId, String imageUrl) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.stock = stock;
        this.brandId = brandId;
        this.categoryId = categoryId;
        this.imageUrl = imageUrl;
    }

    public Product(int id, String name, String description, BigDecimal price, int stock, int brandId, int categoryId, String imageUrl, List<String> subImages, List<Brand> listBrand, List<Category> listCategory) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.stock = stock;
        this.brandId = brandId;
        this.categoryId = categoryId;
        this.imageUrl = imageUrl;
        this.subImages = subImages;
        this.listBrand = listBrand;
        this.listCategory = listCategory;
    }
    
    public List<String> getSubImagesInList() {
        List<String> result = null;
        for (SubImage temp : listSubImages){
            if (temp.productId == id){
                result.add(temp.subImagePath);
            }
        }
        return subImages;
    }

    // Getters và Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public List<String> getSubImages() {
        return subImages;
    }

    public List<Brand> getListBrand() {
        return listBrand;
    }

    public List<Category> getListCategory() {
        return listCategory;
    }

    public List<SubImage> getListSubImages() {
        return listSubImages;
    }

    
    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getBrandId() {
        return brandId;
    }

    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public void setSubImages(List<String> subImages) {
        this.subImages = subImages;
    }

    public void setListBrand(List<Brand> listBrand) {
        this.listBrand = listBrand;
    }

    public void setListCategory(List<Category> listCategory) {
        this.listCategory = listCategory;
    }

    public void setListSubImages(List<SubImage> listSubImages) {
        this.listSubImages = listSubImages;
    }

    
    // Phương thức tiện ích khác nếu cần
    @Override
    public String toString() {
        return "Product{"
                + "id=" + id
                + ", name='" + name + '\''
                + ", description='" + description + '\''
                + ", price=" + price
                + ", stock=" + stock
                + ", brand='" + brandId + '\''
                + ", categoryId=" + categoryId
                + ", imageUrl='" + imageUrl + '\''
                + '}';
    }
}
