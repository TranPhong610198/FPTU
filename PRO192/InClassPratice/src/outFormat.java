public class outFormat{
    public static void main(String[] args){
        String S="Hello";
        int i=5;
        long l=58;
        float f= 7.2f;
        double d= 8.9;
        boolean b= true;
        char c = 'A';
        
        System.out.format("%s,%2d,%4Xh,%5.2f,%10.3f,%3c,%b\n",S,i,l,f,d,c,b);
        System.out.format("%3$3b,%1$3d,%2$12s\n", i,S,b);
    }
}