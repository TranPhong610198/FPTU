class Rectangle {
    private int length = 0;
    private int width = 0;
    
    public Rectangle(){}
    public Rectangle(int l, int w){
        length = l>0? l: 0; width= w>0? w: 0;
    }
    
    @Override
    public String toString(){
        return "[" + getLength() + "," + getWidth() + "] }";
    }
    
    public int getLength() {return length; }
    public void setLength(int length) {this.length = length;}
    public int getWidth() {return width; }
    public void setWidth(int width) {this.width = width;}
    public int area() {return length * width; }
    
}
class Box extends Rectangle{
    private int height = 0;
    public Box(){ super();}
    public Box(int l, int w, int h){
        super(l, w);
        height = h>0? h: 0;
    }
    
    public int getHeight(){ return height ;}
    public void setHeight(int height){this.height = height;}
    
    @Override
    public String toString(){
        return "["+getLength()+"," +getWidth() + ","+getHeight()+"]";
    }
    
    @Override
    public int area(){
        int l = this.getLength();
        int w = this.getWidth();
        int h = this.getHeight();
        return 2*(l*w + w*h + h*l);
    }
    
    public int volumn(){
        return this.getLength() * this.getWidth() * height;
    }
}

public class Inheritance_1 {
    public static void main(String[] args){
        Rectangle r = new Rectangle(2, 5);
        System.out.println("Rectangle: "+ r.toString());
        System.out.println("Area: "+ r.area());
        
        Box b = new Box(2,2,2);
        System.out.println("Box "+ b.toString());
        System.out.println("Area: "+ b.area());
        System.out.println("Volume: "+ b.volumn());
    }
}
