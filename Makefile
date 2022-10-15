R=$(shell dirname $(shell git rev-parse --show-toplevel))
include $R/dotrc/Makefile

README.md: $(wildcard *.lua)  ## update readme
	printf "\n# 101\nBase example, command line options and test engines\n" > README.md
	lua $R/readme/readme.lua $^ >> README.md

pub101:
	luarocks pack   101-v1.0-1.rockspec
	luarocks upload 101-v1.0-1.rockspec
	rm *.rock
