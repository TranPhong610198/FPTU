#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int i,j;
void inputStrings(int n, char strings[][100]) {
	for(i=0; i<n; i++){
        printf("Enter string #%d: ",i+1);
        scanf("%[^\n]", &strings[i]);
        getchar();
    }
}

void displayStrings(int n, char strings[][100]) {
	printf("Entered strings: \n");
    for (i=0; i<n; i++){
        printf("%s\n", strings[i]);
    }
}

void searchCharacter(int n, char strings[][100], char character) {
	for(i=0; i<n; i++){
		for (j=0; j<strlen(strings[i]); j++){
			if(strings[i][j] == character){
				printf("%s\n", strings[i]);
				break;
			}
		}
	}
}

int main() {
 	system("cls"); 
	// INPUT - @STUDENT: ADD YOUR CODE FOR INPUT HERE:
	int n;
	char ch , strings[25][100];
	printf("Enter the number of strings (n>0 and n<=20): ");
	scanf("%d", &n);
	if (n>0 && n<20){
	// Fixed Do not edit anything here.
	printf("\nOUTPUT:\n");
	//@STUDENT: WRITE YOUR OUTPUT HERE:
	int c;
    while ((c = getchar()) != '\n' && c != EOF);
	inputStrings(n, strings);

	displayStrings(n, strings);
	
	printf("Enter a character to search for in the strings: ");
	scanf("%c", &ch);
	printf("Strings containing '%c' :\n", ch);
	searchCharacter(n, strings, ch);	
	} else {
    printf("Invalid input for the number of strings. Please enter a value between 1 and 20.\n");
}

//--FIXED PART - DO NOT EDIT ANY THINGS HERE
printf("\n");
system ("pause");
return(0);
}
