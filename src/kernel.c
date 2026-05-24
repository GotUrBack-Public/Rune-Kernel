#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

__attribute__((used, section(".limine_requests")))
static volatile uint64_t limine_requests[] = {
    0xc7b1dd30df4c8b88, 0x0a82e88345a78616,
    0x2c139c892b1574e0, 0x489868f0376e108d,
    0, 0
};

__attribute__((used))
void _start(void) {
    
    volatile char *video_memory = (volatile char *)0xffffffff800b8000;
    
    for (int i = 0; i < 80 * 25 * 2; i += 2) {
        video_memory[i] = ' ';
        video_memory[i+1] = 0x07;
    }

    const char *msg = "RUNE KERNEL ONLINE";
    for (int i = 0; msg[i] != '\0'; i++) {
        video_memory[i * 2] = msg[i];
        video_memory[i * 2 + 1] = 0x0F;
    }


    for (;;) {
        __asm__("hlt");
    }
}
