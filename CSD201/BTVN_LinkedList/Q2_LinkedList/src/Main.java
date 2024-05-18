public class Main {
    public static void main(String[] args) {
        MyList list = new MyList();
        
        //1
        list.addToHead("University");
        list.addToHead("FPT");
        
        //2
        list.addToTail("k18");
        
        //3
        list.addAfter(list.head.next, "SE1881")
                ;
        //4
        System.out.print("1,2,3,4. List current: ");
        list.traverse();  
        
        //5,6
        System.out.println("5. Deleted from head: " + list.deleteFromHead());  
        System.out.println("6. Deleted from tail: " + list.deleteFromTail());  
        System.out.print("List current: ");
        list.traverse();  
        
        //7
        System.out.println("7. Deleted after head: " + list.deleteAfter(list.head)); 
        System.out.print("List current: ");
        list.traverse();  

        list.addToHead("HaNoi");
        list.addToTail("VietNam");
        System.out.print("List current: ");
        list.traverse(); 
       
        //8
        list.delete("University");
        System.out.print("8. List current: ");
        list.traverse(); 
       
        //9
        Node foundNode = list.search("HaNoi");
        if (foundNode != null) {
            System.out.println("9. Node found: " + foundNode.info);  
        }
        
        //10
        System.out.println("10. Number of nodes: " + list.count());  
    }
}