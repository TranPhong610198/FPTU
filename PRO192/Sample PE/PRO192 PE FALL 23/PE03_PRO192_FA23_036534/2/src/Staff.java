
public class Staff {
    int id;
    int salary;
    
    public Staff(){}
    public Staff(int id, int salary){
        this.id = id;
        this.salary = salary;
    }
    
    public int getId(){
        return id;
    }
    public int getSalary(){
        return salary;
    }    
    public void setSalary(int salary){
        if(salary <1000) this.salary = 1000;
        else this.salary = salary;
    }
    
    public String toString(){
        return id + "," + salary;
    }
}
