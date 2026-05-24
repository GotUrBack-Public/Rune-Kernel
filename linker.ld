ENTRY(_start)

PHDRS
{
    text    PT_LOAD FLAGS(5); /* Read + Execute */
    rodata  PT_LOAD FLAGS(4); /* Read-only */
    data    PT_LOAD FLAGS(6); /* Read + Write */
}

SECTIONS
{
    . = 0xffffffff80000000;

    /* Code Sektion */
    .text : {
        *(.text*)
    } :text

    /* Auf die nächste 4KB Seite springen */
    . = ALIGN(0x1000);

    .rodata : {
        *(.limine_requests)
        *(.rodata*)
    } :rodata

    /* Auf die nächste 4KB Seite springen */
    . = ALIGN(0x1000);

    .data : {
        *(.data*)
    } :data

    .bss : {
        *(.bss*)
        *(COMMON)
    } :data
}
