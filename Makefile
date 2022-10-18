-include ../etc/Makefile

README.md: ../readme/readme.lua 4eg.lua ## update readme
	lua $< 4eg.lua > README.md

