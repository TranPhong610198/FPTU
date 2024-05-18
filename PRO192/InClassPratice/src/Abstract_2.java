abstract class AbstractDemo2{
    void m1(){
        System.out.println("m1");
    }
    abstract void m2();
}

class Derived extends AbstractDemo2{
    
    public void m2(){
        System.out.println("m2");
    }
}
public class Abstract_2{
    public static void main(String[] args){
        Derived obj = new Derived();
        obj.m1();
        obj.m2();
    }
}