#include<iostream>
#include<stdlib.h>
#include<time.h>
int main(){
	time_t agora;
	struct tm *tm_agora;
	char texto [100];
	
	
	agora = time(NULL);
	tm_agora=localtime(&agora);
	strftime(texto, sizeof(texto), "%d/%m/%y",tm_agora);
	printf("A data de hoje e: %s", texto);
}
