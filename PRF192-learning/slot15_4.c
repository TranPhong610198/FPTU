#include <stdio.h>
#include <string.h>

int main() {
  system("cls");
  //INPUT - @STUDENT:ADD YOUR CODE FOR INPUT HERE:
	char str1[100], str2[100];
	printf("Enter a srting: ");
	gets(str1);
	printf("Enter the search string: ");
	scanf("%s",&str2);
	
	char *str3 = strstr(str1,str2);

   // Fixed Do not edit anything here.
  printf("\nOUTPUT:\n");
  //@STUDENT: WRITE YOUR OUTPUT HERE:
	if (str3 != 0)
		printf("Search string found %s", str3);
	else
		printf("Search string not found");

  //--FIXED PART - DO NOT EDIT ANY THINGS HERE
  printf("\n");
  system ("pause");
  return(0);
}
