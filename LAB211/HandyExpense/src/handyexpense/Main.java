/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package handyexpense;
import java.util.*;
/**
 *
 * @author tphon
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Function Funct = new Function();
        Validation Valid = new Validation();
        
        List<Expense> exp = new ArrayList<>();
        
        while(true){
            Funct.displayMenu();
            int choice = Valid.inputInt("Your Choice: ", "Eror Choice!!!", 1, 4);
            switch (choice) {
                case 1:
                    Funct.addExp(exp);
                    break;
                case 2:
                    Funct.displayExp(exp);
                    break;
                case 3:
                    Funct.delExp(exp);
                    break;
                case 4:
                    System.exit(0);
                    break;
                
            }
        }
    }
    
}
