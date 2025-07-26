[BITS 16]
[ORG 0x7C00]

start:
    ; clear screen clrscr()
    mov ah, 0x00
    mov al, 0x03
    int 0x10

    ; center msg row 12, col 34
    mov ah, 0x02
    mov bh, 0
    mov dh, 12
    mov dl, 34
    int 0x10

    mov si, msg
    call print_string

    ; row 14, col 28 for sign
    mov ah, 0x02
    mov bh, 0
    mov dh, 14
    mov dl, 31
    int 0x10

    mov si, sign
    call print_string

; wait for key press
.wait_key:
    mov ah, 0x00
    int 0x16
    cmp al, 'q'     ; lowercase q
    je shutdown
    cmp al, 'Q'     ; uppercase Q
    je shutdown
    jmp .wait_key

shutdown:
    cli        ; clear interrupts
    hlt        ; halt
    jmp $


print_string:
    lodsb
    or al, al
    jz .done
    mov ah, 0x0E
    int 0x10
    jmp print_string
.done:
    ret

msg db "Hello, World!", 0
sign db "Booted with love ;)", 0

times 510 - ($ - $$) db 0
dw 0xAA55
