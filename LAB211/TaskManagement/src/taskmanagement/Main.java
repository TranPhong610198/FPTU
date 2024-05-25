/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package taskmanagement;

import java.util.*;

/**
 *
 * @author tphon
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args){
        Validation Valid = new Validation();
        Function Funct = new Function();
        List<Task> task = new ArrayList<>() ;
        
        do{
            Funct.displayMenu();
            int chosen = Valid.inputInt("Chose option: ", "EROR CHOSEN!!! Chose Again: ", 1, 4);
            switch (chosen) {
                case 1:
                    Funct.addTask(task);
                    break;
                case 2:
                    Funct.delTask(task);
                    break;                   
                case 3:
                    Funct.displayTask(task);
                    break;
                case 4:
                    System.exit(0);
                    break;                    
            }
        
        }while(true);
        
        
    }
    
}
