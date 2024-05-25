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
        Validation valid = new Validation();
        String input = valid.inputString("Enter your content: ");

        String[] words = input.trim().split("\\s+");
        
        Map<String, Integer> wordCount = new HashMap<>();
        Map<Character, Integer> charCount = new HashMap<>();

        for (String word : words) {
            wordCount.put(word, wordCount.getOrDefault(word, 0) + 1);
        }

        for (char ch : input.toLowerCase().toCharArray()) {
            if (Character.isLetter(ch)) {
                charCount.put(ch, charCount.getOrDefault(ch, 0) + 1);
            }
        }

        System.out.println(wordCount);
        System.out.println(charCount);
    }
}
