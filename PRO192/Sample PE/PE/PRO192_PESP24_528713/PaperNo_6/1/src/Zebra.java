
public class Zebra {
    String owner;
    int weight;
    
    public Zebra(){}
    public Zebra(String owner, int weight){
        this.owner = owner;
        this.weight = weight;
    }
    
    public String getOwner(){
        String[] temp = owner.split("");
        String result="";
        for (int i=0; i<temp.length; i++){
            char[] check = temp[i].toCharArray();
            char test = check[0];
            if (!Character.isDigit(test)){
                result += temp[i];
            }
            else{
                if (Integer.parseInt(temp[i]) %2 ==0  ){
                    result += temp[i];
                }
            }    
        }
        return result;
    }
    public int getWeight(){
        return weight;
    }
    
    public void setWeight(int weight){
        this.weight = weight + owner.length();
    }
}
