public class SpecCar extends Car {
  private int type;
    public SpecCar() {
    }
    public SpecCar(String maker, int price, int type) {
       super(maker,price);
       this.type = type;
    }
    
    @Override
    public String toString() {
        return getMaker() + ", " + getPrice() + ", " + type;
    }

    public void setData() {
        setMaker("XZ" + getMaker());
        setPrice(getPrice()+20);
    }
    public int  getValue() {
       int x; 
       if(type<7)
        x = super.getPrice()+10;
        else
         x = super.getPrice()+15;
       return(x);  
    }  
    
  
}
