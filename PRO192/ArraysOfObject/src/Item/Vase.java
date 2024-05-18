package Item;

import java.util.Scanner;
class Vase extends Item
{ 
    private  int height;
    private String material;

    public Vase(Scanner scan) {
        super(scan);
    }
    
//    public Vase(int value, String creator, int height, String material, Scanner scan){
//        super (value, creator, scan);
//        this.height = height;
//        this.material = material;
//    }

    @Override
    public void input() { 
        super.input();
        height = scan.nextInt();
        material = scan.next();
    }

    @Override
    public String toString() {
        return super.toString() + height + " " + material;
    }

}
