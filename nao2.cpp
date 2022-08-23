#include<iostream>
#include <locale>
int main(){
	setlocale(LC_ALL,"portuguese");
	char caf[50];
	char n1[10];
	char n2[20];
		printf("Digite o primeiro nome: ");
			scanf("%s", &n1);
		printf("Digite o segundo nome: ");
			scanf("%s", &n2);	
		sprintf(caf, "Seu nome é %s %s.",n1,n2);
		printf("\n%s",caf);
	
}
