package Item;

class ItemList {

    Item[] list;   // an array to store all items
    int numOfItem;  // to store the number of items that added to the list
    final int MAX = 100;   // is the size of the array

    public ItemList() {
        list = new Item[MAX];
        numOfItem = 0;
    }
    //this mothod add an Item object to the list
    //input: a new item that needs to add
    //output: return true/false

    public boolean addItem(Item item) {
        if (item == null || numOfItem >= MAX) {
            return false;
        }
        list[numOfItem] = item;
        numOfItem++;
        return true;
    }
    //this method prints out information of all items

    public void displayAll() {
        if (numOfItem == 0) {
            System.out.println("the list is empty");
        }
        for (int i = 0; i < numOfItem; i++) {
            System.out.println(list[i]);
        }
    }
    //this method finds the item by its creator
    //return the item that is found of the first occurrence.

    public Item findItem(String creator) {
        for (int i = 0; i < numOfItem; i++) {
            if (list[i].getCreator().equals(creator)) {
                return list[i];
            }
        }
        return null;
    }
    //this method returns the zero_based index of the first occurrence.

    public int findItemIndex(String creator) {
        for (int i = 0; i < numOfItem; i++) {
            if (list[i].getCreator().equals(creator)) {
                return i;
            }
        }
        return -1;
    }
    //this method updates the item at the specified position in this list
    //input: the index you wish to update

    public boolean updateItem(int index) {
        if (index >= 0 && index < numOfItem) {
            list[index].input();
            return true;
        }
        return false;
    }
    //this method removes the item at the specified position in this list. 
    //Shifts any subsequent elements to the left   
    //input: the index you wish to remove    

    public boolean removeItem(int index) {
        if (index >= 0 && index < numOfItem) {
            for (int j = index; j < numOfItem; j++) {
                list[j] = list[j + 1];
            }
            numOfItem--;
            return true;
        }
        return false;
    }
    //this method prints out all items that belong to the given type in the list.

    public void displayItemsByType(String type) {
        if (type.equals("Vase")) {
            for (int i = 0; i < numOfItem; i++) {
                if (list[i] instanceof Vase) {
                    System.out.println(list[i]);
                }
            }
        } else if (type.equals("Statue")) {
            for (int i = 0; i < numOfItem; i++) {
                if (list[i] instanceof Statue) {
                    System.out.println(list[i]);
                }
            }
        } else {
            for (int i = 0; i < numOfItem; i++) {
                if (list[i] instanceof Painting) {
                    System.out.println(list[i]);
                }
            }
        }
    }
    //this method sorts items in ascending order based on their values.

    public void sortItems() {
        for (int i = 0; i < numOfItem; i++) {
            for (int j = 0; j < numOfItem-1; j++) {
                if (list[j].getValue() > list[j + 1].getValue()) {
                    Item tmp = list[j];
                    list[j] = list[j + 1];
                    list[j + 1] = tmp;
                }
            }
        }
    }
}
