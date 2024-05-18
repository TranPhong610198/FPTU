public class Book {
    
    private String title;
    private int price;

    public Book() {
    }
    public Book(String title, int price) {
        this.title = title;
        this.price = price;
    }
    

    public String getTitle() {
        return title.toUpperCase();
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getPrice() {
        return price;
    }

}
