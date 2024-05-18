package pt1_1_4;

import java.util.Scanner;

public class AntiqueShop {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int input = scanner.nextInt();
        Vase        item1;
        Statue      item2;
        Painting    item3;

        switch (input) {
            case 1:
                item1 = new Vase(scanner);
                item2 = new Statue(scanner);
                item3 = new Painting(scanner);
                Vase item4 = new Vase(scanner);
                
                item1.inputVase();
                item2.inputStatue();
                item3.inputPainting();
                item4.inputVase();
                
                System.out.println("One vase added");
                item1.outputVase();
                item2.outputStatue();
                item3.outputPainting();
                item4.outputVase();
                break;
            case 2:
                item1 = new Vase(scanner);
                item2 = new Statue(scanner);
                item3 = new Painting(scanner);
                Statue item5 = new Statue(scanner);
                
                item1.inputVase();
                item2.inputStatue();
                item3.inputPainting();
                item5.inputStatue();
                
                System.out.println("One statue added");
                item1.outputVase();
                item2.outputStatue();
                item3.outputPainting();
                item5.outputStatue();
                break;
            case 3:
                item1 = new Vase(scanner);
                item2 = new Statue(scanner);
                item3 = new Painting(scanner);
                Painting item6 = new Painting(scanner);
                
                item1.inputVase();
                item2.inputStatue();
                item3.inputPainting();
                item6.inputPainting();
                
                System.out.println("One painting added");
                item1.outputVase();
                item2.outputStatue();
                item3.outputPainting();
                item6.outputPainting();
                break;
            case 4:
                item1 = new Vase(scanner);
                item2 = new Statue(scanner);
                item3 = new Painting(scanner);
                
                item1.inputVase();
                item2.inputStatue();
                item3.inputPainting();
                // item4.inputPainting();
                
                // System.out.println("One painting added");
                item1.outputVase();
                item2.outputStatue();
                item3.outputPainting();
                // item4.outputPainting();
                break;
            case 5:
                item1 = new Vase(scanner);
                item2 = new Statue(scanner);
                item3 = new Painting(scanner);
                
                item1.inputVase();
                item2.inputStatue();
                item3.inputPainting();
                
                String find = scanner.next();
                if (find.equals(item1.creator)) item1.outputVase();
                else if (find.equals(item2.creator)) item2.outputStatue();
                else if (find.equals(item3.creator)) item3.outputPainting();
                else System.out.println("No find Item");
                break;
            case 6:
                item1 = new Vase(scanner);
                item2 = new Statue(scanner);
                item3 = new Painting(scanner);
                
                item1.inputVase();
                item2.inputStatue();
                item3.inputPainting();
                
                int No = scanner.nextInt();
                if (No == 0) item1.inputVase();
                if (No == 1) item2.inputStatue();
                if (No == 2) item3.inputPainting();
                
                System.out.println("One item updated");
                item1.outputVase();
                item2.outputStatue();
                item3.outputPainting();
                break;
            case 7:
                item1 = new Vase(scanner);
                item2 = new Statue(scanner);
                item3 = new Painting(scanner);
                
                item1.inputVase();
                item2.inputStatue();
                item3.inputPainting();
                
                int Rm = scanner.nextInt();
                
                System.out.println("One item removed");
                if (Rm == 0) {
                    item2.outputStatue();
                    item3.outputPainting();
                }
                if (Rm == 1) {
                    item1.outputVase();
                    item3.outputPainting();
                }
                if (Rm == 2) {
                    item1.outputVase();
                    item2.outputStatue();
                }
                break;
            case 8:
                item1 = new Vase(scanner);
                item2 = new Statue(scanner);
                item3 = new Painting(scanner);
                
                item1.inputVase();
                item2.inputStatue();
                item3.inputPainting();
                
                String Type = scanner.next();
                if (Type.equals("Vase"))  item1.outputVase();
                else if (Type.equals("Statue"))  item2.outputStatue();
                else if (Type.equals("Painting"))  item3.outputPainting();
                else System.out.println("No find Item");
                break;
            case 9:
                item1 = new Vase(scanner);
                item2 = new Statue(scanner);
                item3 = new Painting(scanner);
                
                item1.inputVase();
                item2.inputStatue();
                item3.inputPainting();
               
                item1.outputVase();
                item2.outputStatue();
                item3.outputPainting();
                break;
            default:
                System.out.println("Invalid input");
        }
    }
}