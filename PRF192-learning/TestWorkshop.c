#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

// Workshop 1 - FUCK 6diem do dcm code giay viet hoa chu cai dau + thieu dau "&" phan nhap age
//	int main(){
//	
//     int age;
//     printf("Please enter your age : ");
//     scanf("%d", &age);
//
//     if(age <0)
//         printf("Invalid age ! Age cannot be negative");
//     else if (age >= 0 && age <18)
//         printf("You are a minor.");
//     else if (age >= 18 && age <65)
//         printf("You are an adult.");
//     else
//         printf("You are senior citizen");
//     printf("\n");
//     return (0);
// }

// Workshop 2 chua biet diem
	int main(){
		int N,i ;
		long long factorial= 1;
		printf("Input non-negative integer : ");
		scanf ("%d", &N);
		while ( N < 0){
			printf("Input non-negative integer: ");
			scanf ("%d", &N);
		}
		for(i = 1; i<= N ; i++){
			factorial = factorial * i;
		}
		printf("the factorial of %d is %lld", N,factorial);
	}

