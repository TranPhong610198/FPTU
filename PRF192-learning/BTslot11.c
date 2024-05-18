#include<stdio.h>
#include<string.h>
#include<math.h>
#include<stdlib.h>
int i, j;
// input array and print elements that divisible for 2 và 3;
int main(){
    int n;
    printf("Input size of array : ");
    scanf("%d", &n);
    int *arr = (int *)malloc(n*sizeof(int));
    printf("Input array : ");
    for (i=0; i<n; i++){
        scanf("%d", arr+i);
    }

    printf("Numbers divisible 2 and 3 in array is : ");
    j=0;
    for (i=0; i<n; i++){
        if (*(arr+i) % 6 == 0){
            printf("%d ", *(arr+i));
            j=1;
        }
    }
    if (j==0)
            printf("Don't have any numbers");
}