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
    String code, name;
    int num;

    public Student() {
    }

    public Student(String code, String name, int num) {
        this.code = code;
        this.name = name;
        this.num = num;
    }

    public String getCode() {
        return code;
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



    public void setName(String name) {
        this.name = name;
    }

    public void setNum(int num) {
        this.num = num;
    }
    
    
     
    
}
