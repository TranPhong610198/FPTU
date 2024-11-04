/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tphon
 */
public class Ram {
    int ramId;
    String ramSize;

    public Ram() {
    }

    public Ram(int ramId, String ramSize) {
        this.ramId = ramId;
        this.ramSize = ramSize;
    }

    public int getRamId() {
        return ramId;
    }

    public String getRamSize() {
        return ramSize;
    }

    public void setRamId(int ramId) {
        this.ramId = ramId;
    }

    public void setRamSize(String ramSize) {
        this.ramSize = ramSize;
    }
    
}
