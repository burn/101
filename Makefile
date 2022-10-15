R=$(shell dirname $(shell git rev-parse --show-toplevel))
include $R/dotrc/Makefile

README.md: 101.lua 101lib.lua  ## update readme
	printf "\n# 101\nBase example, command line options and test engines\n" > README.md
	lua $R/readme/readme.lua $^ >> README.md

myRockSpec:
	luarocks write_rockspec \
		--license="BSD-2" \
		--summary="Minimal CLI and test suite example." \
		--homepage="https://github.com/burn/101/blob/main/README.md"  \
		--lua-version="5.4" 
