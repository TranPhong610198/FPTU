
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ProcessStudent {
    public void sortStudent(List<Student> l) {
        Collections.sort(l);
    }

    public List<Student> find_by_partial_name(List<Student> l, String letter) {
        ArrayList<Student> filteredL = new ArrayList<>();
        for (Student student : l) {
            if (student.name.contains(letter)) {
                filteredL.add(student);
            }
        }
        return filteredL;
    }

    public List<Student> find_higher_gpa(List<Student> l, int gpa) {
        ArrayList<Student> filteredL = new ArrayList<>();
        for (Student student : l) {
            if (student.gpa > gpa) {
                filteredL.add(student);
            }
        }
        return filteredL;
    }
}