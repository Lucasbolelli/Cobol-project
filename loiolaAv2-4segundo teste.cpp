#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    int num = 5;
    int l, c, mat[num][num];

    srand(time(NULL));

    for(l = 0; l < num; l++){
        for(c = 0;  c < num; c++){      	
            mat[l][c] = rand()%1+25;
            	
			}
        }
    
    
    
    printf("\n---------------------------MATRIZ COMPLETA---------------------------------\n");
    for(l = 0; l < num; l++){
        for(c = 0;  c < num; c++){
				
			printf("%d|", mat[l][c]);
        
        }
        printf("\n");
    }
	printf("\n------------------------DIAGONAL A DIREITA----------------------------------\n");
    for(l = 0; l < num; l++){
        for(c = 0;  c < num; c++){
        	
        if (l==c)
            printf("%d|", mat[l][c]);
        else
            printf(" |");
        }
        printf("\n");
    }
    printf("\n------------------------DIAGONAL A ESQUERDA---------------------------------\n");
	for(l = 0; l < num; l++){
        for(c = 0;  c < num; c++){
        	
        if (l+c+1== 5)
            printf("%d|", mat[l][c]);
        else
            printf(" |");
        }
        printf("\n");
    }
    printf("\n----------------------------MATRIZ EM X------------------------------------\n");
    for(l = 0; l < num; l++){
        for(c = 0;  c < num; c++){
        	
        if (l+c+1==5 || l==c)
        
           printf("%d|", mat[l][c]);
        else
          printf(" |");
        }
        printf("\n");
    }

   
    

    return 0;
}
