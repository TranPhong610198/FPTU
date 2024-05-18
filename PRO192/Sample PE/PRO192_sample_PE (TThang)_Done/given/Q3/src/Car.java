
public class Car {
    private String maker;
    private int rate;
    
    public Car(){};
    public Car(String maker, int rate){
        this.maker= maker;
        this.rate = rate;
    }
    
    public String getMaker(){
        return maker;
    }
    public int getRate(){
        return rate;
    }
    
    public void setMaker(String maker){
        this.maker = maker;
    }
    public void setRate(int rate){
        this.rate = rate;
    }
}
