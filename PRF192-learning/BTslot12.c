#include<stdio.h>
#include<string.h>
#include<math.h>
#include<stdlib.h>
int i, j;

// void swapString(char *arr1[], char *arr2[]){
//     char temple[50];
//     strcpy(temple, *arr1);
//     strcpy(*arr1, *arr2);
//     strcpy(*arr2, temple);
// }
void swapInterger(int *a, int *b){
    int temp = *a;
        *a   = *b;
        *b   = temp;
}

int main(){
    //BT1 : 
    int grade[] = {10, 11, 12, 13, 11, 10};
    int studentid[] = {1, 2, 3, 4, 5, 6};
    int math[] = {9, 8, 8, 9, 10, 10};
    int physic[] = {8, 9, 7, 8, 9, 8};
    int chemistry[] = {8, 9, 7, 8, 10, 9};

    for (int i=0; i<sizeof(math)/sizeof(int); i++){
        if(math[i] == 10){
            printf("Student Id : %d, Class : %d has first 10 point at Math and  Physic: %d ,Chemistry : %d \n", studentid[i], grade[i], physic[i], chemistry[i]);
            break;
        }
    }

    //BT2 :
    char classID[6][6] = {"D404", "A101", "C303", "B202", "E505", "F606"};
    char studentID[6][7] = {"S004", "S001", "S003", "S002", "S005", "S006"};
    int PRF[] = {9, 8, 8, 9, 10, 10};
    int PRO[] = {8, 9, 7, 8, 9, 8};
    int CSD[] = {8, 9, 7, 8, 10, 9};
    char temple[50];
    for(i=0; i<5; i++){
        for (j=i+1; j<6; j++){
            if (strcmp(studentID[i], studentID[j]) > 0){
                // swapString(&studentID[i], &studentID[j]);
                // swapString(&classID[i], &classID[j]);
                strcpy(temple, studentID[i]);
                strcpy(studentID[i], studentID[j]);
                strcpy(studentID[j], temple);

                strcpy(temple, classID[i]);
                strcpy(classID[i], classID[j]);
                strcpy(classID[j], temple);

                swapInterger(&PRF[i], &PRF[j]);
                swapInterger(&PRO[i], &PRO[j]);
                swapInterger(&CSD[i], &CSD[j]);
            }
        }
    }

    printf("ID\tclassID\tstudentID\tPRF\tPRO\tCSD\n");
    for(i=1; i<=6; i++){
        printf("%d\t%s\t%s\t\t%d\t%d\t%d\n", i, classID[i-1], studentID[i-1], PRF[i-1], PRO[i-1], CSD[i-1]);
    }
}