#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>
#include <ctype.h>

// Input an array from keyboard , sort it and find k in this array with linear search and k from keyboard
//swap function used in bubble sort
void swap(int &a, int &b){
    // a = a + b ;
    // b = a - b ;
    // a = a - b ;
	int temp = a;
	a= b;
	b=temp;
}
// Now, it's the bubble sort function 
void BubbleSort(int arr[], int n){
    for (int i=0; i<n-1; i++){
        bool act = false; 
        for (int j=0; j<n-i-1; j++){
            if (arr[j] > arr[j+1]){ 
                swap(arr[j] , arr[j+1]);
                act  = true;
            }
        }
        if (act == false)
            break;
    }
}

void SelectionSort(int arr[], int n){
	for (int step=0; step<n-1; step++){
		int i_min = step;
		for (int i= step +1 ; i<n ; i++){
			if (arr[i] < arr[i_min])
				i_min= i;
		}
		swap(arr[i_min], arr[step]);
		
	}
}


// Input array function
void inputArray(int arr[], int n){
	int i;
	for (i=0; i<n; i++){
		scanf("%d", &arr[i]); 
	}
} 
//Linear search function 
int linearSearch(int arr[], int k, int n){
	int i;
	for (i = 0; i<n ; i++ ){
		if (arr[i] == k)
			return i; 
	}
	return -1;
}

// main
int main(){
	int arr[100], n,k,i;
	printf("Input n ");
	scanf("%d", &n);
	inputArray(arr, n);
	// BubbleSort(arr, n);
	SelectionSort(arr, n);
	for (i=0; i<n;i++){
		printf ("%d ", arr[i]);
	}
	printf("Input k ");
	scanf("%d", &k);
	int temp = linearSearch(arr, k, n);
	
	if (temp == -1)
		printf("don't have %d in this array", k);
	else
		printf("have %d in this array at %d", k, temp);
	}





