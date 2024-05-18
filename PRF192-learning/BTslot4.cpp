/*# Exercise 2.1: Factorial Calculation
Write a C program that calculates the factorial of a user-defined positive integer n using a while loop.

# Exercise 2.2: Sum of Even Numbers (for loop)
Write a C program that calculates the sum of all even numbers from 2 to a user-defined positive integer n using a for loop.*/

#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>
int main(){
	//ex2.1: Factorial
	int i = 1 , n , Factorial;
	printf("Input n : ");
	scanf("%d", &n);
	while (i <= n){
		Factorial *= i;
		i++;
	}
	printf("The anwser : %d\n", Factorial);
	
	//ex2.2: Sum of even numbers
	int k , sum;
	printf ("Nhap so chan cuoi cung: \n");
	scanf("%d",&k);
	for (int i=2;i<=k;i+=2){
		sum += i;
	}
	printf("Sum of even = %d", sum);
}

