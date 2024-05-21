/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bubblesort;

/**
 *
 * @author tphon
 */
import java.util.*;
import java.lang.*;
public class Validation {
   
    Validation(){}
    
    public int input(String str) {
        Scanner scan = new Scanner(System.in);
        
        do {
            try {
                System.out.print(str);
                int temp = Integer.parseInt(scan.nextLine().trim());
                if (temp <= 0) {
                    throw new NumberFormatException("Input Eror!!! Enter Again: ");
                }
                return temp;
            } catch (NumberFormatException e) {
                System.err.println(e.getMessage());
            }
        } while (true);
    }
    
    
}
