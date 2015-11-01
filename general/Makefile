OBJECTS = \
  .bashfiction \
  .bashrc \
  .bash.d/.keep \
  .gitconfig \
  .inputrc \
  .profile \
  .screenrc \
  .tmux.conf \
  .config/locale.conf \
  .config/fish/config.fish \
  .config/fish/functions/fish_prompt.fish \
  .config/fish/functions/color_echo.fish \
  .config/fish/functions/colorize.fish \
  .config/fish/functions/fish_git_prompt.fish \
  .config/fish/functions/fish_user_key_bindings.fish

ARCHIVE = dotfiles-general.tar.gz

default:
	@echo "There is no default goal"; false

$(ARCHIVE): ${OBJECTS}
	tar czf $(ARCHIVE) $(OBJECTS)

archive: $(ARCHIVE) ;

install:
	tar c $(OBJECTS) | tar xC $(HOME)

clean:
	rm -f $(ARCHIVE)

.PHONY: default archive install clean
