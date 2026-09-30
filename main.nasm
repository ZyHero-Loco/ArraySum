section .data
	%define TYPE_array 2
	array dw 12,4,26,27,84,41,7,31
	LENGTHOF_array equ ($ - array)/TYPE_array

section .bss
	sum resw 1				; summation value

section .text
	global _start				; program entry point

; ArraySum Function
ArraySum:
	; This procedure sums an array in reverse.

	; arguments using eax, ecx
	xor eax, eax				; function argument return value
	xor ecx, ecx				; function argument index

	; Sum, Index
	mov word [sum], 0		; sum
	mov ecx, LENGTHOF_array - 1	; index

	; loop
	L1:
		; repeat
		movzx esi, word [array + TYPE_array * ecx]	; retrieve value
		add [sum], si		; add value to sum

		; condition
		dec ecx					; decrement
		cmp ecx, 0				; compare to zero
		jge L1					; jump

	; return sum
	movzx eax, word [sum]		; return the value in sum to eax
	ret

_start:
	call ArraySum				; uses esi ecx

    ; exit
	mov eax, 1					; system call number for sys_exit
    xor ebx, ebx				; exit code 0
    int 0x80					; call the kernel
