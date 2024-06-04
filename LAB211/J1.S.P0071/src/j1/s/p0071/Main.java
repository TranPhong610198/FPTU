/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package j1.s.p0071;
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
        List<Task> task = new ArrayList<>();
        
        while (true){
            Funct.displayMenu();
            int chose =  Valid.inputInt("Chose option: ", "EROR chose!!!", 1, 4);
            switch (chose) {
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
        }
    }
    
}
