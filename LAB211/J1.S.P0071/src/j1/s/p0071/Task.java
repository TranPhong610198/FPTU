/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package j1.s.p0071;

/**
 *
 * @author tphon
 */
public class Task {

    int id, taskId;
    double from, to;
    String name, date, assign, reviewer;

    public Task() {
    }

    public Task(int id, String name, int taskId, String date, double from, double to, String assign, String reviewer) {
        this.id = id;
        this.name = name;
        this.taskId = taskId;
        this.date = date;
        this.from = from;
        this.to = to;
        this.assign = assign;
        this.reviewer = reviewer;
    }

    public String getAssign() {
        return assign;
    }

    public String getDate() {
        return date;
    }

    public double getFrom() {
        return from;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getReviewer() {
        return reviewer;
    }

    public int getTaskId() {
        return taskId;
    }

    public double getTo() {
        return to;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public void setAssign(String assign) {
        this.assign = assign;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setFrom(double from) {
        this.from = from;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setReviewer(String reviewer) {
        this.reviewer = reviewer;
    }

    public void setTo(double to) {
        this.to = to;
    }
    
    public String getTaskType(){
        String result = "";
        switch (taskId) {
            case 1:
                result = "Code";
                break;
            case 2:
                result = "Test";
                break;
            case 3:
                result = "Design";
                break;
            case 4:
                result = "Review";
                break;
        }
        return result;
    }
    
    public double getTime(){
        return to-from;
    }
    
    @Override
    public String toString(){
        return id+"\t"+name.trim()+"\t\t"+getTaskType()+"\t\t"+date+"\t"+getTime()+"\t\t"+assign.trim()+"\t\t"+reviewer.trim();
    }
}
