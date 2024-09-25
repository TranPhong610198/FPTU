/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tphon
 */
public class Category {
    int id;
    String name, describe;

    public Category() {
    }

    public Category(int id, String name, String describe) {
        this.id = id;
        this.name = name;
        this.describe = describe;
    }

    public String getDescribe() {
        return describe;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    
}
