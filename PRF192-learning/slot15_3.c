#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int main() {
  system("cls");
  //INPUT - @STUDENT:ADD YOUR CODE FOR INPUT HERE:
	char str1[100], str2[100];
	scanf("%s %s", &str1, &str2);
	int test = strcmp(str1,str2);

   // Fixed Do not edit anything here.
  printf("\nOUTPUT:\n");
  //@STUDENT: WRITE YOUR OUTPUT HERE:
	if (test == 0)
		printf("Strings are equal");
	else
		printf("Strings are not equal");	
		
  //--FIXED PART - DO NOT EDIT ANY THINGS HERE
  printf("\n");
  system ("pause");
  return(0);
}
