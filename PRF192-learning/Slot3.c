#include<stdio.h>
#include<math.h>
int main(){
// So Sanh a b
//	int a, b;
//	scanf("%d %d", &a, &b);
//	if (a <b)
//		printf("a < b");
//	else
//		printf("a >= b");

//Giai Phuong Trinh Bac 2
//int a, b, c; 
//float delta , x1, x2;
//
//scanf("%d %d %d", &a, &b, &c);
//
//delta = pow(b, 2) - 4*a*c;
//if (delta < 0){
//	printf("vo nghiem cu r :)))");
//}
//else {
//	x1=(-b-sqrt(delta)) / (2*a);
//	x2=(-b+sqrt(delta)) / (2*a);
//	if (x1 == x2){
//		printf("phuong trinh co nghiem kep la: %f",x1 );
//	}
//	else
//		printf("phuong trinh co 2 nghiem x1= %f va x2=%f", x1 , x2);
//}

// Nhap lua chon
	int a , b ,c;
	scanf("%d %d %d", &a, &b, &c);
	switch(c){
		case 1: printf(" chi vi : %d", 2*(a+b));
				break;
		case 2: printf(" dien tich : %d", a*b );
				break;
		case 3:
				break;
		default :
			printf("f*ck co 3 lua chon th");
			break;
	}
	
}
