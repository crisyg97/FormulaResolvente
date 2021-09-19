#include <stdio.h>

extern void formulaResolvente(a float, b float, c float );

int main(){
	float a;
	float b;
	float c;
	printf("formula resolvente \n");
	printf("ingrese el valor de a");
	scanf("%f", &a);
	printf("ingrese el valor de b");
	scanf("%f", &b);
	printf("ingrese el valor de c");
	scanf("%f", &c);

	//llamado a la funcion externa de asm
	formulaResolvente(a,b,c);

	return 0;
}
