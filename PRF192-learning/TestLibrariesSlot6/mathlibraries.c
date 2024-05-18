#include"mathlibraries.h"
#include<stdio.h>

    void sum(int a, int b){
        printf("sum %d and %d equals : %d \n",a,b,a+b) ;
    }
    void diference(int a, int b){
        printf("difference %d and %d equals : %d \n",a,b,a-b) ;
    } 
    void product(int a, int b){
        printf("product %d and %d equals : %d \n",a,b,a*b) ;
    }
    void trade(int a, int b){
        if (a%b == 0)
            printf("%d divides %d equal : %d",a,b, a/b);
        else
            printf("%d divides %d equal : %d and remained %d",a,b, a/b , a%b);
    }