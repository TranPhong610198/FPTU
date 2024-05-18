package Item;

import java.util.Scanner;

public class AntiqueShop {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        ItemList obj = new ItemList();
        Item item1 = new Vase(sc);
        Item item2 = new Statue(sc);
        Item item3 = new Painting(sc);
        int choice;
        choice = sc.nextInt();
        
        switch (choice) {
            case 1:{ //add vase
                item1.input();
                item2.input();
                item3.input();
                obj.addItem(item1);
                obj.addItem(item2);
                obj.addItem(item3);
                obj.numOfItem = 3;
                Item tmp = new Vase(sc);
                tmp.input();
                if (obj.addItem(tmp)) {
                    System.out.println("One vase added");
                }
                break;
            }
            case 2:{ //add statue
                item1.input();
                item2.input();
                item3.input();
                obj.addItem(item1);
                obj.addItem(item2);
                obj.addItem(item3);
                obj.numOfItem = 3;
                Item tmp = new Statue(sc);
                tmp.input();
                if (obj.addItem(tmp)) {
                    System.out.println("One statue added");
                }
                break;
            }
            case 3:{ //add painting
                item1.input();
                item2.input();
                item3.input();
                obj.addItem(item1);
                obj.addItem(item2);
                obj.addItem(item3);
                obj.numOfItem = 3;                
                Item tmp = new Painting(sc);
                tmp.input();
                if (obj.addItem(tmp)) {
                    System.out.println("One painting added");
                }
                break;
            }
            case 4:{ //display all
                item1.input();
                item2.input();
                item3.input();
                obj.addItem(item1);
                obj.addItem(item2);
                obj.addItem(item3);
                obj.numOfItem = 3;
                obj.displayAll();
                break;
            }
            case 5:{ //findItem by Creator
                item1.input();
                item2.input();
                item3.input();
                obj.addItem(item1);
                obj.addItem(item2);
                obj.addItem(item3);
                obj.numOfItem = 3;
                String find = sc.next();
                obj.displayItemsByType(find);
                break;
            }
            case 6:{ //updateItem
                item1.input();
                item2.input();
                item3.input();
                obj.addItem(item1);
                obj.addItem(item2);
                obj.addItem(item3);
                obj.numOfItem = 3;
                int index = sc.nextInt();
                obj.updateItem(index);
                break;
            }
            case 7:{ //removeItemByIndex
                item1.input();
                item2.input();
                item3.input();
                obj.addItem(item1);
                obj.addItem(item2);
                obj.addItem(item3);
                obj.numOfItem = 3;
                int index = sc.nextInt();
                obj.removeItem(index);
                System.out.println("One item removed");
                obj.displayAll();
                break;
            }
            case 8:{ //displayVaseItem
                item1.input();
                item2.input();
                item3.input();
                obj.addItem(item1);
                obj.addItem(item2);
                obj.addItem(item3);
                obj.numOfItem = 3;
                String find = sc.next();
                obj.displayItemsByType(find);
                break;
            }
            case 9:{ //sortByValue
                item1.input();
                item2.input();
                item3.input();
                obj.addItem(item1);
                obj.addItem(item2);
                obj.addItem(item3);
                obj.numOfItem = 3;
                obj.sortItems();
                obj.displayAll();
                break;
            }
            default: {
                
                break;
            }
        } //end switch
    }
}
