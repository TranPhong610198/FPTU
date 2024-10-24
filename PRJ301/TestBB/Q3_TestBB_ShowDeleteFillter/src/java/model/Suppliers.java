/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tphon
 */
public class Suppliers {
      Boolean gender;
      String address, code, name, birth;

    public Suppliers() {
    }

    public Suppliers(Boolean gender, String address, String code, String name, String birth) {
        this.gender = gender;
        this.address = address;
        this.code = code;
        this.name = name;
        this.birth = birth;
    }

    public String getAddress() {
        return address;
    }

    public String getBirth() {
        return birth;
    }

    public String getCode() {
        return code;
    }

    public Boolean getGender() {
        return gender;
    }

    public String getName() {
        return name;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public void setName(String name) {
        this.name = name;
    }
     
     
    }
