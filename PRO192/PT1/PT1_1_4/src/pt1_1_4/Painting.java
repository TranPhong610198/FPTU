package pt1_1_4;
import java.util.*;
public class Painting extends Item {
    private int height;
    private int width;
    private boolean isWatercolour;
    private boolean isFramed;

    public Painting(Scanner scan){super(scan);}
    public Painting(int value, String creator, int height, int width, boolean isWatercolour, boolean isFramed, Scanner scan) {
        super(value, creator, scan);
        this.height = height;
        this.width = width;
        this.isWatercolour = isWatercolour;
        this.isFramed = isFramed;
    }

    public int getHeight(){return height;}
    public int getWidth(){return width;}
    public boolean isWatercolour(){return isWatercolour;}
    public boolean isFramed(){return isFramed;}
    
    public void setHeight(int height){this.height = height;}
    public void setWidth(int width){this.width = width;}
    public void setWatercolour(boolean watercolour){isWatercolour = watercolour;}
    public void setFramed(boolean framed){isFramed = framed;}

    public void outputPainting() {
        super.output();
        System.out.println(" " + height + " " + width + " " + isWatercolour + " " + isFramed);
//        System.out.println();
//        System.out.println("Watercolour: " + isWatercolour);
//        System.out.println("Framed: " + isFramed);
    }

    public void inputPainting() {
        super.input();
        height = scan.nextInt();
        width = scan.nextInt();
        isWatercolour = scan.nextBoolean();
        isFramed = scan.nextBoolean();
    }
}
