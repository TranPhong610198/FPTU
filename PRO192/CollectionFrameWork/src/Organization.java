import java.util.Scanner;

public abstract class Organization {
    private int size;
    public Organization(){}
    
    public Organization(int size){
        this.size = size;
    }
    
    public int getSize(){
        return size;
    }
    
    public void setSize(int size){
        this.size = size;
    }

    public void input(Scanner scan){
        size = scan.nextInt();
    }

    public abstract void communicateByTool();

    public String toString(){
        return "The organization's size is " + size;
    }
}
