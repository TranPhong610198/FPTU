public class Student implements Comparable{
    
    public String id;
    public String name;
    public double gpa;

    
    public Student(String id, String name, double gpa){
        this.id = id;
        this.name = name;
        this.gpa = gpa;
    }
    
    public String getName(){
        return name;
    }
    
    public double getGPA(){
        return gpa;
    }
    
    @Override
    public int compareTo(Object o) {
        Student test = (Student) o;
        int check = this.name.compareTo(test.name);
        if (check == 0) return Double.compare(this.gpa, test.gpa);
        return check;
    }
}
