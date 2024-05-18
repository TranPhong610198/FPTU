
public class Coffee {
    String name;
    private int size;
    
    public Coffee(){
        
    }
    
    public Coffee(String name, int size){
        this.name = name;
        this.size = size;
    }
    
    public String getName(){
        return name;
    }
    
    public int getSize(){
        return size;
    }
    
    public void setName(String name){
        this.name = name;
    }
    
    @Override
    public String toString(){
        return name + ", "+ size;
    }
}
