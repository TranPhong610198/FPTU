/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


package model;
import java.sql.Date;
/**
 *
 * @author tphon
 */
public class Employee {
    int id;
    String name;
    Date dob;
    boolean gender;
    private Department department;

    public Employee() {
    }

    public Employee(int id, String name, Date dob, boolean gender, Department department) {
        this.id = id;
        this.name = name;
        this.dob = dob;
        this.gender = gender;
        this.department = department;
    }

    public Department getDepartment() {
        return department;
    }

    public Date getDob() {
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

    public void setDepartment(Department department) {
        this.department = department;
    }

    public void setDob(Date dob) {
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
