all:

include $(srctree)/$(component)/Makefile

scriptdir	:= $(srctree)/scripts
create_symlink	:= $(scriptdir)/create-symlink

ifdef destdir
destpath	:= $(HOME)/$(destdir)/
$(shell mkdir -p $(destpath))
else
destpath	:= $(HOME)/.
endif

files := $(addprefix $(destpath),$(files))

all: $(files)

$(files): $(destpath)%: $(srctree)/$(component)/%
	@$(create_symlink) $< $@

.PHONY: all
