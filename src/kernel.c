#include <stdint.h>
#include <stddef.h>

static volatile struct {
    uint64_t id[4];
    uint64_t revision;
} stack_request = {
    .id = {0, 0, 0, 0},
    .revision = 0
};

void kmain(void) {
    for (;;) {
        __asm__("hlt");
    }
}
