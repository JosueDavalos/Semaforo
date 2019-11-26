	.file	"main.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Use: %s [-v <Velocidad>]\nArgumento despues v tiene que ser un numero\n"
.LC1:
	.string	"hv:"
	.align 8
.LC2:
	.string	"\nVelocidad l\303\255mite en km/h: %d\n"
	.align 8
.LC4:
	.string	"Velocidad l\303\255mite en m/s: %d (aproximadamente)\n"
	.align 8
.LC5:
	.string	"Duraci\303\263n total de ciclo en segundos: %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
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
.L8:
	cmpl	$104, -20(%rbp)
	je	.L3
	cmpl	$118, -20(%rbp)
	je	.L4
	jmp	.L11
.L3:
	movl	$0, %eax
	call	ayuda
	movl	$1, %eax
	jmp	.L6
.L4:
	movq	optarg(%rip), %rax
	testq	%rax, %rax
	je	.L7
	movq	optarg(%rip), %rax
	movq	%rax, %rdi
	call	Isdigit
	testl	%eax, %eax
	jne	.L7
	movq	-48(%rbp), %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$-1, %eax
	jmp	.L6
.L7:
	movq	optarg(%rip), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -24(%rbp)
	jmp	.L2
.L11:
	movl	$0, %eax
	call	ayuda
	movl	$-1, %eax
	jmp	.L6
.L2:
	movq	-48(%rbp), %rcx
	movl	-36(%rbp), %eax
	leaq	.LC1(%rip), %rdx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	getopt@PLT
	movl	%eax, -20(%rbp)
	cmpl	$-1, -20(%rbp)
	jne	.L8
	movl	-24(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-24(%rbp), %eax
	testq	%rax, %rax
	js	.L9
	cvtsi2sdq	%rax, %xmm0
	jmp	.L10
.L9:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L10:
	movsd	.LC3(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	cvttsd2siq	%xmm0, %rax
	movl	%eax, -24(%rbp)
	movl	-24(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$40, %esi
	leaq	.LC5(%rip), %rdi
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
.L6:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC6:
	.string	"\n            Semaforo 1      Semaforo 2"
.LC7:
	.string	"Rojo:     \t%d\t\t%d\n"
.LC8:
	.string	"Amarillo: \t%d\t\t%d\n"
.LC9:
	.string	"Verde:    \t%d\t\t%d\n"
	.text
	.globl	imprimirVia
	.type	imprimirVia, @function
imprimirVia:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	movq	-16(%rbp), %rax
	movl	8(%rax), %edx
	movq	-8(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, %esi
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-16(%rbp), %rax
	movl	4(%rax), %edx
	movq	-8(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %esi
	leaq	.LC8(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-16(%rbp), %rax
	movl	(%rax), %edx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC9(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	imprimirVia, .-imprimirVia
	.section	.rodata
	.align 8
.LC10:
	.string	"Semaforo de dos vias. El tiempo de duracion del amarillo depende de la velocidad de la carretera."
.LC11:
	.string	"Usos: "
.LC12:
	.string	"   semaforo [-v <velocidad>]"
.LC13:
	.string	"   semaforo -h"
	.align 8
.LC14:
	.string	"Opciones:\n   -v Velocidad en Km/h\n   -h Mostrar informacion de ayuda"
	.text
	.globl	ayuda
	.type	ayuda, @function
ayuda:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	leaq	.LC12(%rip), %rdi
	call	puts@PLT
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
	leaq	.LC14(%rip), %rdi
	call	puts@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	ayuda, .-ayuda
	.globl	Isdigit
	.type	Isdigit, @function
Isdigit:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L15
.L18:
	call	__ctype_b_loc@PLT
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movsbq	%al, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$2048, %eax
	testl	%eax, %eax
	jne	.L16
	movl	$0, %eax
	jmp	.L17
.L16:
	addq	$1, -8(%rbp)
.L15:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L18
	movl	$1, %eax
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	Isdigit, .-Isdigit
	.section	.rodata
	.align 8
.LC3:
	.long	1908874354
	.long	1070712604
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
