
public class Product {
    int id;
    String name;
    double price;

    public Product(){}
    public Product(int id, String name, double price){
        this.id = id;
        this.name = name;
        this.price = price;
    }
    
    public int getId(){
        return id;
    }
    public String getName(){
        return name;
    }
    public double getPrice(){
        return price;
    }
    
    public void setName(String name){
        this.name = name;
    }
    public void setPrice(double price){
        this.price = price;
    }
    
    public String toString(){
        return id+", "+name+", "+price;
    }
}