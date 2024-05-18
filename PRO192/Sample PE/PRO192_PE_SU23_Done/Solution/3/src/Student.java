import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Student implements Comparable<Student> {
    public String id;
    public String name;
    public double gpa;

    public Student() {}

    public Student(String id, String name, double gpa) {
        this.id = id;
        this.name = name;
        this.gpa = gpa;
    }

    @Override
    public int compareTo(Student other) {
        int nameComparison = this.name.compareTo(other.name);
        if (nameComparison == 0) {
            return Double.compare(this.gpa, other.gpa);
        }
        return nameComparison;
    }
}