include $(srctree)/$(component)/Makefile

scriptdir	:= $(srctree)/scripts
create_symlink	:= $(scriptdir)/create-symlink

ifdef destdir
destpath	:= $(HOME)/$(destdir)/
else
destpath	:= $(HOME)/.
endif

all: $(files)

$(files): $(foreach file,$(files),$(srctree)/$(component)/$(file))
	@$(create_symlink) $(srctree)/$(component)/$@ $(destpath)$@

.PHONY: all $(files)
