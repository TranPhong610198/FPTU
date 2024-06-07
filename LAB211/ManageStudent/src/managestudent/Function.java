/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package managestudent;

import java.util.*;

/**
 *
 * @author tphon
 */
public class Function {

    Validation Valid = new Validation();

    public void displayMenu() {
        System.out.println("\033[36mWELCOME TO STUDENT MANAGEMENT\033[0m\n"
                + "1.	Create\n"
                + "2.	Find and Sort\n"
                + "3.	Update/Delete\n"
                + "4.	Report\n"
                + "5.	Exit");
    }

    public void create(List<Student> stud) {
        while (true) {
            int id = 1;
            if (!stud.isEmpty()) {
                id = stud.get(stud.size() - 1).getId() + 1;
            }

            if (stud.size() >= 3) {
                String chose = Valid.inputChose("Do you want to continue (Y/N)?", "Eror chose!!! (Y/N)", "Y", "N");
                if (chose.equalsIgnoreCase("Y")) {
                    String sName = Valid.inputString("Student Name: ");
                    int semester = Valid.inputInt("Semester: ", "Eror Semester!!!", 1, 9);
                    String cName = Valid.inputCourse("Course Name: ");

                    Student temp = new Student(id, sName, cName, semester);
                    stud.add(temp);
                } else {
                    return;
                }
            } else {
                String sName = Valid.inputString("Student Name: ");
                int semester = Valid.inputInt("Semester: ", "Eror Semester!!!", 1, 9);
                String cName = Valid.inputCourse("Course Name: ");

                Student temp = new Student(id, sName, cName, semester);
                stud.add(temp);
            }
        }
    }

    public void display(List<Student> stud, String str) {
        System.out.println("\033[36m---------- List Of Student " + str + "----------\n"
                + "ID\tStudent Name\t\tSemester\tCourse Name\033[0m");
        for (Student temp : stud) {
            System.out.println(temp.toString());
        }

    }

    public List<Student> findName(List<Student> stud, String fName) {
        List<Student> tempL = new ArrayList<>();
        for (Student temp : stud) {
            if (temp.getsName().equalsIgnoreCase(fName) || temp.getsName().contains(fName)) {
                tempL.add(temp);
            }
        }
        return tempL;
    }

    public void sort(List<Student> stud) {
        int size = stud.size();
        for (int i = 0; i < size - 1; i++) {
            for (int j = 0; j < size - i - 1; j++) {
                if (stud.get(j).getsName().compareTo(stud.get(j + 1).getsName()) > 0) {
                    Student temp1 = stud.get(j);
                    Student temp2 = stud.get(j + 1);
                    stud.set(j, temp2);
                    stud.set(j + 1, temp1);
                }
            }
        }
    }

    public void findNSort(List<Student> stud) {
        display(stud, "");
        String pName = Valid.inputString("Enter name to find: ");
        List<Student> TempList = findName(stud, pName);
        sort(TempList);
        if (TempList.isEmpty()) {
            System.err.println("No one have \"" + pName + "\" in name!!!");
        } else {
            display(TempList, "After Find And Sort");
        }
    }

    public void update(List<Student> stud, int id) {
        String newSName = Valid.inputString("New student name: ");
        String newCName = Valid.inputCourse("New course name: ");
        int newSemester = Valid.inputInt("New semester: ", "Error semseter !!!(1-9)", 1, 9);

        Student temp = new Student(id, newSName, newCName, newSemester);
        stud.set(id - 1, temp);
    }

    public void delete(List<Student> stud, int id) {
        for (int i = stud.size() - 1; i >= id; i--) {
            Student temp = stud.get(i);
            int tempID = temp.getId();
            temp.setId(tempID - 1);
            stud.set(i, temp);
        }
        stud.remove(id - 1);
    }

    public void updateOrDel(List<Student> stud) {
        display(stud, "");
        int ID = Valid.inputInt("Enter ID: ", "ID not exist!!!", 1, stud.size());
        String chose = Valid.inputChose("Do you want to update (U) or delete (D) student. ", "Eror chose!!! (U/D)", "U", "D");

        if (chose.equalsIgnoreCase("U")) {
            update(stud, ID);
            display(stud, "After Update ID:" + ID);
        } else {
            delete(stud, ID);
            display(stud, "After Delete ID:" + ID);
        }

    }

    public void report(List<Student> stud) {
        Map<String, Map<String, Integer>> reportMap = new HashMap<>();

        for (Student temp : stud) {
            String name = temp.getsName();
            String course = temp.getcName();

            reportMap.putIfAbsent(name, new HashMap<>());
            Map<String, Integer> countCourse = reportMap.get(name);
            countCourse.put(course, countCourse.getOrDefault(course, 0) + 1);
        }

        for (Map.Entry<String, Map<String, Integer>> tempReport : reportMap.entrySet()){
            String name = tempReport.getKey();
            Map<String, Integer> tempCourse = tempReport.getValue();
            for (Map.Entry<String, Integer> temp : tempCourse.entrySet()){
                String course = temp.getKey();
                int times = temp.getValue();
                
                System.out.println(name + "\t|" + course + "\t|" + times);
            }
        }
    }
}
