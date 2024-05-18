class Product {
    private String code;
    private String name;

    public Product(String code, String name) {
        this.code = code;
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }
}

class Smartphone extends Product {
    private int internalMemory;
    private float weight;
    private int price;

    public Smartphone(String code, String name, int internalMemory, float weight, int price) {
        super(code, name);
        this.internalMemory = internalMemory;
        this.weight = weight;
        this.price = price;
    }

    public void showInfo() {
        System.out.println(getCode() + ":" + getName() + ":" + internalMemory + "GB" + " " + weight + "g" + "-" + price + "S");
    }

    public double buyNow(int quantity) {
        if (getName().equals("IPHONE 14. PROMAX") && quantity >= 5) {
            return (price * quantity) * 0.8;
        } else {
            return price * quantity;
        }
    }
}
