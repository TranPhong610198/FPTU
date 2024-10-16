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
    String code, name, dob;
    int num;

    public Student() {
    }

    public Student(String code, String name, String dob, int num) {
        this.code = code;
        this.name = name;
        this.dob = dob;
        this.num = num;
    }

    public String getCode() {
        return code;
    }

    public String getDob() {
        return dob;
    }

    public String getName() {
        return name;
    }

    public int getNum() {
        return num;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setNum(int num) {
        this.num = num;
    }
    
    
     
    
}
