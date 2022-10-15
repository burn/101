-include ../etc/Makefile

README.md: 101.lua  ## update readme
	printf "\n# 101\nBase example, command line options and test engines\n" > README.md
	lua $R/readme/readme.lua $^ >>README.md
