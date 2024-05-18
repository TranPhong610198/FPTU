#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>
int main(){
    char name[50], c, aname1[50], aname2[50], aname3[50];
    int i = 0, locate;
    printf("Input your name : ");
    // scanf("%s", &name);   // this way just take a first pass that before first space
    scanf("%[^\n]", &name);  // this also use scanf but have "dac ta" : %[^\n]. It will take util you press enter
    // fgets(name , sizeof(name), stdin); // this way is instead for gets, because gets is dangerous 
    // this is use while loop to input - it's litle bit long
    // while ((c=getchar())!= '\n'){
    //     if( i < 49){
    //         name[i] = c;
    //         i++;
    //     }
    // }
    // printf("Your name : %s \n", name);
    // input another name and compare
    printf("Input another name to compare : ");
    getchar();// I don't know why but if i do not use it, the program will eror
    scanf("%[^\n]", &aname1);

    int test = strcmp(name, aname1);
    if (test == 0)
        printf("They are the same\n");
    else if(test <0)
        printf("They are different and %s smaller than %s\n", name, aname1);
    else
        printf("They are different and %s greater than %s\n", name, aname1);

    // Input another name and combine it with your name;
    printf("Input another name to combine : ");
    getchar();// I don't know why but if i do not use it, the program will eror 
    scanf("%[^\n]", &aname2);
    strcat(name , aname2);
    printf("%s\n", name);
}