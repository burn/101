R=$(shell dirname $(shell git rev-parse --show-toplevel))
include $R/dotrc/Makefile
