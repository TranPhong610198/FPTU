package Item;

import java.util.Scanner;
class Statue extends Item {

    private int weight;
    private String colour;

    public Statue(Scanner scan) {
        super(scan);
    }

//    public Statue(int value, String creator, int weight, String colour, Scanner scan){
//        super(value, creator, scan);
//        this.weight = weight;
//        this.colour = colour;
//    }
    
    @Override
    public void input() {
        super.input();
        weight = scan.nextInt();
        colour = scan.next();
    }

    @Override
    public String toString() {
        return super.toString() + " " + weight + "" + colour;
    }
}
