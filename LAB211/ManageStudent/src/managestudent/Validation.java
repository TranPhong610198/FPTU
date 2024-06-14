/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package managestudent;

import java.util.List;
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
                String input = scanner.nextLine().trim();
                if (input == null || input.isEmpty()) {
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
                String input = scan.nextLine().trim();
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
                String input = scanner.nextLine().trim();
                if (input == null || input.isEmpty()) {
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
            } catch (Exception e) {
                System.err.println("course not exist!!! (Java|.Net|C/C++)");
            }
        }
    }

    public boolean isDuplicate(List<Student> stud, Student temp) {
        for (Student tempStud : stud) {
            if (tempStud.getsName().equalsIgnoreCase(temp.getsName())
                    && tempStud.getcName().equalsIgnoreCase(temp.getcName())
                    && tempStud.getSemester() == temp.getSemester()) {
                return true;
            }
        }
        return false;
    }

    public String upName(String str, List<Student> stud, int id) {
        Scanner scanner = new Scanner(System.in);

        System.out.print(str);
        String input = scanner.nextLine().trim();
        if (input == null || input.isEmpty()) {
            return stud.get(id - 1).getsName();
        }
        return input;
    }

    public String upCourse(String str, List<Student> stud, int id) {
        Scanner scanner = new Scanner(System.in);
        while (true) {
            try {
                System.out.print(str);
                String input = scanner.nextLine().trim();
                if (input == null || input.isEmpty()) {
                    return stud.get(id - 1).getcName();
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
            } catch (Exception e) {
                System.err.println("course not exist!!! (Java|.Net|C/C++)");
            }
        }
    }

    public int upSemester(int MIN, int MAX, List<Student> stud, int id) {
        Scanner scan = new Scanner(System.in);

        while (true) {
            System.out.print("Enter semester: ");
            try {
                String input = scan.nextLine().trim();
                if (input == null || input.trim().isEmpty()) {
                    return stud.get(id - 1).getSemester();
                }
                int temp = Integer.parseInt(input);
                if (temp < MIN || temp > MAX) {
                    throw new NumberFormatException();
                }
                return temp;
            } catch (NumberFormatException e) {
                System.err.println("Error semester!!!");
            }
        }
    }

}
