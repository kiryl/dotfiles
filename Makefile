MAKEFLAGS += -rR --no-print-directory
srctree := $(CURDIR)
export srctree

components ?= awesome fontconfig git pentadactyl proxy vim xsession zsh

all: $(components)

$(components):
	@$(MAKE) -f $(srctree)/rules.mk component=$@

.PHONY: $(components)
