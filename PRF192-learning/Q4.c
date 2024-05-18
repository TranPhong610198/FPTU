#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
int i,j;
int main() {
system("cls");
char input[100], ch;
//INPUT - @STUDENT:ADD YOUR CODE FOR INPUT HERE:
printf("Enter a string: ");
//fgets(input, sizeof(input), stdin);
scanf("%[^\n]", &input);
j=0;
for(i=0 ; i<strlen(input); i++){
	ch = toupper(input[i]);
	if(ch=='E' || ch=='U' || ch=='O' || ch=='A' || ch=='I'){
		j++;
	}
}

// Fixed Do not edit anything here.
//printf("\nOUTPUT:\n");
//@STUDENT: WRITE YOUR OUTPUT HERE:
//printf("The entered string is: %s\n", input);
printf("Number of vowels : %d", j);
//--FIXED PART - DO NOT EDIT ANY THINGS HERE
printf("\n");
system ("pause");
return(0);
}
