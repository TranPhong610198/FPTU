import java.util.Scanner;

public abstract class Organization {
    private int size;
    public Organization(){}
    
    public int getSize(){
        return size;
    }
    
    public void setSize(int size){
        this.size = size;
    }
    public abstract void communicateByTool();
    
    public void input(Scanner scan){
        size = scan.nextInt();
    }
    @Override
    public String toString(){
        return "the organzation's size is" + size;
    }
}
