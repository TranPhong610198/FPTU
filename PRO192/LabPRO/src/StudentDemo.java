import java.util.Date;

class Student {

    private String name;
    private String studentId;
    private Date birthDate;
    private String address;
    private String major;
    private double gpa;

    // Constructor
    public Student(String name, String studentId, Date birthDate, String address, String major, double gpa) {
        this.name = name;
        this.studentId = studentId;
        this.birthDate = birthDate;
        this.address = address;
        this.major = major;
        this.gpa = gpa;
    }

    // Accessor methods
    public String getName() {
        return name;
    }

    public String getStudentId() {
        return studentId;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public String getAddress() {
        return address;
    }

    public String getMajor() {
        return major;
    }

    public double getGpa() {
        return gpa;
    }

    // Mutator methods
    public void setName(String name) {
        this.name = name;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public void setGpa(double gpa) {
        this.gpa = gpa;
    }

    // Print all attributes
    public void printAllAttributes() {
        System.out.println("Student name: " + name);
        System.out.println("Student ID: " + studentId);
        System.out.println("Student birthday: " + birthDate);
        System.out.println("Student address: " + address);
        System.out.println("Student major: " + major);
        System.out.println("Student gpa: " + gpa);
    }
}
public class StudentDemo {

    public static void main(String[] args) {
        // Create a Date object for birthdate
        Date dob; // Adjust the parameters according to your input
        dob = new Date(100, 5, 3);

        // Create a Student object using the constructor
        Student st = new Student("Student1", "DE140192", dob, "Kon Tum", "Software Engineering", 6.0);

        // Print all attributes using the printAllAttributes method
        st.printAllAttributes();
    }
}