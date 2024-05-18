import java.util.Scanner;

public class Main {
    public static void main(String[] args){

        Scanner sc=new Scanner(System.in);

    	int choice=sc.nextInt();

    	switch(choice){

        	case 1: {

    	        Colony obj1=new BeeColony();

        		((BeeColony)obj1).input(sc);

            	System.out.println(obj1);

                obj1.grow();

            	obj1.reproduce();

        		break;



	        }

            case 2: {

    	        University obj2=new FPTUniversity();

        		((FPTUniversity)obj2).input(sc);

            	System.out.println(obj2);

    	        obj2.enroll();

            	obj2.educate();

        		break;

            }

         	case 3: {

        		Role df= new BeeColony();

        		((BeeColony)df).input(sc);

                System.out.println(df);

            	df.createWorker();

        		break;

        	}

        	case 4: {

            	Role df1= new FPTUniversity();

        		((FPTUniversity)df1).input(sc);

            	System.out.println(df1);

            	df1.createWorker ();

        		break;

        	}

        	default: {

        		break;

        	}

    	}

    }
}
