import java.util.Scanner;
class Atom {

    private int number;
    private String symbol;
    private String fullname;
    private float weight;

    public Atom() {
        // Default constructor
    }

    public Atom(int number, String symbol, String fullname, float weight) {
        this.number = number;
        this.symbol = symbol;
        this.fullname = fullname;
        this.weight = weight;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getNumber() {
        return number;
    }

    public void setSymbol(String symbol) {
        this.symbol = symbol;
    }

    public String getSymbol() {
        return symbol;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getFullname() {
        return fullname;
    }

    public void setWeight(float weight) {
        this.weight = weight;
    }

    public float getWeight() {
        return weight;
    }

    public void display() {
        System.out.printf("%-10d%-10s%-10s%-10f%n", number, symbol, fullname, weight);
    }
}


/**
 * @author Student name
 */
class Validation {

    private static final Scanner in = new Scanner(System.in);

    public static String checkInputString() {
        String result;
        do {
            result = in.nextLine().trim();
            if (!result.isEmpty()) {
                return result;
            } else {
                System.err.println("Cannot be empty");
                System.out.print("Try again: ");
            }
        } while (true);
    }

    public static int checkInputInt() {
        int result;
        do {
            try {
                result = Integer.parseInt(in.nextLine().trim());
                if (result >= 0) {
                    return result;
                } else {
                    System.err.println("Please enter a positive value");
                    System.out.print("Try again: ");
                }
            } catch (NumberFormatException e) {
                System.err.println("Please enter a valid integer");
                System.out.print("Try again: ");
            }
        } while (true);
    }

    public static float checkInputFloat() {
        float result;
        do {
            try {
                result = Float.parseFloat(in.nextLine().trim());
                if (result >= 0) {
                    return result;
                } else {
                    System.err.println("Please enter a positive value");
                    System.out.print("Try again: ");
                }
            } catch (NumberFormatException e) {
                System.err.println("Please enter a valid floating-point number");
                System.out.print("Try again: ");
            }
        } while (true);
    }
public static boolean accept() {
        String result;
        do {
            result = checkInputString();
            if (result.equalsIgnoreCase("Y")) {
                return true;
            } else if (result.equalsIgnoreCase("N")) {
                return false;
            } else {
                System.err.println("Please input Y/y or N/n");
                System.out.print("Try again: ");
            }
        } while (true);
    }
}

public class AtomsDemo {

    static Atom[] atomArray = new Atom[10];
    static int count = 0;
//    private static final Scanner in = new Scanner(System.in);

    public static void enterData() {
//        System.out.println("Atomic Information\n==================");
//        for (int i = 0; i < 10; i++) {
//            System.out.print("Enter atomic number: ");
            int number = Validation.checkInputInt();
//            System.out.print("Enter symbol: ");
            String symbol = Validation.checkInputString();
//            System.out.print("Enter full name: ");
            String fullname = Validation.checkInputString();
//            System.out.print("Enter atomic weight: ");
            float weight = Validation.checkInputFloat();
            atomArray[0] = new Atom(number, symbol, fullname, weight);
            count++;
//            System.out.print("Do you want to continue (Y/N)?: ");
//            if (!Validation.accept()) {
//                break;
            }
//        }
//    }

    /**
     *
     * @param args
     */
    public static void main(String[] args) {
        enterData();
//        System.out.println("\nAtomic Information\n==================");
        for (int i = 0; i < count; i++) {
            atomArray[i].display();
        }
//        Scanner scanner = new Scanner(System.in);
    }
}