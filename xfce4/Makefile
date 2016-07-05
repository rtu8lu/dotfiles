OBJECTS_FILES = \
  .config/menus/xfce-applications.menu \
  .config/xfce4/xfconf/xfce-perchannel-xml/thunar.xml \
  .config/xfce4/xfconf/xfce-perchannel-xml/thunar-volman.xml \
  .config/xfce4/xfconf/xfce-perchannel-xml/displays.xml \
  .config/xfce4/xfconf/xfce-perchannel-xml/xfce4-appfinder.xml \
  .config/xfce4/xfconf/xfce-perchannel-xml/keyboard-layout.xml \
  .config/xfce4/xfconf/xfce-perchannel-xml/xfce4-power-manager.xml \
  .config/xfce4/xfconf/xfce-perchannel-xml/xfce4-mime-settings.xml \
  .config/xfce4/xfconf/xfce-perchannel-xml/keyboards.xml \
  .config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml \
  .config/xfce4/xfconf/xfce-perchannel-xml/xfce4-settings-manager.xml \
  .config/xfce4/xfconf/xfce-perchannel-xml/xfce4-settings-editor.xml \
  .config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml \
  .config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml \
  .config/xfce4/xfconf/xfce-perchannel-xml/xfce4-session.xml \
  .config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml \
  .config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml \
  .config/xfce4/helpers.rc


ARCHIVE_FILES = dotfiles-xfce4.tar.gz

default:
	@echo "There is no default goal"; false

$(ARCHIVE_FILES): ${OBJECTS_FILES}
	tar czf $(ARCHIVE_FILES) $(OBJECTS_FILES)

archive: $(ARCHIVE_FILES) ;

install:
	tar c $(OBJECTS_FILES) | tar xC $(HOME)

clean:
	rm -f $(ARCHIVE_FILES)

.PHONY: default archive install clean
