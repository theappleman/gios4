VER=$(shell git describe --always)
TARGETS=setup systemd

$(TARGETS):
	machinectl clone gshis gshis-$(VER)-$@
	xargs -n1 $(PWD)-$(VER)-$@/recovery <<<"unpack proxy prepare $@"

.PHONY: $(TARGETS)
