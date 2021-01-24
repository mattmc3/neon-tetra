# modify pure prompt to display fail code
# https://github.com/pure-fish/pure/issues/188
# https://github.com/pure-fish/pure/blob/master/functions/fish_prompt.fish
function fish_prompt
    set --local exit_code $status # save previous exit code

    echo -e -n (_pure_prompt_beginning) # init prompt context (clear current line, etc.)
    _pure_print_prompt_rows # manage default vs. compact prompt
    _pure_place_iterm2_prompt_mark # place iTerm shell integration mark
    # show the exit_code from the prior command
    if test $exit_code -ne 0
        echo -e -n (set_color red)$exit_code(set_color normal)
    end
    echo -e -n (_pure_prompt $exit_code) # print prompt
    echo -e (_pure_prompt_ending) # reset colors and end prompt

    set _pure_fresh_session false
end


# # Sources:
# # - Included with Fish: https://github.com/fish-shell/fish-shell/blob/master/share/tools/web_config/sample_prompts/sorin.fish
# # - General theme setup: https://github.com/sorin-ionescu/prezto/blob/d275f316ffdd0bbd075afbff677c3e00791fba16/modules/prompt/functions/prompt_sorin_setup
# # - Extraction of git info: https://github.com/sorin-ionescu/prezto/blob/d275f316ffdd0bbd075afbff677c3e00791fba16/modules/git/functions/git-info#L180-L441

# function fish_prompt
#     set -l cmd_status $status

#     if test -n "$SSH_TTY"
#         echo -n (set_color brred)"$USER"(set_color white)'@'(set_color yellow)(prompt_hostname)' '
#     end

#     echo
#     echo (set_color blue)(prompt_pwd)

#     set_color -o
#     if test "$USER" = 'root'
#         echo -n (set_color red)'⟫ '
#     end

#     # ⋊> - omf default
#     # ❯❯❯ - sorrin default
#     # ❮❮❮ - sorrin vi mode
#     # »»» - tetra
#     # 🐟 - fish emoji
#     # 🐡 - blowfish emoji
#     # 🐠 - tropical fish emoji
#     # 🍣 - sushi emoji
#     # 🍥 - fish cake emoji
#     # >» ❯» ⟫»» ⦈» ❯❮⟭»» >»> >«> »«> »«❯ >«> ><> >>> α ∝ ⟫⟫⟫
#     if test $cmd_status -eq 0
#         make_tetra ">" cyan white
#     else
#         echo -n (set_color red)"$cmd_status"(make_tetra ">" magenta white)
#     end
#     set_color normal
# end

# function make_tetra
#     set -l colors cyan red
#     if test (count $argv) -gt 1
#         set colors $argv[2..-1]
#     end
#     for index in (seq (string length $argv[1]))
#         set char (string sub -s $index -l 1 $argv[1])
#         set coloridx (math \($index - 1\) % (count $colors) + 1)
#         echo -n (set_color $colors[$coloridx])$char
#     end
#     echo -n ' '
#     set_color normal
# end
