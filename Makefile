CC = x86_64-elf-gcc
LD = x86_64-elf-ld
CFLAGS = -Wall -Wextra -std=c11 -ffreestanding -fno-stack-protector -fno-stack-check -fno-lto -fno-PIE -m64 -march=x86-64 -mno-80387 -mno-mmx -mno-sse -mno-sse2 -mno-red-zone -Iinclude
LDFLAGS = -T linker.ld -static -nostdlib -no-pie -z max-page-size=0x1000

SRCS = $(shell find src -name '*.c')
OBJS = $(SRCS:.c=.o)
KERNEL = build/rune-kernel.bin

all: $(KERNEL)

$(KERNEL): $(OBJS)
	@mkdir -p build
	$(LD) $(LDFLAGS) $(OBJS) -o $(KERNEL)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJS) build/
