/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Executions {
    private int executionId;
    private int result;

    public Executions() {
    }

    public Executions(int executionId, int result) {
        this.executionId = executionId;
        this.result = result;
    }

    public int getExecutionId() {
        return executionId;
    }

    public int getResult() {
        return result;
    }

    public void setExecutionId(int executionId) {
        this.executionId = executionId;
    }

    public void setResult(int result) {
        this.result = result;
    }


    
}
