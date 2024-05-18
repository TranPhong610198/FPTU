import java.util.*;

class book{

    String      title;

    int         noPages;

    String[]    content;

    Scanner     sc;

    book(Scanner sc){

        this.sc=sc;

    }

    void    readmydata(){

        this.title=sc.nextLine();

    }

    void    showmydata(){

        System.out.println(this.title);

    }

};

public class Lib{

    public static void main(String[] args){

        Scanner sc=new Scanner(System.in);

        int n;

        n=sc.nextInt();        sc.nextLine();

        book[]    books=new book[n+1];

        for(int i=1; i<=n; i++){

            books[i]=new book(sc);

            books[i].readmydata();

        }

        System.out.println("The books in the library:");

        for(int i=1; i<=n; i++)

            books[i].showmydata();

    }

}