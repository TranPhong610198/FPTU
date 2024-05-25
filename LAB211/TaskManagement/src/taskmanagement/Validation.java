/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package taskmanagement;

import java.util.*;
import java.lang.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 *
 * @author tphon
 */
public class Validation {

    public int inputInt(String msg, String wrongMsg, int MIN, int MAX) {
        Scanner scan = new Scanner(System.in);
        System.out.print(msg);
        while (true) {
            try {
                int temp = Integer.parseInt(scan.nextLine().trim());
                if (temp < MIN || temp > MAX) {
                    throw new NumberFormatException();
                }
                return temp;
            } catch (NumberFormatException e) {
                System.err.print(wrongMsg);
            }
        }
    }

    public String inputString(String str) {
        Scanner scanner = new Scanner(System.in);
        while (true) {
            try {
                System.out.print(str);
                String input = scanner.nextLine();
                if (input == null || input.trim().isEmpty()) {
                    throw new Exception("String can't be empty!!!");
                }
                return input;
            } catch (Exception e) {
                System.err.println(e.getMessage());
            }
        }
    }

    public String inputDate(String str) {
        Scanner scan = new Scanner(System.in);
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        dateFormat.setLenient(false);
        System.out.print(str);
        while (true) {
            try {
                Date date = dateFormat.parse(scan.next());
                return dateFormat.format(date);
            } catch (ParseException e) {
                System.err.print("Enter with date format dd-MM-yyyy: ");
            }
        }
    }

    public double inputFrom() {
        Scanner scan = new Scanner(System.in);
        while (true) {
            System.out.print("From: ");
            try {
                double from = Double.parseDouble(scan.next());
                if (from < 8 || from > 17.5) {
                    throw new NumberFormatException();
                }
                if (from - (int) from != 0.0) {
                    if (from - (int) from == 0.5) {
                        return from;
                    } else {
                        throw new Exception();
                    }
                }
                return from;
            } catch (NumberFormatException e) {
                System.err.println("Start time must between 8-17!!!");
            } catch (Exception e) {
                System.err.println("Time must be .0 or .5!!!");
            }
        }
    }

    public double inputTo(double from) {
        Scanner scan = new Scanner(System.in);
        while (true) {
            System.out.print("To: ");
            try {
                double to = Double.parseDouble(scan.next());
                if (to < 8 || to > 17.5) {
                    throw new NumberFormatException();
                }
                if (to - (int) to != 0.0) {
                    if (to - (int) to == 0.5) {
                        return to;
                    } else {
                        throw new Exception();
                    }
                }
                if (to < from) {
                    throw new Throwable();
                }
                return to;
            } catch (NumberFormatException e) {
                System.err.println("End time must between 8-17!!!");
            } catch (Exception e) {
                System.err.println("Time must be .0 or .5!!!");
            } catch (Throwable e) {
                System.err.println("End time must greater than start");
            }
        }
    }

    public boolean duplicate(String name, String date, double from, double to, List<Task> task) {
        boolean check = false;
        if (!task.isEmpty()) {
            for (Task temp : task) {
                if (temp.getName().equalsIgnoreCase(name) && temp.getDate().equals(date)) {
                    if (temp.getFrom() >= to || temp.getTo() <= from) {
                        check = false;
                    } else {
                        check = true;
                        break;
                    }
                }
            }
        }
        return check;
    }
}
