import java.util.*;

public class ProcessStudent {
    public void sortStudent(List<Student> li){
        Collections.sort(li);
    }
    
    public List<Student> find_by_partial_name(List<Student> li, String letter){
        ArrayList<Student> result1 = new ArrayList();
        for(Student stdu : li){
            if (stdu.getName().contains(letter))
                result1.add(stdu);
        }
        return result1;
    }
    
    public List<Student> find_higher_gpa(List<Student> li, int gpa){
        ArrayList<Student> result2 = new ArrayList();
        for(Student stdu : li){
            if (stdu.getGPA() > gpa)
                result2.add(stdu);
        }
    return result2;
    }
}   