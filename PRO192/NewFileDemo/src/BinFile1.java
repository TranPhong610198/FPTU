/*Use the RandomAccessFile class to write/read some data */
import java.io.*;
public class BinFile1 {
    public static void main(String[] args){
        String fName = "RandomAccessFileDemo.txt";
        String S1 = "Mat nai"; boolean b=true; int n=1234;
        double x=37.456; String S2 = "Hoang an Huan";
        byte[] ar = new byte[100];
        try{
            RandomAccessFile f = new RandomAccessFile(fName, "rw");
            
            f.writeUTF(S1); f.writeBoolean(b); f.writeInt(n);
            f.writeDouble(x); f.writeBytes(S2);
            
            f.seek(0);
            System.out.println(f.readUTF());
            System.out.println(f.readBoolean());
            System.out.println(f.readInt());
            System.out.println(f.readDouble());
            f.read(ar);
            System.out.println(new String (ar));
            System.out.println("File length: "+ f.length());
            f.close();
        }
        catch (Exception e){
            System.out.println(e);
        }
    }
}
