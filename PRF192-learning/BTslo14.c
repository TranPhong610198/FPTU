// Q2: Anagram Check:
// Write a program that accepts two strings from the user and checks whether they are anagrams or not.
// Anagrams are strings that have the same characters but in a different order.

#include<stdio.h>
#include<string.h>
#include<math.h>
#include<stdlib.h>
#include<stdbool.h>
int i, j;

void sortString(char str[]){
    for(i=0; i<strlen(str)-1; i++){
        for (j=i+1; j<strlen(str); j++){
            if(str[i] > str[j]){
                char temp = str[i];
                str[i] = str[j];
                str[j] = temp;
            }
        }
    }
}

bool checkAnagrams(char str1[], char str2[]){
    if (strlen(str1) != strlen(str2))
        return false;
    sortString(str1);
    sortString(str2);
    if(strcmp(str1,str2) != 0)
        return false;
    return true;
}

int main(){
    char str1[100], str2[100];
    scanf("%s %s", &str1, &str2);
    if (strcmp(str1,str2) == 0)
        printf("They are the same not are Anagrams. ");
    else if (checkAnagrams(str1, str2))
        printf("They are Anagrams.");
    else
        printf("They are not Anagrams.");
}