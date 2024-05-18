package Item;

import java.util.*;
class  Painting extends Item{ 

    private int height; 
    private int width;
    private boolean isWatercolour;
    private boolean isFramed;

    public Painting(Scanner scan) {
        super(scan);
    }
    
    public void input(){
        super.input();
        height = scan.nextInt();
        width = scan.nextInt();
        isWatercolour = scan.nextBoolean();
        isFramed = scan.nextBoolean();
    }

    public String toString(){
        return super.toString() + height + " " + width + " " + isWatercolour +" " + isFramed;
    }

} 
