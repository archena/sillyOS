ASSEMBLER = nasm
FLAGS = -f bin
SRC = bootloader.s
OUTPUT = bootloader.bin

all: $(SRC)
	$(ASSEMBLER) $(FLAGS) -o $(OUTPUT) $(SRC)

clean:
	rm -f $(OUTPUT)
