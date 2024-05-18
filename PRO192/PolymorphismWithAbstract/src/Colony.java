import java.util.Scanner;

public class Colony extends Organization{
    
    private String place;
    
    public Colony (){}
    
    @Override
    public void communicateByTool() {
        System.out.println("the colony communicate by sound");
    }
    
    public void grow(){
        System.out.println("an annual cyvle of growth that begins in spring");
    }
    
    public void reproduce(){
        System.out.println("Colony can reproduce itsefl through a process");
    }
    
    public String getPlace(){
        return place;
    }

    public void input(Scanner scan){
        super.input(scan);
        place = scan.next();
    }

    public String toString(){
        return "the colony size is" + getSize() + ", the colony's place is" + place;
    }
}
