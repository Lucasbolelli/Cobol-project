#include <iostream>
#include <stdlib.h>
#include <locale.h>
#include <time.h>

int main() {
    setlocale(LC_ALL,"portuguese");
    int num=3, errado=0, certo=0, tentativas=0, l, c, resposta;
    int mat[num][num], v[num];

    srand(time(NULL));

    for(l=0; l<num; l++) {
        for(c=0;  c<num; c++) {
            mat[l][c] = rand()%20+1;

            if(l==c)
                v[l]=mat[l][c];
        }
    }
    
    //ISSO É COLA***

//    for(l=0; l<num; l++) {
//        for(c=0; c<num; c++) {
//            printf(" %.2d|", mat[l][c]);
//        }
//        printf("\n");
//    }

    for(l=0; l<num; l++){
        Repete:
        printf("\n Adivinhe o número (entre 1 e 20): ");
        scanf("%d", &resposta);

        if (resposta == v[l]) {
            printf(" Este é o número correto: %d\n", resposta);
            certo++;
        }
        else if (resposta < 0) {
            printf(" Tente um número positivo!\n");
            errado++;
            goto Repete;
        }
        else if (resposta > v[l]) {
            printf("Errado! Tente um número menor.\n");
            errado++;
            goto Repete;
        }
        else if (resposta < v[l]) {
            printf(" Errado! Tente um número maior.\n");
            errado++;
            goto Repete;
        }
        else {
            printf("Número incorreto. Tente outro número.\n");
            errado++;
            goto Repete;
        }
        tentativas = errado + certo;
    }
    printf("\n\n-->|Parabéns! Você acertou todos os números depois de um total de %d tentativas. (%d erros e %d acertos)", tentativas, errado, certo);
}
