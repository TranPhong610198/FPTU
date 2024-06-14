/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package managestudent;

/**
 *
 * @author tphon
 */
public class Student {
    private int id, semester, idStudent;
    private String sName, cName;

    public Student() {
    }

    public Student(int id, String sName, String cName, int semester, int idStudent) {
        this.id = id;
        this.sName = sName;
        this.cName = cName.toUpperCase();
        this.semester = semester;
        this.idStudent = idStudent;
    }

    public int getIdStudent(){
        return idStudent;
    }
    
    public int getId() {
        return id;
    }

    public String getsName() {
        return sName;
    }

    public String getcName() {
        return cName;
    }

    public int getSemester() {
        return semester;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setsName(String sName) {
        this.sName = sName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }
    
    public void setIdStudent(int idStudent){
        this.idStudent = idStudent;
    }
    
    @Override
    public String toString(){
        return id+"\t"+sName.trim()+"\t\t"+semester+"\t\t"+cName.trim()+"\t\t"+idStudent;
    }
}
