class IntPoint2{
    int x= 7;
    int y= 3;

    public IntPoint2(){}
    public IntPoint2(int x, int y){
       this.x = x;
       this.y = y;
    }

    public void output(){
        String S ="[" + x + ","  + y + "]";
        System.out.println(S);
    }

    public void setObject(int x, int y){
        this.x = x;
        this.y = y;
    }
}
public class Encapsulation_2{
    public static void main(String[] args){
        System.out.println("Use default constructor:");
        IntPoint2 p1 = new IntPoint2();
        p1.output();
        p1.setObject(100, 1000);
        p1.output();
        System.out.println("Use parametric constructor:");
        IntPoint2 p2 = new IntPoint2(7, 3);
        p2.output();
        p2.setObject(-7, 90);
        p2.output();
    }
}