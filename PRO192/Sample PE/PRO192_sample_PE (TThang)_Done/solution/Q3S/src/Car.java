
public class Car implements Comparable<Car> {
    private String maker;
    private int rate;

    @Override
    public int compareTo(Car t) {
       if(rate < t.rate)
          return(-1); 
        else if(rate == t.rate) 
           return maker.compareToIgnoreCase(t.maker);
        else 
           return 1;
    }

    public Car() {
        maker = "";
        rate = 0;
    }

    public Car(String xMaker, int xRate) {
        maker = xMaker;
        rate = xRate;
    }

    public String getMaker() {
        return maker;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int xRate) {
        rate = xRate;
    }

    public void setMaker(String maker) {
        this.maker = maker;
    }
     
 
}
