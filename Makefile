R=$(shell dirname $(shell git rev-parse --show-toplevel))
include $R/dotrc/Makefile

README.md: 101.lua lib.lua  ## update readme
	printf "\n# 101\nBase example, command line options and test engines\n" > README.md
	lua $R/readme/readme.lua $^ >> README.md
