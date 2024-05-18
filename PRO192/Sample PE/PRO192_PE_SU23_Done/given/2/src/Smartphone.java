
public class Smartphone extends Product{
    private int price;
    private int internal_memory;
    private float weight;
    
    public Smartphone(String code, String name, int internal_memory, float weight, int price){
        super(code, name);
        this.internal_memory = internal_memory;
        this.weight = weight;
        this.price = price;
    }
    
    public void showInfor(){
        System.out.println(getCode()+ "-" + getName()+"-"+ internal_memory + "GB"+"-"+weight+ "g"+ "-"+price+"$");
    }
    
    public double buyNow(int quantity){
//        if (quantity >=5) return quantity*price*(80/100);
        if (quantity >=5) return (double) quantity * price * 80/100;
        else return (double) quantity*price;
    }
}
