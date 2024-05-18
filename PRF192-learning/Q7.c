#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>
int main() {
  system("cls");
  char str[25];
  int i, temp;
  
  //INPUT - @STUDENT:ADD YOUR CODE FOR INPUT HERE:
	scanf("%[^\n]", &str);
	while (strlen(str) % 2 == 0 || strlen(str) <6 || strlen(str) >19){
		printf("length of string must be odd number!!!\nInput string again:");
		getchar();
		scanf("%[^\n]", &str);
	}	 
	temp = (strlen(str) - 5)/2;
    // Fixed Do not edit anything here.
    printf("\nOUTPUT:\n");
    //@STUDENT: WRITE YOUR OUTPUT HERE:
    for(i=temp; i<temp+5; i++){
    	printf("%c",str[i]);
	}  
    
    //--FIXED PART - DO NOT EDIT ANY THINGS HERE
    printf("\n");
    system ("pause");
    return(0);
}
