/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class ExecutionItems{
    private int executionItemId;
    private int arrayItem;
    private int executionId;

    public ExecutionItems() {
    }

    public ExecutionItems(int executionItemId, int arrayItem, int executionId) {
        this.executionItemId = executionItemId;
        this.arrayItem = arrayItem;
        this.executionId = executionId;
    }

    public int getArrayItem() {
        return arrayItem;
    }

    public int getExecutionId() {
        return executionId;
    }

    public int getExecutionItemId() {
        return executionItemId;
    }

    public void setArrayItem(int arrayItem) {
        this.arrayItem = arrayItem;
    }

    public void setExecutionId(int executionId) {
        this.executionId = executionId;
    }

    public void setExecutionItemId(int executionItemId) {
        this.executionItemId = executionItemId;
    }

    
}
