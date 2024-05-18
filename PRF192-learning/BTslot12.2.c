#include<stdio.h>
#include<string.h>
#include<math.h>
#include<stdlib.h>
int i, j;
typedef struct Student {
    char classID[10];
    char studentID[10];
    int PRF, PRO, CSD;
} sv;

void swapAll(sv *x, sv *y){
    char temple[10];
    int temp;
    strcpy(temple, x->classID);
    strcpy(x->classID, y->classID);
    strcpy(y->classID, temple);

    strcpy(temple, x->studentID);
    strcpy(x->studentID, y->studentID);
    strcpy(y->studentID, temple);

    temp = x->CSD;
    x->CSD = y->CSD;
    y->CSD = temp;

    temp = x->PRF;
    x->PRF = y->PRF;
    y->PRF = temp;

    temp = x->PRO;
    x->PRO = y->PRO;
    y->PRO = temp;
}


int main(){
}