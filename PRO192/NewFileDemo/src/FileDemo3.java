
import java.io.*;

public class FileDemo3{

    public static void main(String[] args){

        try{

            File ftext=new File("data.txt");

            PrintWriter ftextW=new PrintWriter(ftext);

            int n=10;

            for(int i=1; i<=n; i++)

                ftextW.println("ID   Name   GPA   Note");

            ftextW.close();

        }catch(Exception e){

            System.out.println(e);

        }

    }

}