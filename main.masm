.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
array DWORD 12,4,26,27,84,41,7,31
theSum DWORD ?

.code
ArraySum PROC USES esi ecx ;ArraySum Function
	COMMENT !
		write a procedure named ArraySum that recieves two parameters from a 
		calling program: a pointer to an array of 32 bit integers, and a count 
		of the number of array elements. (Use registers ESI and ECX as global 
		variables), It should calculate and return the sum of the array in EAX.
		Test the ArraySum procedure by calling it in main and passing the offset 
		and length of an array of 32-bit integers (again by using a global 
		variable). After calling ArraySum, the program should save the procedure's 
		return value in a variable named theSum.
		This procedure sums an array in reverse.
	!
	mov eax,0
	mov ecx,LENGTHOF array
	L1:
		mov esi,[OFFSET array + TYPE array*ecx]
		add theSum,esi	;save value in theSum
		dec ecx
		cmp ecx,0
		jge L1
	ret
ArraySum ENDP

main PROC
	
	push theSum
	call ArraySum	; uses esi ecx
	mov eax,theSum	;return the value in eax
	pop theSum

	INVOKE ExitProcess, eax
main ENDP

END main        ;specify the program's entry point
