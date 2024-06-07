/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package managestudent;

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
        Validation Valid = new Validation();
        Function Funct = new Function();
        List<Student> studArr = new ArrayList<>();

        while (true) {
            Funct.displayMenu();
            int choice = Valid.inputInt("Your choice: ", "ERROR choice!!!", 1, 5);
            switch (choice) {
                case 1:
                    Funct.create(studArr);
                    break;
                case 2:
//                    Funct.displayAll(studArr);
                    Funct.findNSort(studArr);
                    
                    break;
                case 3:
                    Funct.updateOrDel(studArr);
                    break;
                case 4:
                    Funct.report(studArr);
                    break;
                case 5:
                    System.exit(0);
                    break;

            }
        }

    }

}
