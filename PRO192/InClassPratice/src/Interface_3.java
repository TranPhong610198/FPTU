interface VNRemote{
    final int MAXofButtons = 20;
    int price = 10;
    public static void setTimer(int number){
        System.out.println("shut down after "+ number + " seconds");
    }
    public abstract void onDevice();
    abstract public void offDevice();
    default void setLock(){
        System.out.println("set lock in the default method");
    }
}

interface KoreaRemote extends VNRemote{
    void subtitle(String language);
}

public class Interface_3 implements KoreaRemote{
    @Override
    public void subtitle(String language){
        System.out.println("display "+language);
    }
    @Override
    public void onDevice(){
        System.out.println("on AC");
    }
    @Override
    public void offDevice(){
        System.out.println("off AC");
    }
    public static void main (String[] args){
        KoreaRemote re = new Interface_3();
        re.onDevice();
        re.subtitle("Korean");
        re.setLock();
    } 
}