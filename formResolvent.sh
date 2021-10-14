nasm -f elf formulaResolvente.asm -o formulaResolvente.o
gcc -m32 -o formulaResolvente formulaResolvente.o formulaResolvente.c
./formulaResolvente