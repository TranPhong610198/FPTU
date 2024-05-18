#include <stdio.h>
int main() {
  	system("cls");
  	//INPUT - @STUDENT:ADD YOUR CODE FOR INPUT HERE:
	int n, i, j;
	scanf("%d", &n);
	while(n<10 || n>20){
		printf("9<n<21 !!!\nInput n again : ");
		scanf("%d", &n);
	}

    // Fixed Do not edit anything here.
    printf("\nOUTPUT:\n");
    //@STUDENT: WRITE YOUR OUTPUT HERE:
    for(i=0; i<n; i++){
    	for (j=0; j<i+1; j++){
    		printf("* ");
		}
		printf("\n");
	}
    
    //--FIXED PART - DO NOT EDIT ANY THINGS HERE
    printf("\n");
    system ("pause");
    return(0);
}
