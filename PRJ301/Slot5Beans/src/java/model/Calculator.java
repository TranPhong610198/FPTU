package model;


import java.io.Serializable;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author tphon
 */
public class Calculator implements Serializable {

    private double num1=0, num2=0;
    private String op="+";

    public Calculator() {
    }

    public double getNum1() {
        return num1;
    }

    public double getNum2() {
        return num2;
    }

    public String getOp() {
        return op;
    }

    public void setNum1(double num1) {
        this.num1 = num1;
    }

    public void setNum2(double num2) {
        this.num2 = num2;
    }

    public void setOp(String op) {
        this.op = op;
    }

    public String getResult() {
        String t = "";
        switch (op) {
            case "+" ->
                t = "Sum: " + (num1 + num2);
            case "-" ->
                t = "Subs: " + (num1 - num2);
            case "x" ->
                t = "Multiply " + (num1 * num2);
            case ":" -> {
                if (num2 == 0) {
                    t = "Not divide by zero";
                } else {
                    t = "Divide: " + String.format("%.2f", num1+num2);
                }

            }
        }

        return t;
    }
    
    public double getArea(){
        return num1*num2;
    }
    
}
