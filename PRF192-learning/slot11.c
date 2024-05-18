#include<stdio.h>
#include<string.h>
#include<math.h>
#include<stdlib.h>
// Pointer ex1-ex2 : wirte swap function use pointer
// void swap(int *a, int *b){
//     int temple = *a;
//     *a = *b ;
//     *b = temple;
// }
int i, j;
int main(){
//EX1: 
    // int number = 11; 
    // int *ptr;
    // ptr = &number;

    // printf("Value number : %d\n", number);
    // printf("Location of number : %d\n", &number);
    // printf("Value pointer : %p\n", ptr);
    // printf("Value stored at adress of pointer :%d\n", *ptr); 

//EX2: swap with pointer
    // int a, b;
    // printf ("Input a and b :");
    // scanf("%d %d", &a, &b);
    // printf("Before swap (a,b) = (%d, %d)\n", a , b);
    // swap(&a , &b);
    // printf("After swap (a,b) = (%d, %d)", a, b);

//EX3: aray with pointer
    // int n;
    // printf("Input size of array : "); scanf("%d", &n);
    // int *arr = (int*)malloc(n*sizeof(int));
    
    // for (i=0; i<n; i++){
    //     scanf("%d", arr+i);
    // }
    // for (i=0; i<n; i++){
    //     printf("%d ", *(arr+i));
    // }
    //free(arr);

//EX4: 
    // int row, collum, i;
    // printf("Input rows : "); scanf("%d", &row);
    // printf("Input collums : "); scanf("%d", &collum);

    // int **arr = (int **)malloc(row * sizeof(int *));
    // for (i=0; i<row; i++);
    //     arr[i] = (int *)malloc(collum * sizeof(int));
    
    // printf("\nINPUT\n");
    // for (i=0; i<row; i++){
    //     for (j=0; j<collum; j++){
    //         scanf("%d", &arr[i][j]);
    //     }
    // }
    // for (i=0; i<row; i++){
    //     for (j=0; j<collum; j++){
    //         printf("%d", arr[i][j]);
    //     }
    //         printf("\n");
    // }

// Quizz 1: Input Array and print even and odd number;
    // int n;
    // printf("Input size of array : "); scanf("%d", &n);
    // int *arr = (int*)malloc(n*sizeof(int));
    
    // for (i=0; i<n; i++){
    //     scanf("%d", arr+i);
    // }
    // printf("Even number in array : ");
    // for (i=0; i<n; i++){
    //     if (*(arr+i)%2 == 0)
    //         printf("%d ", *(arr+i));
    // }
    // printf("\nOdd number in array : ");
    // for (i=0; i<n; i++){
    //     if (*(arr+i)%2 != 0)
    //         printf("%d ", *(arr+i));
    // }
    // free(arr);

// Quiz 2: 
    int n;
    printf("Input size of arrays : "); scanf("%d", &n);
    int *arr1 = (int*)malloc(n*sizeof(int));
    int *arr2 = (int*)malloc(n*sizeof(int));
    int *arr3 = (int*)malloc(n*sizeof(int));
    printf("INPUT:\n");
    printf("Input array 1 : ");
    for (i=0; i<n; i++){
        scanf("%d", arr1+i);
    }
    printf("Input array 2 : ");
    for (i=0; i<n; i++){
        scanf("%d", arr2+i);
    }
    
    for (i=0; i<n; i++){
        *(arr3+i) = *(arr2+i) + *(arr1+i);
    }
    
    printf("\nOUTPUT:\n");
    printf("Array 1 : ");
    for (i=0; i<n; i++){
        printf("%d ", *(arr1+i));
    }
    printf("\nArray 2 : ");
    for (i=0; i<n; i++){
        printf("%d ", *(arr2+i));
    }
    printf("\nArray 3 : ");
    for (i=0; i<n; i++){
        printf("%d ", *(arr3+i));
    }
}