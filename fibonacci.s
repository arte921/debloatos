	.text
	.intel_syntax noprefix
	.file	"fibonacci.c"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	dword ptr [rbp - 4], 0
	mov	dword ptr [rbp - 8], 1
	mov	dword ptr [rbp - 12], 0
	mov	dword ptr [rbp - 16], 0
	mov	dword ptr [rbp - 20], 0
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	cmp	dword ptr [rbp - 20], 10
	jge	.LBB0_4
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	mov	eax, dword ptr [rbp - 12]
	add	eax, dword ptr [rbp - 16]
	mov	dword ptr [rbp - 8], eax
	mov	eax, dword ptr [rbp - 12]
	mov	dword ptr [rbp - 16], eax
	mov	eax, dword ptr [rbp - 8]
	mov	dword ptr [rbp - 12], eax
# %bb.3:                                #   in Loop: Header=BB0_1 Depth=1
	mov	eax, dword ptr [rbp - 20]
	add	eax, 1
	mov	dword ptr [rbp - 20], eax
	jmp	.LBB0_1
.LBB0_4:
	mov	eax, dword ptr [rbp - 4]
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 11.0.0 (Fedora 11.0.0-2.fc33)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
