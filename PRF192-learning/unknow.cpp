#include <iostream>
#include<string> 
using namespace std;

struct sanpham {
 int ma, gia;
 string ten;
};

int main() {
 int luachon;
 sanpham sp;
 sanpham *arr = NULL;
 int n = 0;
 int a = 0;

while(a==0) {
   
   cout << "Chon chuc nang: " << endl;
   cout << "1. Them san pham" << endl;
   cout << "2. Tim kiem thong tin san pham" << endl;
   cout << "3. Xoa san pham" << endl;
   cout << "4. Thoat" << endl;
   cin >> luachon;

   if(luachon == 1) {
       cout << "Nhap ma san pham: ";
       cin >> sp.ma;
       cout << "Nhap ten san pham: ";
       cin >> sp.ten;
       cout << "Nhap gia san pham: ";
       cin >> sp.gia;

       arr = (sanpham*)realloc(arr, sizeof(sanpham*)*(n + 1));
       arr[n] = sp;
       n++;
	}
	if(luachon == 2 ){
       cout << "Nhap ten san pham can tim: ";
       cin >> sp.ten;
       for (int i = 0; i <= n; i++) {
         if (arr[i].ten == sp.ten) {
           cout << "Thong tin san pham: " << endl;
           cout << "Ma:"<< arr[i].ten << endl;
           cout << "Gia" << arr[i].gia << endl;
         }
       }
	}
	if(luachon == 3){
		for (int i=0; i<=n; i++){
           cout<<"Ma:"<<arr[i].ma<<endl;
           cout<<"Ten:"<<arr[i].ten<<endl;
           cout<<"Gia:"<<arr[i].gia<<endl;
       }
	}
   else{
       a = 1;
       cout<<"Thoat"<< endl;
	}
   }
}




// #include<iostream>
// #include <stdio.h>
// #include <string.h>
// #include <math.h>
// #include <stdlib.h>
// #include<string>
// using namespace std;

// int main(){
//     string a = "Hello";
//     cout<< a;
// }
