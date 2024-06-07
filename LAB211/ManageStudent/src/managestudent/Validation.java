/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package managestudent;

import java.util.Scanner;

/**
 *
 * @author tphon
 */
public class Validation {

    public int inputInt(String msg, String wrongMsg, int MIN, int MAX) {
        Scanner scan = new Scanner(System.in);

        while (true) {
            System.out.print(msg);
            try {
                int temp = Integer.parseInt(scan.nextLine().trim());
                if (temp < MIN || temp > MAX) {
                    throw new NumberFormatException();
                }
                return temp;
            } catch (NumberFormatException e) {
                System.err.println(wrongMsg);
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

    public String inputChose(String msg, String err, String char1, String char2) {
        Scanner scan = new Scanner(System.in);
        while (true) {
            try {
                System.out.print(msg);
                String input = scan.nextLine();
                if (!input.equalsIgnoreCase(char1)) {
                    if (!input.equalsIgnoreCase(char2)) {
                        throw new Exception();
                    }
                    return input;
                }
                return input;
            } catch (Exception e) {
                System.err.println(err);
            }
        }
    }

    public String inputCourse(String msg) {
        Scanner scanner = new Scanner(System.in);
        while (true) {
            try {
                System.out.print(msg);
                String input = scanner.nextLine();
                if (input == null || input.trim().isEmpty()) {
                    throw new Error();
                }
                if (!input.equalsIgnoreCase("java")) {
                    if (!input.equalsIgnoreCase(".net")) {
                        if (!input.equalsIgnoreCase("c/c++")) {
                            throw new Exception();
                        }
                        return input;
                    }
                    return input;
                }
                return input;
            } catch (Error e) {
                System.err.println("String can't be empty!!!");
            } catch (Exception e){
                System.err.println("course not exist!!! (Java|.Net|C/C++)");
            }
        }
    }
}
