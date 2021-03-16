if test "$neon_tetra_initialized" != true
    set -U neon_tetra_initialized true
    set -U pure_symbol_prompt "»"
    set -U pure_symbol_reverse_prompt "«"
    set -U pure_color_success cyan
    set -U pure_color_info magenta
    set -U pure_color_git_dirty magenta

    if not functions -q _pure_prompt
        set -l purepath (realpath (status --current-filename)/../../modules/pure)
        if test -d $purepath/completions; and not contains $purepath/completions $fish_complete_path
            set fish_complete_path $fish_complete_path[1] $purepath/completions $fish_complete_path[2..-1]
        end
        if test -d $purepath/functions; and not contains $purepath/functions $fish_function_path
            set fish_function_path $fish_function_path[1] $purepath/functions $fish_function_path[2..-1]
        end
        for f in $plugin/conf.d/*.fish
            builtin source "$f"
        end
    end
end

function _neon-tetra_uninstall --on-event neon-tetra_uninstall
    set -e neon_tetra_initialized
end
