nasm -f elf64 comparar.asm -o comparar.o
gcc main.c comparar.o -o comparar_programa
./comparar_programa
