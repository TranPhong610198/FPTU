import java.util.*;
public class ProductList extends ArrayList<Product>{ 
    public Product getProductWithMinPrice(){
        Product result = this.get(0);
        for(Product check : this){
            if(check.price < result.price){
                result = check;
            }
        }
        return result;
    }
    
    // đề bị mất đoạn build cái methods getProductById
    // nên là build nó dựa trên file Main.class decomplied không biết đúng sai
    public Product getProductById(int id){
        for (Product check : this){
            if(check.id == id) return check;
        }
        return null;
    }
}

