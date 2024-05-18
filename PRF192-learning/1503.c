#include <stdio.h>
#include <ctype.h>

int main() {
	system("cls");
  	//INPUT - @STUDENT:ADD YOUR CODE FOR INPUT HERE:
  	
    char sentence[1000];
    int i ;
//    printf("Enter a sentence: ");
    fgets(sentence, sizeof(sentence), stdin);
    
    for (i= 0; sentence[i] != '\0'; i++) {
        if (i == 0 || sentence[i - 1] == ' ') {
            sentence[i] = toupper(sentence[i]);
        } else {
            sentence[i] = tolower(sentence[i]);
        }
    }
    
    // Fixed Do not edit anything here.
    printf("\nOUTPUT:\n");
    //@STUDENT: WRITE YOUR OUTPUT HERE:
    
    printf("%s\n", sentence);
    
    //--FIXED PART - DO NOT EDIT ANY THINGS HERE
    printf("\n");
    system ("pause");
    return(0);
}
