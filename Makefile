MAKEFLAGS += -rR --no-print-directory
srctree := $(CURDIR)
export srctree

components ?= git proxy vim xsession

all: $(components)

$(components):
	@$(MAKE) -f $(srctree)/rules.mk component=$@

.PHONY: $(components)
