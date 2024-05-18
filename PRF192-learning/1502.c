#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
int i,j;

void inputStrings(char str[]){
	printf("Enter a string (up to 99 characters): ");
	gets(str);

	while(strlen(str) >99){
		printf("length of strings smaller than 99\nInput again: ");
		gets(str);
	}
}

bool checkSymmetric(char str[]){
	int n = strlen(str);
	for (i=0; i<n/2; i++){
		if (str[i] != str[(n-i-1)])
			return false;
	}
	return true;
}

int main() {
  system("cls");
  //INPUT - @STUDENT:ADD YOUR CODE FOR INPUT HERE:
	char str[100];
	inputStrings(str);


    // Fixed Do not edit anything here.
    printf("\nOUTPUT:\n");
    //@STUDENT: WRITE YOUR OUTPUT HERE:
    if (checkSymmetric(str))
		printf("The string is symmetric.");
	else
		printf("The string is not symmetric."); 
    
    //--FIXED PART - DO NOT EDIT ANY THINGS HERE
    printf("\n");
    system ("pause");
    return(0);
}
