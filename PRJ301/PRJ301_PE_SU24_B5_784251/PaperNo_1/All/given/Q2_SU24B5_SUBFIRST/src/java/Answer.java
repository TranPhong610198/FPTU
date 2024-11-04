/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author tphon
 */
public class Answer {
    String str, result;
    int n;

    public Answer() {
    }

    public Answer(String str, String result, int n) {
        this.str = str;
        this.result = result;
        this.n = n;
    }

    public int getN() {
        return n;
    }

    public String getResult() {
        return result;
    }

    public String getStr() {
        return str;
    }

    public void setN(int n) {
        this.n = n;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public void setStr(String str) {
        this.str = str;
    }
    
    
}
