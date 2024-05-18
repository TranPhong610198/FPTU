interface VNRemote {
    final int MAXofButtons = 20;
    int price = 10;
    public static void setTimer(int number){
        System.out.println("shut down after "+ number +" seconds");
    }
    public abstract void onDevice();
    abstract public void offDevice();
    default void setLock(){
        System.out.println("set lock in the default method");
    }
}

public class Interface_1 implements VNRemote{
    @Override
    public void onDevice(){
        System.out.println("on TV");
    }
    @Override
    public void offDevice(){
        System.out.println("off TV");
    }
    public static void main(String[] args){
        VNRemote remote = new Interface_1();
        remote.setLock();
        remote.onDevice();
        remote.offDevice();
        VNRemote.setTimer(10000);
        System.out.println("TV remote's price:"+VNRemote.price);
        System.out.println("TV Remote has: "+VNRemote.MAXofButtons+"buttons");
    }
}
