#include<stdio.h>
#include<string.h>
#include<math.h>
#include<stdlib.h>
int i, j;

struct student{
	char ML[100],MSSV[50];
	int PRF, PRO, CSD;
};
typedef struct student HS;


int main(){
    //Ex1: 
    // // int arr[100][100];
    // int m=3 , n=4;
    // // a> khai báo
    // int **arr = (int **)malloc(m * sizeof(int*));
    // for (i=0; i<m; i++){
    //     arr[i] = (int *)malloc(n * sizeof(int));
    // }
    // // b> gán và nhập vào 
    // // int a[3][4]={
    // //     {1,2,3,4},
    // //     {5,6,7,8},
    // //     {9,10,11,12},
    // // };
    // for(i=0; i<m; i++){
    //     for(j=0; j<n; j++){
    //         scanf("%d", *(arr+i) + j); //Nhập từ bàn phím dùng con trỏ.
    //         // arr[i][j] = a[i][j];
    //     }
    // }
    // // c> in ra mảng 
    // for(i=0; i<m; i++){
    //     for(j=0; j<n; j++){
    //         printf("%3d ", *(*(arr+i)+j));// con trỏ bậc 2
    //     }
    //     printf("\n");
    // }
    // // d> in ra các giá trị nằm ở cột chẵn 
    // printf("Values in even collums is : ");
    // for(i=0; i<m; i++){
    //     for(j=0; j<n; j++){
    //         if (j%2 == 0)
    //             printf("%d ", arr[i][j]);
    //     }
    // }
    // // e> in ra các giá trị có số hàng và số cột bằng nhau
    // printf("\nValues in location have row = collum is : ");
    // for(i=0; i<m; i++){
    //     for(j=0; j<n; j++){
    //         if (i == j)
    //             printf("%d ", arr[i][j]);
    //     }
    // }
    // free(arr);

    //Ex2-Ex3:
    // int gra = {10, 11, 12, 13, 11, 10};
    // int studentid[] = {1, 2, 3, 4, 5, 6};
    // int math[] = {9, 8, 8, 9, 10, 10};
    // int physic[] = {8, 9, 7, 8, 9, 8};
    // int chemistry[] = {8, 9, 7, 8, 10, 9};

    // for (int i=0; i<sizeof(math)/sizeof(int); i++){
    //     if(math[i] == 10){
    //         printf("Student Id : %d, Class : %d, Physic: %d ,Chemistry : %d have first 10 point at Math\n", studentid[i], grade[i], physic[i], chemistry[i]);
    //         break;
    //     }
    // }
    char classID[6][6] = {"A101", "B202", "C303", "D404", "E505", "F606"};
    char studentID[6][7] = {"S001", "S002", "S003", "S004", "S005", "S006"};
    int PRF[] = {9, 8, 8, 9, 10, 10};
    int PRO[] = {8, 9, 7, 8, 9, 8};
    int CSD[] = {8, 9, 7, 8, 10, 9};

    for(i=0; i<5; i++){
        for (j=i+1; j<6; j++){
            if (strcmp(studentID[i], studentID[j]) > 0){
                printf("ID1 bigger than ID2\n");
            }
        }
    }
    printf("ID\tclassID\tstudentID\tPRF\tPRO\tCSD\n");
    for(i=1; i<=6; i++){
        printf("%d\t%s\t%s\t\t%d\t%d\t%d\n", i, classID[i-1], studentID[i-1], PRF[i-1], PRO[i-1], CSD[i-1]);
    }

}
