#include<stdio.h>
int main(){
//	 Bai 1: Kiem tra chan le
	int n;
	scanf("%d", &n);
	if (n%2 == 0)
		printf("n la so chan\n");
	else 
		printf("n la so le\n");
		
	// Bai 2: Kiem tra so lon nhat trong hai so nguyen 
	int a , b;
	scanf("%d %d", &a, &b);
	if (a < b)
		printf("so lon nhat trong hai so la b : %d\n", b);
	else if (a > b)
		printf("so lon nhat trong hai so la a : %d\n", a);
	else 
		printf("hai so bang nhau va bang :%d\n", a);
	
	// Bai 3: Kiem tra tam giac 
	int x, y, z, t1, t2; 
	scanf("%d %d %d", &x, &y, &z);
	if (x*x == y*y + z*z || x*x + y*y == z*z || z*z == x*x + y*y){
//		printf("day la tam giac vuong");
		t1 = 1;
	}
	if (x==y || y==z || x==z){
		if (y!=z || y!=x || x!=z){
//			printf ("day la tam giac can");
			t2 = 0;
		}
		else {
//			printf ("day la tam giac deu");
			t2 = 1;
		}
	}
	if (t1 == 1){
		if (t2==0)
			printf ("day la tam giac vuong can");
		else 
			printf ("day la tam giac vuong");
	}
	else 
		if (t2==0)
			printf ("day la tam giac can");
		else if (t2 == 1)
			printf ("day la tam giac deu");
		else
			printf ("day la tam giac thuong");
	
}
