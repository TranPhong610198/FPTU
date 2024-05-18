
public class SpecWall extends Wall{
    String color;
    
    public SpecWall(){}
    public SpecWall(String place, int area, String color){
        super(place, area);
        this.color = color;
    }
    
    public String toString(){
        return place+", "+color+", "+area;
    }
    
    public void setData(){
        String result="";
       String[] temp = place.split("");
       for (int i=0; i<temp.length; i++){
           String tempStr = temp[i];
           char[] testChar = tempStr.toCharArray();
           char test = testChar[0];
           if (Character.isAlphabetic((int) test)){
               result += temp[i];
           }
       }
    this.place = result;
    }
    
    public String getValue(){
        int tempArea = getArea();
        int lengthPlace = getPlace().length();
        
        if(tempArea % lengthPlace != 0){
            return color;
        }
        else
            return color + tempArea/lengthPlace;
    }
}
