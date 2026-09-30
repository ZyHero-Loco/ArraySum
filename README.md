# ArraySum
A procedjure named arraysum that recieves two parameters from a calling program a pointer to an array of 32 bit integers, and a count of the number of array elements. It calculates the sum of the array in reverse and and returns the value in register EAX.

### build nasm
nasm -f elf32 main.nasm -o main.obj

ld -m elf_i386 main.obj -o main

chmod +x main

./main
