import java.util.Scanner;

public class University extends Organization{

    private String name ;
    
    public University(){}
    
    @Override
    public void communicateByTool() {
        System.out.println("in the university, people communicate by voice");
    }

    public void enroll(){
        System.out.println("The registration for enrollment is only valid when the University has received all enrollment documents and enrollment fees");    }

    public void educate(){
        System.out.println("provide education at university standard");
    }

    public void setName(String name) {
        this.name = name;
    }
    public String getName() {
        return name;
    }
    
    public void input(Scanner scan){
        super.input(scan);
        name = scan.next();
    }

    public String toString(){
        return "encourage the advancement and development of knowledge";
    }
}
