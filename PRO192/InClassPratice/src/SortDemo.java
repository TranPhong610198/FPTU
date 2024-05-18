import java.lang.*;
import java.util.*;

class Employee implements Comparable {
    String ID = "", name = "";
    int salary = 0;
    
    public Employee(Scanner scan){
        this.ID = scan.next();
        this.name = scan.next();
        this.salary = scan.nextInt();
    }
    
    public Employee(String id, String n, int s){
        this.ID = id;
        this.name = n; 
        this.salary = s;
    }    

    public String toString(){
        return ID + "," +name + "," + salary ;
    }

    public int compareTo(Object emp){
        if (ID.compareTo(((Employee)emp).ID)>0) return 1;
        else if (ID.compareTo(((Employee)emp).ID)== 0) return 0;
        return -1;
    }

public static Comparator compareObj = new Comparator() {
    public int compare(Object e1, Object e2){
        Employee emp1 = (Employee) e1;
        Employee emp2 = (Employee) e2;
        int d = emp1.salary - emp2.salary;
        if (d>0) return -1;
        if (d==0) return emp1.ID.compareTo(emp2.ID);
        return 1;
    }   
};
}
public class SortDemo {
    
    public static void output(ArrayList<Employee> list){
        System.out.println("[" + list.get(0).toString()+ ",");
        for (int i=1; i<list.size()-1; i++){
            System.out.println(" " + list.get(i).toString() + ",");
        }
        System.out.println(" " + list.get(list.size()-1).toString() + "]");
    }
    
    public static void main(String[] args) {
        
        Scanner scan = new Scanner(System.in);
        ArrayList<Employee> list = new ArrayList<>();
//        list.add(new Employee("HE0001", "Jole", 1000));
//        list.add(new Employee("HE0100", "Peter", 1000));
//        list.add(new Employee("HE1000", "Miler", 2000));
//        list.add(new Employee("HE0500", "Tom", 2000));
//        list.add(new Employee("HE0050", "John", 1000));
//        list.add(new Employee("HE0800", "Mike", 100));
        int n = scan.nextInt();
        for (int i=0; i<n; i++){
            list.add(new Employee(scan));
        }
        System.out.println("Ascending sorting based on employee's ID:");
        Collections.sort(list);        
//        System.out.println(list);
        output(list);
        
        System.out.println("Ascending sorting based on employee's salary and ID:");
        Collections.sort(list, Employee.compareObj);
//        System.out.println(list);
        output(list);
        
        System.out.println("Check TreeSet sorting:");
        TreeSet<Employee> treeSet = new TreeSet<>(list);
        output(new ArrayList<>(treeSet));
    }
}
