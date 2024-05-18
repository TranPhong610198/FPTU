// EX1:
//#include <stdio.h>
//#include <string.h>
//#include <math.h>
//#include <stdlib.h>
//int main(){
//    system("cls");
//    char a[] = "HOA";
//    char b[10];
//    char c[] = " LA";
//
//    // INPUT 
//    
//
//    printf("\nOUTPUT:\n");
//    // STUDENT : WRITE YOUR OUTPUT HERE
//    //a and b 
//    strcpy(b, a);
//    printf("b = %s\n", b);
//    strcat(a , c);
//    printf("a = %s\n",a);
//
//    //c
//    printf("strcmp(HOA,LA) = %d\n",strcmp(c,b));
//    printf("strcmp(LA,HOA) = %d\n",strcmp(b,c));
//    printf("strcmp(HOA,HOA) = %d\n",strcmp(b,b));
//
//    // FIXED PART : DO NOT EDIT ANY THING HERE
//    printf("\n");
//    system("pause");
//    return (0);
//}


//EX2:
//#include <stdio.h>
//#include <stdlib.h>
//#include <time.h>
//int i , j;
//// Create n numbers in the interval [10,100] randomly
//void createData(int a[], int n){
// 	srand(time(NULL));
//    for( i = 0; i<n; i++)
//        a[i] = 10 + rand()%91; 
//    }
// void swap(int *a, int *b){
// 	int temp = *a;
// 	*a = *b;
// 	*b = temp;
//} 
//void view(int a[], int n)
//  {
//  	for ( i=0 ; i<n ; i++)
//  		printf("%d ", a[i]);
//  }
//void sort_bubbleSort(int a[], int n)
//  { 
// cach 1:  
//    for ( i=0; i<n-1; i++){
//        int act = 0; 
//        for ( j=0; j<n-i-1; j++){
//            if (a[j] > a[j+1]){ 
//                swap(&a[j] , &a[j+1]);
//                act  = 1;
//            }
//        }
//        if (act == 0)
//            break;
//    }

// cach 2:
//	for (i =0; i<n-1; i++){
//		for (j=i+1; j<n; j++){
//			if (a[i]>a[j])
//				swap(&a[i], &a[j]);
//		}
//	}

//cach 3:
//	for (i=0; i<n-1; i++){
//		for (j=n-1; j>=i+1; j--){
//			if (a[i]>a[j])
//				swap(&a[i], &a[j]);
//		}
//	}
//}
//int main()
//  { system("cls");
//	
//    int a[100], n = 10;
//    createData(a,n);
//	
//	//INPUT - @STUDENT:ADD YOUR CODE FOR INPUT HERE:
//    printf("\nBefore sorting:\n");
//    view(a,n);
//    printf("\nAfter sorting:\n");
//    sort_bubbleSort(a,n);
//    view(a,n);
//    printf("\n");
//	
//    //--FIXED PART - DO NOT EDIT ANY THINGS HERE
//  printf("\n");
//  system ("pause");
//  return(0);
//  }


#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int i,j,sizeb; 

void input(double a[], int n) {
	for (i=0; i<n; i++){
		scanf("%lf", &a[i]);
	}
}

void display(double a[], int n) {
	for (i=0; i<n; i++){
		printf("%.2lf ", a[i]);
	}
}

void sort(double a[], int n) {
	// In this case i'll use Insertion Sort.
	int step, key;
	for (step=1; step<n;step++){
		key = a[step];
		j= step -1;
		while (a[j]>key && j>=0)
		{
			a[j+1] = a[j];
			j--;
		}
		a[j+1] = key;
	}
}

int search(double a[],int n, double x, int b[]) {
	// In this case i will use Binary Search
	// sort(a, n);
	// int mid, low = 0, high=n;
	// while(low <=high){
	// 	mid = low + (high - low)/2;
	// 	if (x == a[mid])
	// 		return mid;
	// 	else if (x > a[mid])
	// 		low = mid +1;
	// 	else
	// 		high = mid -1 ;
	// }
	// return -1;

	// BinarySearch is good but whatif have more than one x in the array - so i will us for loop
	int act = 0;;
	j=0;
	for (i=0; i<n; i++){
		if (a[i] == x){
			b[j] = i;
			j++;
			act = 1;
		}
	}
	sizeb = j;
	return act;
}

void delePos(double a[], int *n, int k) {
	if (k>*n)
		k = *n;
	if (k<0)
		k = 0;
	for (i=k; i<*n-1; i++){
		a[i]= a[i+1];
	}
	*n= *n -1;
}

void deleValue(double a[], int n, double x,int b[]) {
	int test = search(a, n, x, b);
	if (test == 0)
		printf("%lf is not belong to this array.\n", x);
	else{
		for (i=0; i<sizeb; i++)
			a[b[i]] = 0;
	}
}

int main() {
 system("cls");
 double a[100];  int b[100], n=0, k; double x;
 int choice;
 while(1) {
		printf("\n");
		printf("1. Input data\n");
		printf("2. Display\n");
		printf("3. Search\n");
		printf("4. Delete position\n");
		printf("5. Delete value\n");
		printf("6. Sort data\n");
		printf("0. Exit\n");
        printf("Enter your selection (0 -> 6): ");
		scanf("%d",&choice);
		if(choice==0) break;
		switch(choice) {
			case 1: printf("Input amount of elemment in array : ");
					scanf("%d", &n);
					input(a, n);
			        break;
			case 2: if(n == 0)
						printf("Don't have been data in array");
					else	
						display(a,n);
			        break;
			case 3: printf("Enter a value to be searched x = ");
			        scanf("%lf",&x);
			        k = search(a,n,x,b);
			        if(k==0)
			         	printf("Not found %lf\n",x);
			        else{			        
						printf("Found %lf at position : ",x);
						for(i=0; i<sizeb; i++)
							printf("%d ", b[i]);
						printf("\n");
					}
					break;
			case 4: printf("Enter a position to be deleted k = ");
			        scanf("%d",&k);
                    delePos(a,&n,k);
			        break;
			case 5: printf("Enter a value to be deleted x = ");
			        scanf("%lf",&x);
                	deleValue(a,n,x,b);
			        break;
			case 6: sort(a,n); break;
			default: printf("Your selection is incorrect\n"); 
				    break;
		}		
}
 printf("\n");
 system("pause");
 return(0);
}