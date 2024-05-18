
public class Engineer extends Staff{
    int benefits;
    
    public Engineer(int id, int salary, int benefits){
        super(id, salary);
        this.benefits = benefits;
        super.setSalary(salary);
    }
    
    public int getBenefits(){
        return benefits;
    }
    public void setBenefits(int benefits){
        this.benefits = benefits;
    }
    public int getGrossSalary(){
        return getSalary() + benefits;
    }
   
    public String toString(){
        return super.toString() +","+benefits+","+getGrossSalary();
    }
}
