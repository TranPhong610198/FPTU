// Encapsulation_4
public class Car{
    private String Colour;
    private int EnginePower;
    private boolean Convertible;
    private boolean parkingBrake;
    
    public Car(){
        Colour = "";
        EnginePower = 0;
        Convertible = false;
        parkingBrake = false;
    }
    public Car(String Colour, int EnginePower, boolean Convertible, boolean parkingBrake){
        this.Colour = Colour;
        this.EnginePower = EnginePower;
        this.Convertible = Convertible;
        this.parkingBrake = parkingBrake;
    }
    public void pressStartButton(){
        System.out.println("You can press the star button");
    }
    public void pressAcceleratorButton(){
        System.out.println("You can press the accelerator button");
        System.out.println("Colour: "+ Colour);
        System.out.println("Enginepower: "+ EnginePower);
        System.out.println("Convertible:"+ Convertible);
        System.out.println("parking brake:"+ parkingBrake);
    }
    public void setColour(String Colour){
        this.Colour = Colour;
    }
    public String getColour(){
        return Colour;
    }
    public int getEnginePower(){
        return EnginePower;
    }
    public void setEnginePower(int EnginePower){
        this.EnginePower = EnginePower;
    }
    public boolean isConvertible(){
        return Convertible;
    }
    public void setConvertible(boolean Convertible){
        this.Convertible = Convertible;
    }
    public boolean isParkingBrake(){
        return parkingBrake;
    }
    public void setParkingBrake(boolean parkingBrake){
        this.parkingBrake = parkingBrake;
    }
    public static void main(String[] args){
        Car c = new Car();
        c.pressStartButton();
        c.pressAcceleratorButton();
        
        Car c2 = new Car();
        // c.pressStartButton();
        c2.pressAcceleratorButton();
        
        Car c3 = new Car("red", 100, true, true);
        c3.pressAcceleratorButton();
        c3.setColour("black");
        System.out.println("Colour of c3:"+ c3.getColour());
    }
}