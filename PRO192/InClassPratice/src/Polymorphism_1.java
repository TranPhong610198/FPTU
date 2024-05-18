class Rectangle{
    protected int length=0, width =0;

    public void setValue(int l){
        length = l>0? l : 0;
    }
    
    public void setValue(int l, int w){
        length = l>0? l : 0;
        width = w>0? w : 0;
    }

    @Override
    public String toString(){
        return "[" + length + "," + width + "]}";
    }
}

class Box extends Rectangle {
    int height = 0;
    public void setValue (int l, int w, int h){
        super.setValue(l, w);
        height = h>0? h : 0;
    }
    
    @Override
    public String toString(){
        return "[" + length + "," + width + "," + height + "]";
    }
}

public class Polymorphism_1{
    public static void main (String[] args){
        Rectangle r = new Rectangle();
        r.setValue(5);
        System.out.println(r.toString());
        r.setValue(10, 20);
        System.out.println(r.toString());
        Box b = new Box();
        b.setValue(5, 10, 15);
        System.out.println(b.toString());
    }
}