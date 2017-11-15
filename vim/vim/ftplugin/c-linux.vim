" TODO: Make it per-buffer
let g:deoplete#sources#clang#flags = [
			\ "-nostdinc",
			\ "-isystem /usr/lib/gcc/x86_64-linux-gnu/7/include",
			\ "-I./arch/x86/include",
			\ "-I./arch/x86/include/generated",
			\ "-I./include",
			\ "-I./arch/x86/include/uapi",
			\ "-I./arch/x86/include/generated/uapi",
			\ "-I./include/uapi",
			\ "-I./include/generated/uapi",
			\ "-include ./include/linux/kconfig.h",
			\ "-D__KERNEL__",
			\ "-O2",
			\ "-DCC_HAVE_ASM_GOTO",
			\ "-DCC_USING_FENTRY",
			\ ]

let b:neomake_c_enabled_makers = ['linux']
