//import java.util.*;
//
//class PhoneNumber {
//    Scanner in = new Scanner(System.in);
//    
//    int area;
//    String number;
//
//    public PhoneNumber() {
//    }
//
//    public PhoneNumber(int area, String number) {
//        this.area = area;
//        this.number = number;
//    }
//
//    @Override
//    public String toString() {
//        return this.area + " - " + this.number;
//    }
//
//    public PhoneNumber inputData() {
//        // System.out.print("Enter area code: ");
//        int areaCode = in.nextInt();
//        // System.out.print("Enter number: ");
//        String phoneNumber = in.next();
//        return new PhoneNumber(areaCode, phoneNumber);
//    }
//
//    void display() {
//        System.out.println("Area: " + area);
//        System.out.println("Phone number: " + number);
//    }
//}
//
//
//
//
//class IntPhoneNumber extends PhoneNumber {
//    String countryCode;
//
//    public IntPhoneNumber() {
//        super();
//    }
//
//    public IntPhoneNumber(String countryCode, int area, String number) {
//        super(area, number);
//        this.countryCode = countryCode;
//    }
//
//    @Override
//    public String toString() {
//        return this.countryCode + " - " + super.toString();
//    }
//
//    public IntPhoneNumber inputData() {
//        // System.out.print("Enter country code: ");
//        String countryCode = in.next();
//        PhoneNumber localPhone = super.inputData();
//        return new IntPhoneNumber(countryCode, localPhone.area, localPhone.number);
//    }
//
//    @Override
//    public void display() {
//        super.display();
//        System.out.println("Country code: " + countryCode);
//    }
//}
//
//public class Lab5_1 {
//    public static void main(String[] args) {
//        Scanner scan = new Scanner(System.in);
//        PhoneNumber[] phonelist = new PhoneNumber[1];
//        int i = 0;
//        int check = scan.nextInt();
//        if (check == 1) {
//            // System.out.println("Type of phone number - 1. Local phone; - 2. Inter phone - 0. Exit");
//            int typeOfPhone = scan.nextInt();
//
//            if (typeOfPhone == 1) {
//                PhoneNumber phone = new PhoneNumber();
//                phonelist[i] = phone.inputData();
//                i++;
//                System.out.println("Add local phone number successfully!");
//            }
//            else if (typeOfPhone == 2) {
//                IntPhoneNumber intPhone = new IntPhoneNumber();
//                phonelist[i] = intPhone.inputData();
//                i++;
//                System.out.println("Add inter phone number successfully! ");
//            }
//            else if (typeOfPhone == 0) {
//            }
//        }
//        
//        for (int j = 0; j < i; j++) {
//            phonelist[j].display();
//            System.out.println();
//        }
//    }
//}


//import java.util.*;
//
//class PhoneNumber {
//    Scanner in = new Scanner(System.in);
//    
//    int area;
//    String number;
//
//    public PhoneNumber() {
//    }
//
//    public PhoneNumber(int area, String number) {
//        this.area = area;
//        this.number = number;
//    }
//
//    @Override
//    public String toString() {
//        return this.area + " - " + this.number;
//    }
//
//    public PhoneNumber inputData() {
//        // System.out.print("Enter area code: ");
//        int areaCode = in.nextInt();
//        // System.out.print("Enter number: ");
//        String phoneNumber = in.next();
//        return new PhoneNumber(areaCode, phoneNumber);
//    }
//
//    void display() {
//        System.out.println("Area: " + area);
//        System.out.println("Phone number: " + number);
//    }
//}
//
//
//
//
//class IntPhoneNumber extends PhoneNumber {
//    String countryCode;
//
//    public IntPhoneNumber() {
//        super();
//    }
//
//    public IntPhoneNumber(String countryCode, int area, String number) {
//        super(area, number);
//        this.countryCode = countryCode;
//    }
//
//    @Override
//    public String toString() {
//        return this.countryCode + " - " + super.toString();
//    }
//
//    public IntPhoneNumber inputData() {
//        // System.out.print("Enter country code: ");
//        String countryCode = in.next();
//        PhoneNumber localPhone = super.inputData();
//        return new IntPhoneNumber(countryCode, localPhone.area, localPhone.number);
//    }
//
//    @Override
//    public void display() {
//        super.display();
//        System.out.println("Country code: " + countryCode);
//    }
//}
//
//public class Lab5_1 {
//    public static void main(String[] args) {
//        Scanner scan = new Scanner(System.in);
//        // PhoneNumber[] phonelist = new PhoneNumber[1];
//        // int i = 0;
//        int check = scan.nextInt();
//        if (check == 1) {
//            // System.out.println("Type of phone number - 1. Local phone; - 2. Inter phone - 0. Exit");
//            int typeOfPhone = scan.nextInt();
//
//            if (typeOfPhone == 1) {
//                PhoneNumber phone = new PhoneNumber();
//                PhoneNumber inputData = phone.inputData();
//                // i++;
//                System.out.println("Add local phone number successfully!");
//                inputData.display();
//            }
//            else if (typeOfPhone == 2) {
//                IntPhoneNumber intPhone = new IntPhoneNumber();
//                IntPhoneNumber inputData = intPhone.inputData();
//                // i++;
//                System.out.println("Add inter phone number successfully! ");
//                inputData.display();
//            }
//        }
//    }
//}


import java.util.*;

class PhoneNumber {
    //Scanner in = new Scanner(System.in);
    Scanner in;
    int area;
    String number;

    public PhoneNumber(Scanner in) {
        this.in=in;
    }

    public PhoneNumber(int area, String number) {
        this.area = area;
        this.number = number;
    }

    @Override
    public String toString() {
        return this.area + " - " + this.number;
    }

    public PhoneNumber inputData() {
        // System.out.print("Enter area code: ");
        int areaCode = in.nextInt();
        // System.out.print("Enter number: ");
        String phoneNumber = in.next();
        return new PhoneNumber(areaCode, phoneNumber);
    }

    void display() {
        System.out.println("Area code: " + area);
        System.out.println("Phone number: " + number);
    }
}




class IntPhoneNumber extends PhoneNumber {
    String countryCode;

    public IntPhoneNumber(Scanner in) {
        super(in);
    }

    public IntPhoneNumber(String countryCode, int area, String number) {
        super(area, number);
        this.countryCode = countryCode;
    }

    @Override
    public String toString() {
        return this.countryCode + " - " + super.toString();
    }

    @Override
    public IntPhoneNumber inputData() {
        // System.out.print("Enter country code: ");
        String countryCode = in.next();
        PhoneNumber localPhone;
        localPhone = super.inputData();
        return new IntPhoneNumber(countryCode, localPhone.area, localPhone.number);
    }

    @Override
    public void display() {
        super.display();
        System.out.println("Country code: " + countryCode);
    }
}

public class Lab5_1 {
    public static void main(String[] args) {
        // PhoneNumber[] phonelist = new PhoneNumber[1];
        // int i = 0;
        Scanner in = new Scanner(System.in);
        int check = in.nextInt();
        if (check == 1) {
            // System.out.println("Type of phone number - 1. Local phone; - 2. Inter phone - 0. Exit");
            int typeOfPhone = in.nextInt();
            if (typeOfPhone == 1) {
                PhoneNumber phone = new PhoneNumber(in);
                PhoneNumber inputData = phone.inputData();
                // i++;
                System.out.println("Add local phone number successfully!");
                inputData.display();
            }
            else if (typeOfPhone == 2) {
                IntPhoneNumber intPhone = new IntPhoneNumber(in);
                IntPhoneNumber inputData = intPhone.inputData();
                // i++;
                System.out.println("Add inter phone number successfully! ");
                inputData.display();
            }
        }
    }
}