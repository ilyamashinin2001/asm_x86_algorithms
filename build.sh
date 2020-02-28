yasm -g dwarf2 -f elf64 src/main.asm -l build/main.lst -o build/main.o
yasm -g dwarf2 -f elf64 src/insertion_sort.asm -l build/insertion_sort.lst -o build/insertion_sort.o
yasm -g dwarf2 -f elf64 src/selection_sort.asm -l build/selection_sort.lst -o build/selection_sort.o
yasm -g dwarf2 -f elf64 src/quick_sort.asm -l build/quick_sort.lst -o build/quick_sort.o
yasm -g dwarf2 -f elf64 src/bubble_sort.asm -l build/bubble_sort.lst -o build/bubble_sort.o

gcc -g -no-pie -o build/main build/main.o build/insertion_sort.o build/selection_sort.o build/quick_sort.o build/bubble_sort.o