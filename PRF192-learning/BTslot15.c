//Nhap vao chuoi dem so tu trong chuoi
#include<stdio.h>
#include<string.h>
#include<math.h>
#include<stdlib.h>
#include<stdbool.h>
int i, j;
int main(){
    char str[100];
    scanf("%[^\n]", &str);
    int n = strlen(str);
    int count=1;
    for (i=0; i<n; i++){
        if(str[i]==' ' && str[i-1]!=' ' && str[i-1]!='\n' && str[i-1]!='\t' && str[i+1]!='\n' && str[i+1]!='\t' && str[i+1] !=' ')
            count ++;
    }
    printf("So tu trong chuoi la: %d", count);
}
