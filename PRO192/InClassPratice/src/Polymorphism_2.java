class Father{
    int x= 0;
    void m1() {System.out.println("m1");}
    void m2() {System.out.println("m2");}
}

class Son extends Father {
    int y = 2;
    void m2() {System.out.println("m2-overriden");}
}
public class Polymorphism_2{
    public static void main(String[] args){
        Father obj = new Father();
        obj.m1();
        obj.m2();
        obj = new Son();
        obj.m1();
        obj.m2();
    }
}