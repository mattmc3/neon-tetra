if test "$neon_tetra_initialized" != true
    set -U neon_tetra_initialized true
    set -U pure_symbol_prompt "»"
    set -U pure_symbol_reverse_prompt "«"
    set -U pure_color_success cyan
    set -U pure_color_info magenta
    set -U pure_color_git_dirty magenta

    if not functions -q fisher
        curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
    end
    if not functions -q _pure_prompt
        fisher install pure-fish/pure
    end
end
