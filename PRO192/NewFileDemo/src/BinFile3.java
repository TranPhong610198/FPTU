
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class BinFile3 {

    public static void main(String[] args) {
        final char BLANK = 32;
        final String fileName = "LStream.txt";
        int[] a = {1, 2, 3, 4, 5};
        char n = '5';
        try {
            FileOutputStream os = new FileOutputStream(fileName);
            os.write(n);//begin writing
            os.write(BLANK);
            for (int i = 0; i < 5; i++) {
                os.write(Character.forDigit(a[i], 10));
                os.write(BLANK);
            }
            for (int i = 0; i < fileName.length(); i++) {
                os.write(fileName.charAt(i));
            }
            os.close();

            FileInputStream is = new FileInputStream(fileName);
            int count = is.available();
            System.out.println("The size of file is " + count + " bytes");
            byte[] bytes = new byte[count];
            int readCount = is.read(bytes);
            System.out.println("The content of file: ");
            System.out.println(new String(bytes));
            System.out.println("Number of read bytes: " + readCount);
            is.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
