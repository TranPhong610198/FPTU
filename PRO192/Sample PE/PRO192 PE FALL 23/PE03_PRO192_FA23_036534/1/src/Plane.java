
public class Plane {
    String type;
    int capacity;
    float x, y;
    
    public Plane(){}
    public Plane(String type, int capacity, float x, float y){
        this.type = type;
        this.capacity = capacity;
        this.x = x;
        this.y = y;
    }
    
    //getter
    public String getType(){
        return type;
    }
    public int getCapacity(){
        return capacity;
    }
    public float getX(){
        return x;
    }
    public float getY(){
        return y;
    }
    
    //setter
    public void setType(String type){
        this.type = type;
    }
    public void setCapacity(int capacity){
        this.capacity = capacity;
    }
    public void setX(float x){
        this.x = x;
    }
    public void setY(float y){
        this.y = y;
    }
    
    public String toString(){
        return type +"-"+capacity+"#"+"("+x+"000,"+y+"000)";
    }
    
    public String getDirection(){
        if(x>0  && y>0 ) return "NE";
        else if(x>0  && y<0 ) return "SE";
        else if(x<0  && y>0 ) return "NW";
        else if(x<0  && y<0 ) return "SW";
        else return "X";
    }
}
