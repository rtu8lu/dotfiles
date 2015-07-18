function fish_prompt --description 'Write out the prompt'
    set -l last_status $status

    # Just calculate these once, to save a few cycles
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname | cut -d . -f 1)
    end

    # if test $CMD_DURATION
    #     printf "\n# time: %s\n" $CMD_DURATION | colorize 555
    # end
    
    printf "\n%s %s%s\n" \
        (printf "%s@%s" $USER $__fish_prompt_hostname | colorize green) \
        (echo -n (prompt_pwd) | colorize yellow) \
        (fish_git_prompt | colorize 555)

    if test $last_status -eq 0
        printf '$ '
    else
        printf '! ' | colorize red
    end
end
