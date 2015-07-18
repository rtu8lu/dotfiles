function fish_git_prompt --description 'Custom git prompt'
    echo -n "$SHELLFICTION_GIT_WORKDIRS" | tr : '\0' | while read -z d
        if expr (pwd) : "^$d" > /dev/null
            __fish_git_prompt
            break
        end
    end
    return 0
end
