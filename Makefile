-include ../etc/Makefile

README.md: ../readme/readme.lua 101.lua ## update readme
	lua $^ $(filter-out $<,$^) > README.md
