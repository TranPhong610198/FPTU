#include<stdio.h>
#include<string.h>
#include<math.h>
#include<stdlib.h>
#include<stdbool.h>
int i, j;
int main(){
    char str[100];
    j=0;
    scanf("%[^\n]", &str);
    for (i=0; i<strlen(str); i++){
        if(str[i] != ' '){
            if ((str[i+1] == ' ' || str[i+1] == "\t" ))
            {
                j++;
            }
            
        }
    }
    printf("%d", j);
}