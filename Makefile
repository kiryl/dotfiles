MAKEFLAGS += -rR --no-print-directory
srctree := $(CURDIR)
export srctree

components ?= proxy

all: $(components)

$(components):
	@$(MAKE) -f $(srctree)/rules.mk component=$@

.PHONY: $(components)
