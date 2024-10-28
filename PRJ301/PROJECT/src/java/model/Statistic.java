/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tphon
 */
public class Statistic {
    int statId, productId, totalSale;
    double revenue;

    public Statistic() {
    }

    public Statistic(int statId, int productId, int totalSale, double revenue) {
        this.statId = statId;
        this.productId = productId;
        this.totalSale = totalSale;
        this.revenue = revenue;
    }

    public int getProductId() {
        return productId;
    }

    public double getRevenue() {
        return revenue;
    }

    public int getStatId() {
        return statId;
    }

    public int getTotalSale() {
        return totalSale;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public void setRevenue(double revenue) {
        this.revenue = revenue;
    }

    public void setStatId(int statId) {
        this.statId = statId;
    }

    public void setTotalSale(int totalSale) {
        this.totalSale = totalSale;
    }
    
}
