nasm -f elf32 "$1.asm" -o "$1.o"
ld -m elf_i386 -s io.o "$1.o" -o $1
./$1
