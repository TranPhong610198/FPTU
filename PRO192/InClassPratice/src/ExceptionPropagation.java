public class ExceptionPropagation{
    public void mA(){
        mB();
    }
    public void mB(){
        mC();
    }
    public void mC(){
        System.out.println(5/0);
    }
    public static void main(String[] args){
        ExceptionPropagation obj = new ExceptionPropagation();
        obj.mA();
    }
}