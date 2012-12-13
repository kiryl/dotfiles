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
dirs := $(addprefix $(destpath),$(dirs))

all: $(files) $(dirs)

$(files): $(destpath)%: $(srctree)/$(component)/%
	@$(create_symlink) $< $@

$(dirs):
	@mkdir -p $@

.PHONY: all
