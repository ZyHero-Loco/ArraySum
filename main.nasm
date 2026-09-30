section .data
	%define TYPE_array 2
	array dw 12,4,26,27,84,41,7,31
	LENGTHOF_array equ ($ - array)/TYPE_array

section .bss
	theSum resw 1

section .text
	global _main				;specify the program's entry point

; ArraySum Function
ArraySum:
	; This procedure sums an array in reverse.

	; arguments using eax, ecx
	xor eax, eax			; function argument sum
	xor ecx, ecx			; function argument index

	; Sum, Index
	mov eax, 0				; sum
	mov ecx, LENGTHOF_array	; index

	; loop
	L1:
		; repeating
		mov esi, [array + TYPE_array * ecx]	;
		add [theSum], esi		; save value in theSum

		; conditional
		dec ecx				; decrement
		cmp ecx, 0			; compare to zero
		jge L1				; jump
	ret

_main:
	push [theSum]
	call ArraySum			; uses esi ecx
	mov eax, theSum			; return the value in eax
	pop [theSum]

    ; exit
	mov eax, 1				; system call number for sys_exit
    xor ebx, ebx			; exit code 0
    int 0x80				; call the kernel to exit
