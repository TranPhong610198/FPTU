import java.io.*;

public class FileDemo4{

    public static void main(String[] args){

        try{

            File ftext=new File("data.txt");

            System.out.println(ftext.getCanonicalPath());

            PrintWriter ftextW=new PrintWriter(ftext);

            int n=10;

            for(int i=1; i<=n; i++)

                ftextW.println("ID   Name   GPA   Note");

            ftextW.close();

            FileReader ftextR=new FileReader("data.txt");

            BufferedReader ftextBR=new BufferedReader(ftextR);

            String dataline=null;

            while((dataline=ftextBR.readLine())!=null)

                System.out.println(dataline);

            ftextBR.close();    ftextR.close();

        }catch(Exception e){

            System.out.println(e);

        }

    }

}