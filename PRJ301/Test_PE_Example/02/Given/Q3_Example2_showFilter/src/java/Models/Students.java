/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author tphon
 */
public class Students {
    String code, name, dob, gender, subject;

    public Students() {
    }

    public Students(String code, String name, String dob, String gender, String subject) {
        this.code = code;
        this.name = name;
        this.dob = dob;
        this.gender = gender;
        this.subject = subject;
    }

    public String getCode() {
        return code;
    }

    public String getDob() {
        return dob;
    }

    public String getGender() {
        return gender;
    }

    public String getName() {
        return name;
    }

    public String getSubject() {
        return subject;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }
    
}
