/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package letterandcharactercount;

import java.util.*;

/**
 *
 * @author tphon
 */

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
    
        Scanner scanner = new Scanner(System.in);

        System.out.println("Input String: ");
        String input = scanner.nextLine();

        scanner.close();
       
        String[] words = input.trim().split("\\s+");
        Map<String, Integer> wordCount = new HashMap<>();
        for (String word : words) {
            wordCount.put(word, wordCount.getOrDefault(word, 0) + 1);
        }

        Map<Character, Integer> charCount = new HashMap<>();
        for (char ch : input.toLowerCase().toCharArray()) {
            if (Character.isLetter(ch)) {
                charCount.put(ch, charCount.getOrDefault(ch, 0) + 1);
            }
        }
            
        System.out.println(wordCount);
      
        System.out.println(charCount);
    }
}

