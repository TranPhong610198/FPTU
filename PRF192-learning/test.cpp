#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

// This Function To Count Digits of Number
//int CountByRecursion(int n){
//    if (n<10)
//        return 1;
//    return 1 + CountByRecursion(n/10);
//}
//
//// This function to check Narcisstic Number  ex: Narcisstic Number has 3 digits: 153 = (1 * 1 * 1) + (5 * 5 * 5) + (3 * 3 * 3).
//int NarcissticNum(int n){
//    int test = n; 
//	int temp = 0;
//    int j = CountByRecursion(n);
//    while(n!=0){
//        temp = temp + (pow((n%10) , j));
//        n=n/10;
//    }
////    return temp;
//	if (temp == test)
//		return 1;
//	else 
//		return 0;
//}
//int main(){
//    int n;
//    printf("Input Interger Number : ");
//    scanf("%d", &n);
//	if(NarcissticNum(n) == 1)
//		printf("%d is a Narcisstic Number\n", n);
//	else
//		printf("%d isn't a Narcisstic Number\n", n); 
////    printf("%d",NarcissticNum(n));
//    system("pause");
//}




// A function to print array to screen 
//void printArray(int arr[], int n){
//    for(int i=0 ; i<n ; i++){
//        printf("%d ", arr[i]);
//    }
//    printf("\n");
//}
//
//
//// A function to do Insertion Sort
//void InsertionSort(int arr[], int n){
//    int j, key;
//    for(int i=1; i<n; i++){
//        key = arr[i];
//        j = i-1;
//        while (arr[j]>key && j>= 0)
//        {
//            arr[j+1] = arr[j];
//            j--;
//        }
//        arr[j+1] = key;    
//    }
//}
// 
//int main(){
//    int A[]= {5,9,1,4,3};
//    int n = 5;
//    InsertionSort(A, n);
//    printArray(A, n);
//}
//
//int main(){
//    int n ;
//    scanf("%d",&n);
//    for (int i = 1; i<n ; i++){
//        for (int j= 0; j<(n-i);j++){
//            printf(" ");
//        }
//        for (int j=0; j<i; j++){
//            printf(" *");
//        }
//        printf("\n");
//    }
//}

//int UCLN(int a, int b){
//    while (a!=b){
//        if (a>b)
//            a-=b;
//        else (a<b)
//            b-=a;
//    }
//    return a;
//}
//
//int main(){
//    int a, b;
//    printf("Input two numbers a and b: ");
//    scanf("%d %d", a, b);
//    printf(" UCLN BCNN of a b is : %d and %d", UCLN(a,b) , (a*b)/UCLN(a,b));
//}

//Function to check n is prime number or not.
//bool CheckPrimeNum(int n){
//    int check =1;
//    if (n<2)
//        return false;
//    else{
//        for (int i=2; i<=n/2 ; i++){
//            if (n%i == 0){
//                check = 0;
//                break;
//           }
//        }
//        if (check==1)  
//            return true;
//        else 
//            return false;
//    }   
//}
//// Function to count divior of n.
//int CountDivisor(int n){
//    int count = 0;
//    if(CheckPrimeNum(n))
//        return 2;
//    else{
//        for(int i=1; i<=n; i++){
//            if(n%i == 0)
//                count++;
//        }
//        return count;
//    }
//}
//
//int main(){
//    int n;
//    printf("Input integer that you want to count it's devisor : ");
//    scanf("%d", &n);
//    printf("The number of %d's devisor is : %d",n , CountDivisor(n));
//}


//bool checkIndecreaseNUm(long long n){
//    while(n>10){
//        long long tempt=n%10;
//        if (tempt < (n/10)%10)
//            return false;
//        else{
//            n= n/10;
//            return true;       
//        }
//    }
//}
//
//void frequence(int arr[],int n){
//   
//    for(int i=0; i<n; i++){
//        int count = 0 ;
//        for (int j=0; j<n; j++){
//            if (arr[i] == arr[j])
//                count++;
//        }
//        printf("%d %d ; ", arr[i], count);
//    }
//}
//
//int main(){
//    int arr[] = {1,2,3,4,1,3,2,1,2,2,3,4,1,2,2,3} ;
//    int n = sizeof(arr)/sizeof(arr[0]);
//    frequence(arr,n);
//}



//void swap(int &a, int &b){
//    a = a + b ;   // |	If use this algortithm to swap, in some case it will be false
//    b = a - b ;	// |
//    a = a - b ;	// |

//	  int temp = a;
//	  a = b ;
//	  b = temp;
//}
//
//void SelectionSort(int arr[], int n){
//	for (int step=0; step<n-1; step++){
//		int i_min = step;
//		for (int i= step +1 ; i<n ; i++){
//			if (arr[i] < arr[i_min])
//				i_min= i;
//		}
//		swap(arr[i_min], arr[step]);
//	}
//}
//
//void printArray(int arr[], int n){
//	for (int i=0; i<n; i++)
//		printf("%d ",arr[i] );
//}
//
//
//int main (){
//	int arr[]= {5,8,4,2,3};
//	SelectionSort(arr, 5);
//	printArray(arr, 5);
//}

//bool LinearSearch(int arr[], int n, int key){
//    for(int i=0; i<n; i++){
//        if(key==arr[i])
//            return true;
//    }
//    return false;
//}
//
//void inputArray(int arr[], int n){
//    for(int i=0; i<n ; i++){
//        scanf("%d", &arr[i]);
//    }
//}
//
//int main(){
//
//    int arr[100], k, n;
//    printf("Input size of array : ");
//    scanf("%d", &n);
//    inputArray(arr, n);
//    printf("Input key value : ");
//    scanf("%d", &k);
//    if(LinearSearch(arr,n,k))
//        printf("%d is an element of array.", k);
//    else
//        printf("%d is not an element of array.");
//}