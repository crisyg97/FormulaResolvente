#include <stdio.h>
#include <stdlib.h>

extern void formulaResolvente(float a,float b,float c);

int main(){
	float a;//2
	float b;//5	
	float c;//1
	printf("formula resolvente \n");
	printf("ingrese el valor de a = ");
	scanf("%f", &a);
	printf("ingrese el valor de b = ");
	scanf("%f", &b);
	printf("ingrese el valor de c = ");
	scanf("%f", &c);

	//llamado a la funcion externa de asm
	formulaResolvente(a,b,c);

	return 0;
}
