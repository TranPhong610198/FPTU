
public class SpecCoffee extends Coffee {
    private int price;
    
    public SpecCoffee(){
    }
    
    public SpecCoffee(String name, int size, int price){
        super(name, size);
        this.price = price;
    }
    
    @Override
    public String toString(){
        return super.toString() + ", " + price;
    }
    
    public void setData(){
        this.name = "CF" + getName();
    }
    
    public int getValue(){
        if(getSize() > 10) return price;
        else return price +5;
    }
}
