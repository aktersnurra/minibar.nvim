.POSIX:

SRC := $(shell find fnl -type f -name "*.fnl")
TRG := $(SRC:fnl/minibar/%.fnl=lua/minibar/%.lua)

compile: $(TRG)

lua/minibar/%.lua: fnl/minibar/%.fnl lua/minibar
	fennel --compile $< > $@

lua/minibar/:
	rm -rf lua
	mkdir -p lua/minibar/

clean:
	rm -rf lua

.PHONY: clean compile
