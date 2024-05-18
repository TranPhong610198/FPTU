
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>
int i,j;
void inputString(int n, char input[][100]) {
    for(i=0; i<n; i++){
        printf("Enter string %d: ",i+1);
        scanf("%[^\n]", &input[i]);
        getchar();
    }
}

void displayString(int n, char input[][100]) {
    printf("Entered strings: \n");
    for (i=0; i<n; i++){
        printf("%s\n", input[i]);
    }
}

int main() {
    system("cls");
  //INPUT - @STUDENT:ADD YOUR CODE FOR INPUT HERE:
  // Fixed Do not edit anything here.
    int n;
    char input[50][100]; 
	
	printf("Enter the number of strings (0 < n <= 50): ");
	scanf("%d", &n);
    	if ( n== 1 || n <= 0 || n > 50) {
        printf("Invalid input. n should be between 1 and 50.\n");
        return 1; 
   	}
    
	int c;
    while ((c = getchar()) != '\n' && c != EOF);
    
    // Fixed Do not edit anything here.
    printf("\nOUTPUT:\n");
    //@STUDENT: WRITE YOUR OUTPUT HERE:
    inputString(n, input);
    displayString(n, input);
    
    //--FIXED PART - DO NOT EDIT ANY THINGS HERE
    printf("\n");
    system ("pause");
    return(0);
}