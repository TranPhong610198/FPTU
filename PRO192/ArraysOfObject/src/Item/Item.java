package Item;
import java.util.*;
public class Item {
    Scanner scan;
    protected int value;  
    protected String creator;

    public Item(Scanner scan) {
        this.scan = scan;
        value = 0;
        creator = "";
    }

//    public Item(int value, String creator, Scanner scan) {
//        this.scan = scan;
//        this.value = value;
//        this.creator = creator;
//    }

    //getter
    public int getValue() {
        return value;
    }
    public String getCreator(){
        return creator;
    }
    //setter
    public void setValue(int value) {
        this.value = value;
    }
    
    public void input() {
        value = scan.nextInt();
        creator = scan.next();
    }

    @Override
    public String toString() {
        return value + " " + creator +" ";
    }
}
