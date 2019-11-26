	.file	"semaforo.c"
	.text
	.globl	init_sem
	.type	init_sem, @function
init_sem:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$12, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
	movq	-8(%rbp), %rax
	movl	$0, 4(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 8(%rax)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	init_sem, .-init_sem
	.globl	setVerde
	.type	setVerde, @function
setVerde:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$1, (%rax)
	movq	-8(%rbp), %rax
	movl	$0, 4(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 8(%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	setVerde, .-setVerde
	.globl	setAmarillo
	.type	setAmarillo, @function
setAmarillo:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
	movq	-8(%rbp), %rax
	movl	$1, 4(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 8(%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	setAmarillo, .-setAmarillo
	.globl	setRojo
	.type	setRojo, @function
setRojo:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
	movq	-8(%rbp), %rax
	movl	$0, 4(%rax)
	movq	-8(%rbp), %rax
	movl	$1, 8(%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	setRojo, .-setRojo
	.globl	liberar_sem
	.type	liberar_sem, @function
liberar_sem:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	liberar_sem, .-liberar_sem
	.globl	tiempoAmarillo
	.type	tiempoAmarillo, @function
tiempoAmarillo:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$-1431655765, %edx
	mull	%edx
	movl	%edx, %eax
	shrl	$2, %eax
	addl	$1, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	tiempoAmarillo, .-tiempoAmarillo
	.globl	tiempoRojo
	.type	tiempoRojo, @function
tiempoRojo:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	$16, %eax
	movl	$0, %edx
	divl	-4(%rbp)
	addl	$19, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	tiempoRojo, .-tiempoRojo
	.globl	tiempoVerde
	.type	tiempoVerde, @function
tiempoVerde:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$8, %rsp
	.cfi_offset 3, -24
	movl	%edi, -12(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, %edi
	call	tiempoAmarillo
	movl	%eax, %ebx
	movl	-12(%rbp), %eax
	movl	%eax, %edi
	call	tiempoRojo
	addl	%ebx, %eax
	movl	$40, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	tiempoVerde, .-tiempoVerde
	.section	.rodata
	.align 8
.LC0:
	.string	"Tiempo Rojo: %d segundos\nTiempo Amarillo: %d segundos\nTiempo Verde: %d segundos\nEmpezamos el ciclo:\n"
	.text
	.globl	empezarCiclo
	.type	empezarCiclo, @function
empezarCiclo:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, %edi
	call	tiempoVerde
	movl	%eax, -8(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, %edi
	call	tiempoAmarillo
	movl	%eax, -4(%rbp)
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	leal	(%rdx,%rax), %esi
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%edx, %ecx
	movl	%eax, %edx
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L14:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	setRojo
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	setVerde
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	imprimirVia@PLT
	movl	-8(%rbp), %eax
	movl	%eax, %edi
	call	sleep@PLT
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	setAmarillo
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	imprimirVia@PLT
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	sleep@PLT
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	setRojo
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	setVerde
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	imprimirVia@PLT
	movl	-8(%rbp), %eax
	movl	%eax, %edi
	call	sleep@PLT
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	setAmarillo
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	imprimirVia@PLT
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	sleep@PLT
	jmp	.L14
	.cfi_endproc
.LFE14:
	.size	empezarCiclo, .-empezarCiclo
	.globl	tiempoEspera
	.type	tiempoEspera, @function
tiempoEspera:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	-20(%rbp), %eax
	imull	$1000000, %eax, %eax
	movl	%eax, -12(%rbp)
	call	clock@PLT
	movq	%rax, -8(%rbp)
	nop
.L16:
	call	clock@PLT
	movq	%rax, %rcx
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	cmpq	%rax, %rcx
	jl	.L16
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	tiempoEspera, .-tiempoEspera
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
