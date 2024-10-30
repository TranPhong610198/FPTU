
import java.sql.Date;
import java.util.Calendar;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author ADMIN
 */
public class ClassThuatToan {

    public static void main(String[] args) {
    }

    /**
     * Hàm này sử dụng để kiểm tra xem 1 số có phải số lẻ hay không
     *
     * @param number
     * @return
     */
    public static boolean kiemTraSoLe(int number) {
        return number % 2 != 0;
    }

    /**
     * Hàm này sử dụng để kiểm tra xem 1 số có phải là số chẵn không
     *
     * @param number
     * @return
     */
    public static boolean kiemTraSoChan(int number) {
        return number % 2 == 0;
    }

    /**
     * Hàm này sử dụng để kiểm tra 1 số có phải là palindrome không ví dụ: 121,
     * 12321, 4554
     *
     * @param number
     * @return
     */
    public static boolean kiemTraPalindrome(int number) {
        if (number < 0) {
            return false; // Negative numbers are not considered palindromes
        }
        int reversed = 0;
        int original = number;
        while (number != 0) {
            int lastDigit = number % 10;
            reversed = reversed * 10 + lastDigit;
            number /= 10;
        }
        return original == reversed;
    }

    /**
     * Hàm này sử dụng để tính fibonacci của 1 số bằng bao nhiêu
     *
     * @param n
     * @return
     */
    public static int fibonacci(int n) {
        if (n <= 1) {
            return n;
        }
        int fib = 1;
        int prevFib = 1;

        for (int i = 2; i < n; ++i) {
            int temp = fib;
            fib += prevFib;
            prevFib = temp;
        }

        return fib;
    }

    /**
     * Kiểm tra năm nhuận
     *
     * @param year
     * @return
     */
    public static boolean kiemTraNamNhuan(int year) {
        // A leap year is divisible by 4 but not by 100, unless it is also divisible by 400.
        return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
    }

    /**
     * Kiểm tra chuỗi đối xứng
     *
     * @param str
     * @return
     */
    public static boolean kiemTraChuoiDoiXung(String str) {
        int i = 0;
        int j = str.length() - 1;
        while (i < j) {
            if (str.charAt(i) != str.charAt(j)) {
                return false; // Characters do not match
            }
            i++;
            j--;
        }
        return true; // All characters matched, it's a palindrome
    }

    /**
     * tính tổng số lẻ từ 0 -> số truyền vào
     *
     * @param upto
     * @return
     */
    public static int tinhTongSoLe(int upto) {
        int sum = 0;
        for (int number = 1; number <= upto; number++) {
            if (kiemTraSoLe(number)) {
                sum += number;
            }
        }
        return sum;
    }

    /**
     * tính tổng số chẵn từ 0 -> số truyền vào
     *
     * @param upto
     * @return
     */
    public static int tinhTongSoChan(int upto) {
        int sum = 0;
        for (int i = 0; i <= upto; i++) {
            if (kiemTraSoChan(i)) {
                sum += i;
            }
        }
        return sum;
    }

    /**
     * kiểm tra 1 số có phải là số chính phương không
     *
     * @param number
     * @return
     */
    public static boolean kiemTraSoChinhPhuong(int number) {
        if (number < 0) {
            return false; // Negative numbers cannot be perfect squares
        }

        int sqrt = (int) Math.sqrt(number);
        return sqrt * sqrt == number;
    }

    /**
     * tìm ước chung lớn nhất của 2 số
     *
     * @param a
     * @param b
     * @return
     */
    public static int timUocChungLonNhat(int a, int b) {
        while (b != 0) {
            int temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }

    /**
     * tìm ước chung nhỏ nhất của 2 số
     *
     * @param a
     * @param b
     * @return
     */
    public static int timUocChungNhoNhat(int a, int b) {
        return a * (b / timUocChungLonNhat(a, b));
    }

    /**
     * code tính tổng các số từ 0 -> số được truyền vào trong java
     *
     * @param number
     * @return
     */
    public static int tinhTongTu0(int number) {
        int sum = 0;
        for (int i = 1; i <= number; i++) {
            sum += i;
        }
        return sum;
    }

    /**
     * code đảo ngược 1 số
     *
     * @param number
     * @return
     */
    public static int daoNguocSo(int number) {
        int reversed = 0;
        while (number != 0) {
            int lastDigit = number % 10;
            reversed = reversed * 10 + lastDigit;
            number /= 10;
        }
        return reversed;
    }
    
    /**
     * code tính giai thừa 1 số
     * @param number
     * @return 
     */
    public static long tinhGiaiThua(int number) {
        long result = 1;
        for (int factor = 2; factor <= number; factor++) {
            result *= factor;
        }
        return result;
    }
    
    /**
     * kiểm tra xem đủ tuổi chưa
     * @param birthDate
     * @param age: số tuổi bạn muốn kiểm tra
     * @return 
     */
    public static boolean kiemTraXemDuTuoiChua(Date birthDate, int age) {
        // Get today's date
        Calendar today = Calendar.getInstance();
        
        // Get the date for the birth date
        Calendar birthDay = Calendar.getInstance();
        birthDay.setTime(birthDate);
        
        // Subtract the age from the year field
        birthDay.add(Calendar.YEAR, age);
        
        // Check if the birth day after adding the age is before or equal to today
        return !birthDay.after(today);
    }
    
    /**
     * kiểm tra xem chuỗi truyền vào có đủ số lượng kí tự từ min tới max hay không
     * @param input
     * @param min
     * @param max
     * @return 
     */
    public static boolean kiemTraXemCoDuSoLuongKiTuKhong(String input, int min, int max) {
        if (input == null) {
            return false; // Null string does not meet any length requirements
        }
        int length = input.length();
        return length >= min && length <= max;
    }
    /**
     * kiểm tra số nguyên tố
     * @param number
     * @return 
     */
    public static boolean kiemTraSoNguyenTo(int number) {
        if (number <= 1) {
            return false; // 0 and 1 are not prime numbers
        }
        for (int i = 2; i <= Math.sqrt(number); i++) {
            if (number % i == 0) {
                return false; // Number is divisible by another number, so not prime
            }
        }
        return true; // Number is prime
    }
}
