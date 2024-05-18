/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package q1_linkedlist;

/**
 *
 * @author tphon
 */
import java.util.*;
public class Main {

    /**
     * @param args the command line arguments
     */
    
    public static void displayList(MyList list, String str){
        System.out.print(str);
        list.traverse();
    }
    
    public static void displayInt(int value, String str){
        System.out.print(str);
        System.out.println(value);
    }
    
    public static void main(String[] args) {
        MyList list = new MyList();
        list.add(1);
        list.add(3);
        list.addToTail(6);
        list.addToTail(18);
        list.addToTail(21);
        list.addToTail(32);
        list.addToTail(2); 
        
        displayList(list, "Origin LinkedList:     ");
        
        list.addToHead(0);
        displayList(list, "List add 0 to head:    ");
        
        list.addToTail(6);
        displayList(list, "List add 6 to tail:    ");
        
        list.addAfter(list.head, 2);
        displayList(list, "List add 2 after head: ");
        
        list.deleteFromHead();
        displayList(list, "List delete from head: ");
       
        list.deleteFromTail();
        displayList(list, "List delete from tail: ");
        
        list.deleteAfter(list.head);
        displayList(list, "List delete after head:");

        
        int value = 5;
        list.deleValue(value);
        displayList(list, "List delete first "+value+":   ");

        
        System.out.println("Number Node in List:    "+list.count());
        
        int index = 2;
        list.deleIndex(index);
        displayList(list, "List delete at "+index+" :     ");
        
          
                
        list.addToTail(6);
        list.addToTail(18);
        list.addToTail(21);
        list.addToTail(32);
        list.addToTail(2);      
        
        displayList(list, "List Unsortted: ");
        list.sort();
        displayList(list, "List Sortted:   ");
        
        int[] temp = list.toArray();
        System.out.println(Arrays.toString(temp));
        
        
        MyList list1 = new MyList();
        list1.addToTail(6);
        list1.addToTail(18);
        list1.addToTail(21);
        list1.addToTail(32);
        list1.addToTail(44);
        list1.addToTail(66);
        MyList list2 = new MyList();
        list2.addToTail(2);
        list2.addToTail(8);
        list2.addToTail(12);
        list2.addToTail(22);
        list2.addToTail(34);
        
        list1.traverse();
        list2.traverse();
        
        displayList(list1.mergeList(list2), "List After Merge list1 list2: ");
        list.addBefore(list.head.next, 11);
        list.traverse();
        
        displayList(list2, "List 2: ");
        displayList(list, "List : ");
        list.Attach(list2);
        displayList(list, "List after attach list 2: ");
    
        System.out.println();
        System.out.println();
        System.out.println();
        System.out.println("After methods from 1 to 18 we have: ");
        displayList(list, "List:   ");
        displayList(list1, "List 1: ");
        displayList(list2, "List 2: ");
        
        displayInt(list2.max(), "Max of List 2: ");
        displayInt(list2.min(), "Min of List 2: ");
        displayInt(list2.sum(), "Sum of List 2: ");
        displayInt(list2.avg(), "Average of List 2: ");
        
        System.out.println("Check Sorted List 2: "+list2.sorted());
        displayList(list2, "List 2: ");
        
        list2.insert(16);
        displayList(list2, "List 2 after insert 16: ");
        
        MyList listReverse = list2.reverseList();
        displayList(listReverse, "List 2 after reverse: ");

    }
}
