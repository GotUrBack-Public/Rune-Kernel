#include <stdint.h>
#include <stddef.h>

static volatile uint64_t limine_requests[] = {
    0xc7b1dd30df4c8b88, 0x0a82e88345a78616,
    0x2c139c892b1574e0, 0x489868f0376e108d,
    0
};

void kmain(void) {
    
    volatile char *video_memory = (volatile char *)0xffffffff800b8000;
    
    video_memory[0] = 'R';
    video_memory[1] = 0x0F;
    video_memory[2] = 'U';
    video_memory[3] = 0x0F;
    video_memory[4] = 'N';
    video_memory[5] = 0x0F;

    for (;;) {
        __asm__("hlt");
    }
}
