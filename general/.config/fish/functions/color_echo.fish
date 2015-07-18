function color_echo
        echo -n -s (set_color $argv[1]) $argv[2..-1] (set_color normal)
end
