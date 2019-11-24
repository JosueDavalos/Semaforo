	.file	"main.c"
	.text
	.section	.rodata
.LC0:
	.string	"hv:"
	.align 8
.LC1:
	.string	"\nVelocidad l\303\255mite en km/h: %d\n"
	.align 8
.LC3:
	.string	"Velocidad l\303\255mite en m/s: %d (aproximadamente)\n"
	.align 8
.LC4:
	.string	"DUraci\303\263n total de ciclo en segundos: %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	movl	$20, -24(%rbp)
	jmp	.L2
.L6:
	movl	-20(%rbp), %eax
	cmpl	$104, %eax
	je	.L3
	cmpl	$118, %eax
	je	.L4
	jmp	.L2
.L3:
	movl	$0, %eax
	call	ayuda
	movl	$1, %eax
	jmp	.L5
.L4:
	movq	optarg(%rip), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -24(%rbp)
.L2:
	movq	-48(%rbp), %rcx
	movl	-36(%rbp), %eax
	leaq	.LC0(%rip), %rdx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	getopt@PLT
	movl	%eax, -20(%rbp)
	cmpl	$-1, -20(%rbp)
	jne	.L6
	movl	-24(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-24(%rbp), %eax
	testq	%rax, %rax
	js	.L7
	cvtsi2sdq	%rax, %xmm0
	jmp	.L8
.L7:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L8:
	movsd	.LC2(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	cvttsd2siq	%xmm0, %rax
	movl	%eax, -24(%rbp)
	movl	-24(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$40, %esi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	call	init_sem@PLT
	movq	%rax, -16(%rbp)
	movl	$0, %eax
	call	init_sem@PLT
	movq	%rax, -8(%rbp)
	movl	-24(%rbp), %edx
	movq	-8(%rbp), %rcx
	movq	-16(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	empezarCiclo@PLT
	movl	$0, %eax
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC5:
	.string	"\n            Semaforo 1      Semaforo 2"
.LC6:
	.string	"Rojo:     \t%d\t\t%d\n"
.LC7:
	.string	"Amarillo: \t%d\t\t%d\n"
.LC8:
	.string	"Verde:    \t%d\t\t%d\n"
	.text
	.globl	imprimirVia
	.type	imprimirVia, @function
imprimirVia:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	movq	-16(%rbp), %rax
	movl	8(%rax), %edx
	movq	-8(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, %esi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-16(%rbp), %rax
	movl	4(%rax), %edx
	movq	-8(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %esi
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-16(%rbp), %rax
	movl	(%rax), %edx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC8(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	imprimirVia, .-imprimirVia
	.section	.rodata
	.align 8
.LC9:
	.string	"Semaforo de dos vias. El tiempo de duracion del amarillo depende de la velocidad de la carretera."
.LC10:
	.string	"Usos: "
.LC11:
	.string	"   semaforo [-v] <velocidad>"
.LC12:
	.string	"   semaforo -h"
	.align 8
.LC13:
	.string	"Opciones:\n   -v Velocidad en Km/h\n   -h Mostrar informacion de ayuda"
	.text
	.globl	ayuda
	.type	ayuda, @function
ayuda:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	leaq	.LC12(%rip), %rdi
	call	puts@PLT
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	ayuda, .-ayuda
	.section	.rodata
	.align 8
.LC2:
	.long	1908874354
	.long	1070712604
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
