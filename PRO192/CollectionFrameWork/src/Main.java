import java.util.Scanner;

public class Main {
    public static void main(String[] args){

	Scanner sc=new Scanner(System.in);

	int choice=sc.nextInt();

	switch(choice){

	case 1: {

        Colony obj1 = new BeeColony();

        obj1.input(sc);

        System.out.println(obj1);

        obj1.grow();

        obj1. reproduce();

		break;

	}

	case 2: {

        University obj2 = new FPTUniversity();

        obj2.input(sc);

        System.out.println(obj2);

        obj2.enroll();

        obj2.educate();

		break;

        }

 	case 3: {

		Role df= new BeeColony();

		((BeeColony) df).input(sc);

        System.out.println(df);

        df.createWorker();

		break;

    	}

	case 4: {

        Role df= new FPTUniversity();

		((FPTUniversity) df).input(sc);

        System.out.println(df);

        df. createWorker ();

		break;

	}

	default: {

		break;

	}

   }
}
}
