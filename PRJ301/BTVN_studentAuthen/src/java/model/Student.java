/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tphon
 */
public class Student {
    String id, name, dob, address;
    boolean gender;

    public Student() {
    }

    public Student(String id, String name, String dob, String address, boolean gender) {
        this.id = id;
        this.name = name;
        this.dob = dob;
        this.address = address;
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public String getDob() {
        return dob;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public boolean isGender() {
        return gender;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }
    
     
}
