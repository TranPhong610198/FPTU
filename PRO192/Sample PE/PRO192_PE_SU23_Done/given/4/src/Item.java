
public class Item implements Iservice{
    public String id;
    public String name;
    public int size;
    
    public Item(String id, String name, int size){
        this.id =id;
        this.name = name;
        this.size = size;
    }
  
    @Override
    public String formatSize() {
        if(id.compareTo("ZARA") == 0){
            if(size >=0 && size <=4) return "XS";
            else if(size>4 && size<=6) return "S";
        }
        else if(id.compareTo("MANGO") == 0){
            if(size >=0 && size <=4) return "S";
            else if (size >4 && size<=6) return "M";
        }
        return "L";
    }

    @Override
    public String formatName() {
        return name.trim().replaceAll("\\s+", " ");
    }
}
