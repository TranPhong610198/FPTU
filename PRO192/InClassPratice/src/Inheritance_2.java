class Father1{
    public static void m(){
        System.out.println("I am a father");
    }
}

class Son1 extends Father1{
    public static void m(){
        System.out.println("I am a son");
    }    
}   

public class Inheritance_2{
    public static void main(String[] args){
        Father1 obj = new Father1();
        obj.m();
        obj = new Son1();
        obj.m();
        Son1 obj2 = new Son1();
        obj2.m();
    }
}