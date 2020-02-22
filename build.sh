yasm -g dwarf2 -f elf32 src/main.asm -l build/main.lst -o build/main.o
yasm -g dwarf2 -f elf32 src/insertion_sort.asm -l build/insertion_sort.lst -o build/insertion_sort.o

ld -g -m elf_i386 -o build/main build/main.o build/insertion_sort.o
