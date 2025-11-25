return {
	cmd = {
		"clangd",
		"--query-driver=" ..
		os.getenv("HOME") .. "/.platformio/packages/toolchain-xtensa*/bin/xtensa-lx106-elf-*"
	},
}
