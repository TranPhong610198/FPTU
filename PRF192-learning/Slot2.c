#include<stdio.h>

int main(){

// Bai 1: Tinh tong tien mua gao, don gia so luong nhap tu ban phim	
//	int kgte, kgnep,dgnep,dgte ;
//	
//	printf("Nhap don gia gao te :\n") ;
//	scanf("%d",&dgte);
//	
//	printf("Nhap don gia gao nep :\n") ;
//	scanf("%d",&dgnep);
//	
//	printf("Nhap so luong gao te :\n") ;
//	scanf("%d",&kgte);
//
//	printf("Nhap so luong gao nep :\n") ;
//	scanf("%d",&kgnep);
//	
//	printf("So tien phai tra la : %d", kgnep*dgnep + kgte*dgte );	


//Bai 2: Tinh gia tri va lam tron so - ep kieu
//	float value, remainder;
//	int truncated, rounded;
//	
//	printf("Input value :\n");
//	scanf("%f", &value);
//
//	truncated = value ;
//	remainder = value - truncated ;
//	rounded = value ;
//	if (remainder > 0,5 || remainder == 0,5){
//		rounded++;
//	} 
//	printf("value: %f\n", value);
//	printf("truncated: %d\n", truncated);
//	printf("remainder: %f\n", remainder);
//	printf("round: %d\n", rounded);

//Bai3: Nhap ki tu in ra Ascii
//	char ch;   
//    printf("Input character: \n");  
//    scanf("%c",&ch);
//	  
//    printf("The ascii value of the '%c' variable is : %d", ch , ch);

//Edunext : 1. Viet mot chuong tr�nh C don gian de hien thi k�ch thuoc cua c�c kieu du lieu co ban (int, float, double, char) bang c�ch s? d?ng to�n t? sizeof.
				
//	int a;
//	float b;
//	double c;
//	char d;
//	
//	printf("kich thuoc cua int la: %d \n", sizeof(a) );
//	printf("kich thuoc cua float la: %d \n", sizeof(b) );
//	printf("kich thuoc cua double la: %d \n", sizeof(c) );
//	printf("kich thuoc cua char la: %d \n", sizeof(d) );

//2. Vi?t chuong tr�nh C d? t�nh di?n t�ch v� chu vi c?a m?t h�nh ch? nh?t. S? d?ng c�c h?ng s? v� bi?n d? luu chi?u d�i v� chi?u r?ng c?a h�nh ch? nh?t.

//	int cd= 4 , cr= 3;
//	printf("chu vi HCN dai 4 rong 3 la : %d \n", cd + cd + cr +cr);
//	printf("dien tich HCN dai 4 rong 3 la : %d \n", cd*cr );

//3. Vi?t chuong tr�nh C d? nh?p hai s? nguy�n t? b�n ph�m v� sau d� th?c hi?n c�c ph�p t�nh co b?n nhu c?ng, tr?, nh�n v� chia.

//	int a, b;
//	scanf ("%d %d", &a, &b);
//	printf ("kq phep cong 2 so la : %d\n", a+b );
//	printf ("kq phep tru 2 so la : %d\n", a-b );
//	printf ("kq phep nhan 2 so la : %d\n", a*b );
//	printf ("kq phep chia lay nguyen 2 so la : %d\n", a/b );


// Bai4: Nhap so tuoi tinh ,trang hoc tap roi xep loai ve
	int hocthuc, tuoi;
	printf("Ban con di hoc khong 1:co , 0:khong \n");
	scanf("%d", &hocthuc);
	printf("Ban bao nhieu tuoi: \n");
	scanf("%d", &tuoi);
	if(tuoi<13){
		printf("so ve tre em : 1\n");
		printf("so ve hoc sinh : 0\n");
		printf("so ve sinh vien : 0\n");
		printf("so ve nguoi lon : 0");
	}
	if(tuoi>12 && tuoi<19){
		printf("so ve tre em : 0\n");
		printf("so ve hoc sinh : 1\n");
		printf("so ve sinh vien : 0\n");
		printf("so ve nguoi lon : 0");
	}
	if(tuoi>18 && hocthuc == 1){
		printf("so ve tre em : 0\n");
		printf("so ve hoc sinh : 0\n");
		printf("so ve sinh vien : 1\n");
		printf("so ve nguoi lon : 0");
	}
	if(tuoi>18 && hocthuc == 0){
		printf("so ve tre em : 0\n");
		printf("so ve hoc sinh : 0\n");
		printf("so ve sinh vien : 0\n");
		printf("so ve nguoi lon : 1");
	}
	

return 0;
}
 
