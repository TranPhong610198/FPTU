package pt1_1_3;

public class Car {
    private String Colour;
    private int EnginePower;
    private boolean Convertible, ParkingBrake;
    
    public Car(){
        this.Colour = "";
        this.EnginePower = 0;
        this.Convertible = false;
        this.ParkingBrake = false;
    };
    public Car(String Colour, int EnginePower, boolean Convertible, boolean ParkingBrake){
        this.Colour = Colour;
        this.Convertible = Convertible;
        this.EnginePower = EnginePower;
        this.ParkingBrake = ParkingBrake;
    }
    
    //getter
    public String getColour(){return Colour;}
    public int getEnginePower(){return EnginePower;}
    public boolean getConvertible(){return Convertible;}
    public boolean getParkingBrake(){return ParkingBrake;}
    
    //setter
    public void setColour(String Colour){this.Colour = Colour;}
    public void setEnginePower(int EnginePower){this.EnginePower = EnginePower;}
    public void setConvertible(boolean Convertible){this.Convertible = Convertible;}
    public void setParkingBrake(boolean ParkingBrake){this.ParkingBrake = ParkingBrake;}
    
    public void pressStartButton(){
        System.out.println("You have pressed the Start button");
    }
    
    public void pressAccelaratorButton(){
        System.out.println("You have pressed the Accelerator button");
    }
    
    public void output(){
        System.out.println(Colour);
        System.out.println(EnginePower);
        System.out.println(Convertible);
        System.out.println(ParkingBrake);
    }
}
