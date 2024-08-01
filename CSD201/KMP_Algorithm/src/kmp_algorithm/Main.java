/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package kmp_algorithm;

/**
 *
 * @author tphon
 */
public class Main {
    public static void main(String args[]) {
        KMP_Algorithm kmp = new KMP_Algorithm();
        String txt = "abacaabaccabacabaabb";
        String pat = "abacab";
        kmp.KMPSearch(pat, txt);
    }
}
