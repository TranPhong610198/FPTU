public class TypeCast{
    public static void main(String[] args){
         short x, y=256;
         byte m, n=6;
         x=n;
         n=(byte)y;
         System.out.println("The first byte of 256 is: "+n);
    }
}