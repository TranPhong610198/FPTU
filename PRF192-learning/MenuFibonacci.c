#include<stdio.h>
#include<string.h>
#include<math.h>
#include<stdlib.h>
#include<stdbool.h>
int i, j;

void scanN(int *n){
    scanf("%d", n);
    while (*n<0 || *n>20)             
    {
        printf("Error value N!!! Input again :");
        scanf("%d", n);
    }
    
}

void printFibonacci(int arr[] ,int n){
    arr[0] = 1;
    arr[1] = 2;
    for (i=2; i<n; i++){
        arr[i] = arr[i-1] + arr[i-2];
    }
    for (i=0; i<n; i++){
        printf("%d, ", arr[i]);
    }
}

int caculFibo(int n){
    if(n==1)
        return 1;
    if(n==2)
        return 2;
    return caculFibo(n-1) + caculFibo(n-2) ;
}

bool checkSquareNUm(int n){
    if (sqrt(n)* sqrt(n) == n)
        return true;
    else
        return false;
}

int main(){
    int n, arr[25];
    while(1){
        printf("\n---------------Menu Program Fibonacci---------------\n");
        printf("1. Input N (0<N<20)\n");
        printf("2. Print array of N first Fibonacci number\n");
        printf("3. Caculate value of Fibonacci at [n+5]\n");
        printf("4. Display square numbers in array Fibonacci\n");
        printf("5. Exit\n");
        
        int choice;
        printf("Input your choice : ");
        scanf("%d", &choice);
        if(choice == 5)
            break;
        switch (choice)
        {
        case 1: scanN(&n);
                break;
        case 2: printFibonacci(arr, n);
                break;
        case 3: printf("The Fibonumber at %d is : %d", n+5, caculFibo(n+5));
                break;
        case 4: for(i=0; i<n; i++){
                    if(checkSquareNUm(arr[i]))
                        printf("%d, ", arr[i]);
                }
                break;
        default:printf("Error chosesen!!! Do it again\n");
                break;
        }
    }
}