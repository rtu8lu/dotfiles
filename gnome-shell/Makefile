OBJECTS_FILES = \
  .local/share/themes/bended-larch/gnome-shell/gnome-shell.css \
  .local/share/applications/term-a.desktop \
  .local/share/applications/term-b.desktop

OBJECTS_DCONF = dconf.dump

ARCHIVE_FILES = dotfiles-gnome-shell-files.tar.gz
ARCHIVE_DCONF = dotfiles-gnome-shell-dconf.tar.gz

default:
	@echo "There is no default goal"; false

$(ARCHIVE_FILES): ${OBJECTS_FILES}
	tar czf $(ARCHIVE_FILES) $(OBJECTS_FILES)

$(ARCHIVE_DCONF): ${OBJECTS_DCONF}
	tar czf $(ARCHIVE_DCONF) $(OBJECTS_DCONF)

archive: $(ARCHIVE_FILES) ${ARCHIVE_DCONF} ;

install:
	tar c $(OBJECTS_FILES) | tar xC $(HOME)
	dconf load / < dconf.dump

clean:
	rm -f $(ARCHIVE_FILES) $(ARCHIVE_DCONF)

.PHONY: default archive install clean
