/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.List;

/**
 *
 * @author nguye
 */
import java.util.Set;
import java.util.TreeSet;
import java.util.stream.Collectors;

public class Inventory {

    private int productId;
    private String productName;
    private String category;
    private Set<Color> colors;  // Dùng Set để loại bỏ trùng lặp
    private Set<Size> sizes;
    private int totalQuantity;

    public Inventory(int productId, String productName, String category, Set<Color> colors, Set<Size> sizes, int totalQuantity) {
        this.productId = productId;
        this.productName = productName;
        this.category = category;
        this.colors = new TreeSet<>((c1, c2) -> c1.getName().compareToIgnoreCase(c2.getName())); 
        this.sizes = new TreeSet<>((s1, s2) -> s1.getName().compareToIgnoreCase(s2.getName()));  
        this.totalQuantity = totalQuantity;
    }

    public int getProductId() {
        return productId;
    }

    public String getProductName() {
        return productName;
    }

    public String getCategory() {
        return category;
    }

    public Set<Color> getColors() {
        return colors;
    }

    public Set<Size> getSizes() {
        return sizes;
    }

    public int getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(int totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    // Chuyển danh sách màu sắc thành chuỗi (loại bỏ trùng lặp)
    public String getColorString() {
        return colors.stream().map(Color::getName).collect(Collectors.joining(", "));
    }

    // Chuyển danh sách kích thước thành chuỗi (loại bỏ trùng lặp)
    public String getSizeString() {
        return sizes.stream().map(Size::getName).collect(Collectors.joining(", "));
    }
}
