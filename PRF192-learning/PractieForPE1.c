#include<stdio.h>
#include<string.h>
#include<math.h>
#include<stdlib.h>
#include<stdbool.h>
#include<ctype.h>
int i, j;
    //Q1 : Find max in three number entered from keyboard 
    // int main(){
    // int a , b ,c;
    // scanf("%d %d %d", &a, &b, &c);
    // int max = fmax(fmax(a,b),c);
    // printf("%d", max);
    // }

    //Q2 : entered n real number and caculate average of them
    // int main(){
    // int n;
    // scanf("%d", &n);
    // float sum=0, arr[100];
    // for (i=0; i<n; i++){
    //     scanf("%f", &arr[i]);
    // }

    // for (i=0; i<n; i++){
    //     sum += arr[i];
    // }
    // printf("%.3f", sum/n);
    // }

    //Q3: enterd a positive number n and print number of it's divisor
    // int main(){
    // int n, count=0;
    // scanf("%d", &n);
    // for (i=1; i<sqrt(n); i++){
    //     if (n%i ==0)
    //         count++;
    // }
    // printf("%d", count*2);
    // }

    //Q4:  print out a right triangle of prime numbers 
    // int isPrime(int n){
    //     int divisor=0;
    //     for(i=1; i<sqrt(n); i++){
    //         if(n%i==0)
    //             divisor ++;
    //     }
    //     if (divisor>1) return 0;
    //     return 1;
    // }
    
    // int main(){
    //     int indx=0, n, count = 0; 
    //     scanf("%d", &n);
    //     int size = (n+1)*n/2;
    //     j=2;
    //     int primeArr[size];
    //     while (count<size){
    //         if(isPrime(j)){
    //             primeArr[indx] = j;
    //             count ++;
    //             indx++;
    //         }
    //         j++;
    //     }
    //     int t=0;

    //     for (i=0; i<n; i++){
    //         for(j=0; j<=i; j++){
    //             printf("%d ", primeArr[t]);
    //             t++;
    //         }
    //         printf("\n");
    //     }
    //     system("pause");
    // }

    //Q5: enter n int and print decring
    // void InsertionSort(int arr[], int n){
    // int key;
    // for(int step=1; step<n; step++){
    //     key = arr[step];
    //     j = step-1;
    //     while (arr[j]>key && j>= 0)
    //     {
    //         arr[j+1] = arr[j];
    //         j--;
    //     }
    //     arr[j+1] = key;    
    // }
    // }
    // void printArr(int arr[], int n){
    //     for (i=n-1; i>=0; i--){
    //         printf("%d\n", arr[i]);
    //     }
    // }

    // int main(){
    //     int n; 
    //     scanf("%d", &n);
    //     int arr[n], oddArr[n], evenArr[n];
    //     for(i=0; i<n; i++){
    //         scanf("%d", &arr[i]);
    //     }
    //     InsertionSort(arr, n);
    //     int i_odd=0, i_even=0;
        
    //     for(i=0; i<n; i++){
    //         if (arr[i]%2==0){
    //             evenArr[i_even] = arr[i];
    //             i_even++;
    //         }
    //         else{
    //             oddArr[i_odd] = arr[i];
    //             i_odd++;
    //         }
            
    //     }
    //     printArr(evenArr, i_even);
    //     printArr(oddArr, i_odd);
    //     system("pause");
    // }

    //Q6: input string and caculate sum of digit in this string
    // Làm rồi dùng bảng Asscii để đổi char về int 

    //Q7: find maximum value of main digonal 
    // Làm rồi , dùng mảng hai chiều để lưu ma trận r tìm max trong đoạn A[1][1], A[2][2], ... , A[n][n]

    //Q8: Delete elements that "xuất hiện" more than 1 time
    //Làm rồi, dùng 2 mảng 1 mảng để lưu đầu vào, một hàm để check xem số trong mảng 1 đã xuất hiện trong mảng hai hay chưa
    // int searchArr(int arr[], int n, int x){
    //     int t;
    //     for (t=0; t<n; t++){
    //         if(arr[t] == x) return 1;
    //     }
    //     return 0;
    // }
    // void InsertionSort(int arr[], int n){
    // int key;
    // for(int step=1; step<n; step++){
    //     key = arr[step];
    //     j = step-1;
    //     while (arr[j]>key && j>= 0)
    //     {
    //         arr[j+1] = arr[j];
    //         j--;
    //     }
    //     arr[j+1] = key;    
    // }
    // }
    // int main(){
    //     int n;
    //     scanf("%d", &n);
    //     int arr1[n], arr2[n];

    //     for(i=0; i<n; i++){
    //         scanf("%d", &arr1[i]);
    //     }  
    //     j=0;
    //     for(i=0; i<n; i++){
    //         if(!searchArr(arr2, n, arr1[i])){
    //             arr2[j] = arr1[i];
    //             j++;
    //         }
    //     }
    //     int size =j;
    //     InsertionSort(arr2, size);
    //     for (i=size-1; i>=0; i--){
    //         printf("%d ", arr2[i]);
    //     }
    // }

    //Q9: Enter n and n name and one character print names have this character
    // int main(){
    //     int n; 
    //     scanf("%d", &n);
    //     char str[n][100], check;
    //     for(i=0; i<n; i++){
    //         scanf("%s", &str[i]);
    //     }
    //     getchar();
    //     scanf("%c", &check);
    //     char check2 = toupper(check);
    //     for (i=0; i<n; i++){
    //         if (strchr(str[i], check)!=NULL || strchr(str[i], check2)!=NULL) 
    //             printf("%s\n", str[i]);
    //     }
    //     getchar();

    //     system("pause");
    // }

    //Q10 : enter a binary string with length = 1 byte and print two-complement of it 
    // int main(){
    //     char binary[8];
    //     scanf("%s", &binary);
    //     int n = strlen(binary);
    //     for (i=n-1; i>=0; i--){
    //         if(binary[i] == 49) break;
    //     }

    //     for(i= i-1; i>=0; i--){
    //         if (binary[i]== 49){
    //             binary[i] = 48;
    //         }
    //         else
    //             binary[i] = 49;
    //     } 

    //     printf("%s", binary);
    //     system("pause");
    // }