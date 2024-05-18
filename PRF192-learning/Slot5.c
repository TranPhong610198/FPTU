#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

// function to caculate factorial
long long FactorialByRecusion(int n){
    if (n==1){
        return 1;
    }
        return n * FactorialByRecusion(n-1);
}

int main(){
    int N;
    printf("Tnput a non-negative integer : ");
    scanf("%d",&N);
    while (N<0)
    {
        printf("Input a non-negative integer : ");
        scanf("%d",&N);
    }
    printf("The factorial of %d is : %lld", N, FactorialByRecusion(N));
}