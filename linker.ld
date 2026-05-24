ENTRY(_start)

PHDRS
{
    text    PT_LOAD FLAGS(5); /* R-X */
    rodata  PT_LOAD FLAGS(4); /* R-- */
    data    PT_LOAD FLAGS(6); /* RW- */
}

SECTIONS
{
    /* Start im Higher Half */
    . = 0xffffffff80000000;

    .text : {
        *(.text*)
    } :text

    .rodata : {
        *(.limine_requests)
        *(.rodata*)
    } :rodata

    .data : {
        *(.data*)
    } :data

    .bss : {
        *(.bss*)
        *(COMMON)
    } :data

    /DISCARD/ : {
        *(.note*)
        *(.interp)
    }
}
