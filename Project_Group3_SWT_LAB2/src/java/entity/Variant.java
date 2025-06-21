package entity;

import java.util.Date;

/**
 *
 * @author nguye
 */
public class Variant {
    private int id;
    private int productId;
    private Color color;
    private Size size;
    private int quantity;
    private Date lastRestockDate;
    private String sku; 

    public Variant(int id, int productId, Color color, Size size, int quantity, Date lastRestockDate, String sku) {
        this.id = id;
        this.productId = productId;
        this.color = color;
        this.size = size;
        this.quantity = quantity;
        this.lastRestockDate = lastRestockDate;
        this.sku = sku;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public Size getSize() {
        return size;
    }

    public void setSize(Size size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getLastRestockDate() {
        return lastRestockDate;
    }

    public void setLastRestockDate(Date lastRestockDate) {
        this.lastRestockDate = lastRestockDate;
    }

    @Override
    public String toString() {
        return "Variant{" + "id=" + id + ", productId=" + productId + ", color=" + color + ", size=" + size + ", quantity=" + quantity + ", lastRestockDate=" + lastRestockDate + ", sku=" + sku + '}';
    }
}