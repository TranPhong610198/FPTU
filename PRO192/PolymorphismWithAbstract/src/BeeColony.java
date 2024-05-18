import java.util.Scanner;

public class BeeColony extends Colony implements Role{
    
    private String type;

    public BeeColony(){}

    public void setType(String type){
        this.type =  type;
    }

    public String getType(){
        return type;
    }

    public String toString(){
        return "the colony's type is"+ type + ", size is about" +getSize() + ", and the place is" + getPlace();
    }
    public void input(Scanner scan){
        super.input(scan);
        type = scan.next();
    }

    @Override
    public void createWorker() {
        System.out.println("Worker bees perform all the work of the bees");
    }
}
