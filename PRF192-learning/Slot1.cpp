#include<stdio.h>

int main(){
	
// ex1: print HelloWorld to screen
	printf("HelloWorld\n"); 

// ex2: 
//	int a = 11;
//	char c = 'C' ;
//	long l = 10.90;
//	float f = 3.2f;
//	
//	printf("a : dia chi :%u gia tri :%d kich thuoc :%d\n", &a, a, sizeof(a));
//	printf("c : dia chi :%u gia tri :%c kich thuoc :%d\n", &c, c, sizeof(c));
//	printf("l : dia chi :%u gia tri :%d kich thuoc :%d\n", &l, l, sizeof(l));
//	printf("f : dia chi :%u gia tri :%.1f kich thuoc :%d", &f, f, sizeof(f));
	
// B1: Tinh gia tri bieu thuc va in ra ket qua 
//	int a = 2, b =10, c=5 ;
//	float x= 3.1 , y= (a*x*x) + (b*x) + c;
//	
//	printf("gia tri bieu thuc 1 la : %f\n",(a*x*x) + (b*x) + c) ;
//	printf("gia tri bieu thuc 2 la : %f", (x*x + y*y) / (a+b) ) ;

//ex3: Nhap Xuat
//	int x;
//	printf("Input x plz\n");
//	scanf("%d", &x);
//	printf("x location:%u value:%d size:%d", &x, x ,sizeof(x));

//B2: Nhap gia tri bien in ra kq
	int a , b , c ;
	float x, y= (a*x*x) + (b*x) + c;

	printf("nhap a b c x\n");	
	scanf("%d %d %d %f", &a, &b, &c, &x);
	
	printf("gia tri bieu thuc 1 la : %f\n",(a*x*x) + (b*x) + c) ;
	printf("gia tri bieu thuc 2 la : %f", (x*x + y*y) / (a+b) ) ;
	
	return 0;
}
