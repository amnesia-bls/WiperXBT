; 16-bit Real Mode Boot Sector Example (NASM Syntax)
; Loaded by x86 BIOS at physical memory address 0x7C00

[bits 16]
[org 0x7c00]

start:
    ; Disable interrupts and initialize segment registers
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00
    sti

    ; Set video mode 80x25 text mode (clears screen)
    mov ax, 0x0003
    int 0x10

    ; Print message using BIOS Teletype Output (INT 10h, AH=0Eh)
    mov si, msg

print_loop:
    lodsb               ; Load byte at DS:SI into AL, increment SI
    or al, al           ; Check for null terminator
    jz hang             ; Stop printing if null byte reached
    mov ah, 0x0e        ; BIOS teletype output function
    mov bh, 0x00        ; Display page 0
    mov bl, 0x07        ; Attribute: Light gray on black
    int 0x10            ; Call BIOS video service
    jmp print_loop

hang:
    cli
    hlt                 ; Halt CPU until next interrupt
    jmp hang            ; Infinite loop if woken up

msg: db 'Star my repo on Github! - amnesia', 0x0D, 0x0A, 0

; Pad sector with zeros up to 510 bytes, then append MBR boot signature (0xAA55)
times 510-($-$$) db 0
dw 0xaa55
