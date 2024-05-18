
import java.util.Arrays;


public class Cake {
    private String maker;
    private int price;
    
    public Cake(){}
    
    public Cake(String maker, int price){
        this.maker = maker;
        this.price = price;
    }
    
    public String getMaker(){
        char[] temp =  maker.toCharArray();
        temp[0] = Character.toUpperCase(temp[0]);
        for (int i=1; i<temp.length; i++){
            temp[i] = Character.toLowerCase(temp[i]);
        }
        
        return String.valueOf(temp);
    }
    
    public int getPrice(){
        return price;
    }
    
    public void setPrice(int price){
        this.price = price;
    }
}
