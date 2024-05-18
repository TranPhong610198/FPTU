import java.util.Scanner;

public class BeeColony extends Colony implements Role{
    private String type;
    
    public BeeColony(){}

    public BeeColony(int size, String place, String type){
        super(size, place);
        this.type = type;
    }
    
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public void input(Scanner scan) {
        super.input(scan);
        type = scan.next();
    }

    public String toString(){
        return "the colony's type is "+ getType() + ", size is about "+ getSize() + ", and this place is " +getPlace();
    }

    @Override
    public void createWorker() {
        System.out.println("Worker bees perform all the work of the bees");
    }
    
}
