-include ../etc/Makefile

README.md: 101.lua ## update readme
	lua ../readme/readme.lua $^ > $@
