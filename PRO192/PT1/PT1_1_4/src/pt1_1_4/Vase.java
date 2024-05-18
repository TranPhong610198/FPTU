package pt1_1_4;
import java.util.*;
public class Vase extends Item{
    private int height;
    private String material;
    
    public Vase(Scanner scan){super(scan);}
    public Vase(int value, String creator, int height, String material, Scanner scan){
        super(value, creator, scan);
        this.height = height;
        this.material = material;
    }
    
    //getter
    public int getHeight(){return height;}
    public String getMaterial(){return material;}
    
    //setter
    public void setHeight(int height){this.height = height;}
    public void setMaterial(String material){this.material= material;}
    
    public void outputVase(){
        super.output();
        System.out.println(" " + height + " "+ material);
//        System.out.println();
    }
    
    public void inputVase(){
        super.input();
        height = scan.nextInt();
        material = scan.next();
    }
}
