source "$HOME/.bashfiction" || return

export LOCAL="$HOME/.local"
export NIX_PROFILE="$HOME/.nix-profile"

export PATH="$(pathset \
    "$LOCAL/bin" \
    "$NIX_PROFILE/bin" \
    "$NIX_PROFILE/sbin" \
    "$HOME/.cabal/bin" \
    "$PATH" \
    "/usr/local/bin" \
    "/usr/bin" \
    "/bin" \
    "/usr/local/sbin" \
    "/usr/sbin" \
    "/sbin" \
)"

export MANPATH="$(pathset \
    "$LOCAL/share/man" \
    "$NIX_PROFILE/share/man" \
    "$MANPATH" \
    "/usr/local/share/man" \
    "/usr/share/man" \
    "/usr/man" \
)"

export INFOPATH="$(pathset \
    "$LOCAL/share/info" \
    "$NIX_PROFILE/share/info" \
    "/usr/local/share/info" \
    "$INFOPATH" \
)"

export SHELLFICTION_GIT_WORKDIRS="$(pathset \
    "$HOME/my" \
    "$HOME/our" \
    "$SHELLFICTION_GIT_WORKDIRS" \
)"

export EDITOR="$(ts \
    "$(type -p "$HOME/.local/bin/ee" "nano" "vim" "ed" | head -n 1)" or \
    "$EDITOR"
)"


if [ -e /etc/ssl/certs/ca-bundle.crt ]; then
    export SSL_CERT_FILE=/etc/ssl/certs/ca-bundle.crt
elif [ -e /etc/ssl/certs/ca-certificates.crt ]; then
    export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
elif [ -e "$NIX_PROFILE/etc/ca-bundle.crt" ]; then
    export SSL_CERT_FILE="$NIX_PROFILE/etc/ca-bundle.crt"
fi


# Interactive only code below

[[ $- == *i* ]] || return

keychain --confhost --noinherit --nogui --ignore-missing .ssh/id_rsa

if [ -e "$HOME/.keychain/$(hostname)-sh" ]; then
    source "$HOME/.keychain/$(hostname)-sh"
fi

case "${!SHELLFICTION_BOOTSTRAP_*}" in
    *BASH* )
        unset SHELLFICTION_BOOTSTRAP_BASH
        if shopt -q login_shell; then
            bootsrap_bash
        fi
        ;;
    *TMUX* )
        unset SHELLFICTION_BOOTSTRAP_TMUX
        if [ "$SHELLFICTION_TMUX_SCREEN" -a -z "$TMUX" ]; then
            bootstrap_tmux "$SHELLFICTION_TMUX_SCREEN"
        fi
        ;;
    *FISH* )
        unset SHELLFICTION_BOOTSTRAP_FISH
        exec fish
        ;;
esac

bash_defaults
