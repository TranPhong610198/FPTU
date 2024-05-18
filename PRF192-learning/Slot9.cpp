#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

void Strcombine(char a[], char b[]){
    strcat(a," ");
    strcat(a,b);
    printf("%s\n", a);
}

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
    printf("Your name : %s \n", name);


    // output length of your name
    printf("Length of your name %zu \n", strlen(name));

    // input another name and compare
    printf("Input another name to compare : ");
    getchar();
    scanf("%[^\n]", &aname1);

    int test = strcmp(name, aname1);
    if (test == 0)
        printf("They are the same\n");
    else
        printf("They are different\n");

    // Input another name and combine it with your name;
    printf("Input another name to combine : ");
    getchar();// 
    scanf("%[^\n]", &aname2);
    // strcat(name, aname2);
    Strcombine(name, aname2);
    // printf("%s \n", name);

    // Divide Firstname and Lastname and print to screen
    printf("Input another name to divide : ");
    getchar();
    scanf("%[^\n]", &aname3);
    for (int i=strlen(aname3); i>0; i--){
        if (aname3[i] == ' '){
            locate = i;
            break;
        }
    }
    printf("Your first name : ");
    for (int i=locate; i<strlen(aname3) ; i++){
        printf("%c", aname3[i]);
    }
    printf("\n");

    printf("Your last name : ");
    for (int i=0; i<locate; i++){
        printf("%c", aname3[i]);
    }
    printf("\n");
}
