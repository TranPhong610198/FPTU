package pt1_1_3;

import java.util.*;
public class Tester {
    public static void main(String[] args){
        Scanner scan = new Scanner(System.in);
    
        int tc = scan.nextInt();
        String Colour = scan.next();
        int EnginePower = scan.nextInt();
        boolean Convertible = scan.nextBoolean();
        boolean ParkingBrake = scan.nextBoolean();
    
        Car car = new Car(Colour, EnginePower, Convertible, ParkingBrake);
        switch(tc){
            case 1: car.pressStartButton();
                    break;
            case 2: car.pressAccelaratorButton();
                    break;
            case 3: car.output();
                    break;
        }
    }
}
