#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int i;
int main() {
	system("cls");
//INPUT - @STUDENT:ADD YOUR CODE FOR INPUT HERE:
	int n, sum =0, dem =0;
  	scanf("%d", &n);
  	while (n<0){
  		printf("n must be non-negative integer\nInput again: ");
  		scanf("%d", &n);
	}
  
// Fixed Do not edit anything here.
	printf("\nOUTPUT:\n");
//@STUDENT: WRITE YOUR OUTPUT HERE:
//	if(n>=4){
//		if(n%2==0)
//			printf("%d", n+(n-2)+(n-4));
//  		else
//  			printf("%d", (n-1) + (n-3) +(n-5));
//  	}
//  	
//  	else{
//  		for(i=n; i>=0; i--){
//  			if(i%2 == 0){
//  				sum += i;		
//			}
//		}
//		printf("%d", sum);
//	}
	for (i=n; i>0; i--){
		if (i%2 == 0){
			sum+= i;
			dem ++;
		}
		if(dem == 3)
			break;
	}
	printf ("%d", sum);
  //--FIXED PART - DO NOT EDIT ANY THINGS HERE
  printf("\n");
  system ("pause");
  return(0);
}
