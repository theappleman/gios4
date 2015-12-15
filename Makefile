VER=$(shell git describe --always)

all:
	machinectl clone gshis gshis-$(VER)
	xargs -n1 $(PWD)-$(VER)/recovery <<<"unpack proxy prepare systemd"

.PHONY: all
