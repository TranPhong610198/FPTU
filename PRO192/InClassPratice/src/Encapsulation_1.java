class IntPoint1 {
    int x;
    int y;
    public void output(){
        System.out.println("["+x+","+y+"]");
    }
}
public class Encapsulation_1{
    public static void main(String[] args){
        IntPoint1 p = new IntPoint1();
        p.output();
    }
}