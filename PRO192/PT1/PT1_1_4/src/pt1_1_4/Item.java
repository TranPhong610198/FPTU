package pt1_1_4;
import java.util.*;
public class Item {
//    Scanner scan = new Scanner(System.in);
    Scanner scan;
    private int value;
    String creator;
    
    public Item(Scanner scan){this.scan = scan;};
    public Item(int value, String creator, Scanner scan){
        this.value = value;
        this.creator = creator;
        this.scan = scan;
    }
    
    //getter
    public int getValue(){return value;}
    public String getCreator(){return creator;}
    
    //setter
    public void setValue(int value){this.value = value;}
    public void setCreator(String creator){this.creator = creator;}
    
    public void output(){
        System.out.print(value + " " + creator);
//        System.out.println();
    }
    
    public void input(){
        value = scan.nextInt();
        creator = scan.next();
    }
    
}
