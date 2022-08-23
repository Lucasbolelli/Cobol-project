#include <iostream>
#include <stdlib.h>
#include <time.h>
#include <locale>
/*
Matriz original 
[1 2 3]
[4 5 6]
[7 8 9]
Matriz
[0 2 3]
[4 0 6] 
[7 8 0]

[1 - -]
[- 5 -]
[- - 9]
Numeros pra achar
[1 1 9]


*/
int main() {
	setlocale(LC_ALL,"portuguese");
    int num = 3;
	int adivinha = 0;
	int matriz_sortida[num][num];
	int matriz_demonstracao[num][num];
	int numeros_pra_acertar[num];
	int tentativas = 0;
    bool jogando = true;
    srand(time(NULL));
  
	
    for(int l = 0; l < num; l++){
        for(int c = 0;  c < num; c++){
        	matriz_sortida[l][c] = rand()%20+1;
        	if(l==c){
        		matriz_demonstracao[l][c]=matriz_sortida[l][c]; 
        		numeros_pra_acertar[l]=matriz_demonstracao[l][c];
			}	  		
        }	
	} 
	//ESSA AQUI É UMA COLA-------------------------------------------------------------------------	
//	for(int l = 0; l < num; l++){
//        for(int c = 0;  c < num; c++){
//        	printf(" %.2d|",matriz_sortida[l][c]);
//		}
//		printf("\n");	
//	}

		printf("\nAdivinhe os Numeros que estão faltando\n");		
		for(int l = 0; l < num; l++){
			for(int c = 0;  c < num; c++){
				if(l==c)
					printf("   |");
				else
					printf(" %.2d|",matriz_sortida[l][c]);
			}
			printf("\n");	
		}
	do{
		
		for(int i = 0; i < num; i++){
			tentativas++;
			printf("\n Adivinhe o número (entre 1 e 20): ");
			scanf("%d",&adivinha);
			if(numeros_pra_acertar[i]==adivinha){				
				printf("\n Este é o número correto: %d\n",adivinha);				
				for(int l=0;l<num;l++){
					for(int c=0;c<num;c++){
						if(l==c){
							if (((matriz_demonstracao[l][c] == adivinha) && (i == l)) || (l < i))
								printf(" %.2d|",matriz_demonstracao[l][c]);
							else
								printf("   |");
						}
						else{
							printf(" %.2d|",matriz_sortida[l][c]);
						}
					}
					printf("\n");
				}
				if (i == num -1)
					jogando = false;
			}else if(adivinha>numeros_pra_acertar[i]){
				printf("\nO número é menor.\n");
				printf("\nReiniciou.\n");
				break;
			}else if(adivinha<numeros_pra_acertar[i]){
				printf("\nO número é maior.\n");
				printf("\nReiniciou.\n");
				break;
			}
			

		}
////	
	}while(jogando);

		printf("\n\n -->| PARABÉNS VOCÊ ACERTOU OS NUMEROS DEPOIS DE %d TENTATIVAS. SÃO ELES: %d,%d,%d\n\n",tentativas,matriz_demonstracao[0][0],matriz_demonstracao[1][1],matriz_demonstracao[2][2]/*,matriz_demonstracao[3][3],matriz_demonstracao[4][4]*/);
		
		printf("Veja seus números na matriz logo abaixo:\n\n");
		for(int l = 0; l < num; l++){
			for(int c = 0;  c < num; c++){
				
					printf("%.2d|",matriz_sortida[l][c]);
				
					
		}
		printf("\n");	
	}		
}


