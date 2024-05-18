#include<stdio.h>
#include<string.h>
#include<math.h>
#include<stdlib.h>
#include<stdbool.h>
int i, j;
int main(){
    int a, b, c, d;
    scanf("%d %d %d %d", &a, &b, &c, &d);

    float n= (float) a/b;
    float m = (float) c/d;

    if (m == n)
        printf("The same");
    else
        printf("The difference");

    printf("%f %f", m, n);
}