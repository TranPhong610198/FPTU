public class Exception_1{
    public static void main(String[] args){
        int x=6, y=0;
        try {
            System.out.println(x/y);
        }
        catch (ArithmeticException e){
            System.out.println(e);
            y=2;
        }
        finally{
            System.out.println("Hello");
            System.out.println(x/y);
        }
    }
}