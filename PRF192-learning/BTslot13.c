#include<stdio.h>
#include<string.h>
#include<math.h>
#include<stdlib.h>
int i, j;

// Khai Bao Cau Truc DiemMonHoc Gom Hai Truong diem va  tenHS
typedef struct DiemMonHoc {
    char tenHS[100];
	float diem;
} BlaBla;

int main(){
    int n;
    printf("Input number of student : ");
    scanf("%d", &n);
    
    BlaBla *dsDiem = (BlaBla*)malloc(n*sizeof(BlaBla));
     	for (i=0; i<n; i++){
        	printf("Name of Student %d : ", i+1);
            getchar();
			scanf("%[^\n]", &dsDiem[i].tenHS);
			printf("Score of Student %d : ", i+1);
        	scanf("%f", &dsDiem[i].diem);
    	}
    
    for (i=0; i<n-1; i++){
        for (j=i+1; j<n; j++){
            if(dsDiem[i].diem > dsDiem[j].diem){
                BlaBla   temp = dsDiem[i];
                dsDiem[i]  = dsDiem[j];
                dsDiem[j]  = temp;
            }
        }
    }

    printf("\n-----Danh Sach Diem Theo Thu Tu-----\n");
    printf("STT\tTen Hoc Sinh\t\tDiem\n");
    for (i=0; i<n; i++){
        printf("%d\t%s\t\t%.2f\n", i+1, dsDiem[i].tenHS, dsDiem[i].diem);
    }
    free(dsDiem); 
}



