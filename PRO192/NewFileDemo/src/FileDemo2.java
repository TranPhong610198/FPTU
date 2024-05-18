import java.io.*;
import java.util.Date;
public class FileDemo2 {
    public static void main(String[] args) throws IOException{
        File f = new File("../BtCh10-IO");
        String S = f.isDirectory() ? "Thu muc" : "Tap tin";
        System.out.println("../BtCh10-IO la: "+S);
        String L[] = f.list();
        System.out.println("Noi dung thu muc: ");
        for (int i=0; i<L.length; ++i){
            File f2 = new File(f,L[i]);
            System.out.println(L[i] + " " + (f2.isFile()? "Tap tin" : "Thu muc"));
        }
    }
}
