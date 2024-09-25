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
    private int id, dob;
    private String name;
    private boolean gender;

    public Student() {
    }

    public Student(int id, int dob, String name, boolean gender) {
        this.id = id;
        this.dob = dob;
        this.name = name;
        this.gender = gender;
    }

    public int getDob() {
        return dob;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public boolean isGender() {
        return gender;
    }
    
    public void setDob(int dob) {
        this.dob = dob;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    
    
}
