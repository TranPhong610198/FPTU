// Function and Libraries.
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>
#include "D:\CODING\DATA of Dev C-C++\PRF192-learning\TestLibrariesSlot6\mathlibraries.c"

// test libraries 
// int main(){
    // int a , b;
    // printf("Input two integer :");
    // scanf("%d %d", &a,&b);
    // sum(a,b);
    // diference(a,b);
    // product(a,b);
    // trade(a,b);

    
// }

// swap two number:
void swap(int &a, int &b){
     a = a + b ;
     b = a - b ;
     a = a - b ;

 }
// Pointer :
//void swap (int *a, int *b);
//void swap (int *a, int *b){
//    int c= *a;
//    *a = *b;
//    *b = c;
//
//}
int main(){
//    int arr[100];
//    printf("Input two number what you want to swap : ");
//    for (int i=0; i<2 ;i++){
//    	scanf("%d", &arr[i]);
//	}
//	swap(arr[0],arr[1]);
//    printf("a = %d \nb = %d",arr[0],arr[1]);
    int a,b ;
    printf("Input two number a and b what you want to swap  : ");
    scanf("%d %d", &a, &b);
    swap(a,b);
    printf("a = %d and b = %d", a ,b);
}

// Pointer :
// void swap (int *a, int *b);
// int main(){
//     swap(4,5);
// }
