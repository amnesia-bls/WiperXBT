[bits 16]
[org 0x7c00]

start:
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00
    sti

    mov ax, 0x0003
    int 0x10

    mov si, msg

print_loop:
    lodsb
    or al, al
    jz hang
    mov ah, 0x0e
    mov bh, 0x00
    mov bl, 0x07
    int 0x10
    jmp print_loop

hang:
    cli
    hlt
    jmp hang

msg: db 'Star my repo on Github! - amnesia', 0x0D, 0x0A, 0

times 510-($-$$) db 0
dw 0xaa55
