MAKEFLAGS += -rR --no-print-directory
srctree := $(CURDIR)
export srctree

components ?=

all: $(components)

$(components):
	@$(MAKE) -f $(srctree)/rules.mk component=$@

.PHONY: $(components)
