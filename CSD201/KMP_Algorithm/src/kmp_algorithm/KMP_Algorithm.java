/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package kmp_algorithm;

/**
 *
 * @author tphon
 */
public class KMP_Algorithm {
    
    void KMPSearch(String pat, String txt) {
        int M = pat.length();
        int N = txt.length();

        // Tạo mảng lps sẽ chứa độ dài của tiền tố/hậu tố lớn nhất
        int lps[] = new int[M];
        int j = 0; // index cho pat[]

        // Tiền xử lý pattern để tính lps array
        computeLPSArray(pat, M, lps);

        int i = 0; // index cho txt[]
        while (i < N) {
            if (pat.charAt(j) == txt.charAt(i)) {
                j++;
                i++;
            }
            if (j == M) {
                System.out.println("Pattern found at index " + (i - j));
                j = lps[j - 1];
            } else if (i < N && pat.charAt(j) != txt.charAt(i)) {
                if (j != 0) {
                    j = lps[j - 1];
                } else {
                    i = i + 1;
                }
            }
        }
    }

    void computeLPSArray(String pat, int M, int lps[]) {
        int len = 0; // độ dài của tiền tố/hậu tố trước đó
        int i = 1;
        lps[0] = 0; // lps[0] luôn luôn là 0

        // Tính lps[i] cho i = 1 đến M-1
        while (i < M) {
            if (pat.charAt(i) == pat.charAt(len)) {
                len++;
                lps[i] = len;
                i++;
            } else { // (pat[i] != pat[len])
                if (len != 0) {
                    len = lps[len - 1];
                } else { // if (len == 0)
                    lps[i] = len;
                    i++;
                }
            }
        }
    } 
}

