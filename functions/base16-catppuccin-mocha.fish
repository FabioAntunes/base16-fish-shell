# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Catppuccin Mocha scheme by https://github.com/catppuccin/catppuccin

function base16-catppuccin-mocha -d "base16 Catppuccin Mocha theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "1e/1e/2e" # Base 00 - Black
    set color01 "f3/8b/a8" # Base 08 - Red
    set color02 "a6/e3/a1" # Base 0B - Green
    set color03 "f9/e2/af" # Base 0A - Yellow
    set color04 "89/b4/fa" # Base 0D - Blue
    set color05 "cb/a6/f7" # Base 0E - Magenta
    set color06 "94/e2/d5" # Base 0C - Cyan
    set color07 "cd/d6/f4" # Base 05 - White
    set color08 "45/47/5a" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "b4/be/fe" # Base 07 - Bright White
    set color16 "fa/b3/87" # Base 09
    set color17 "f2/cd/cd" # Base 0F
    set color18 "18/18/25" # Base 01
    set color19 "31/32/44" # Base 02
    set color20 "58/5b/70" # Base 04
    set color21 "f5/e0/dc" # Base 06
    set color_foreground "cd/d6/f4" # Base 05
    set color_background "1e/1e/2e" # Base 00

    # 16 color space
    __put_template 0  $color00
    __put_template 1  $color01
    __put_template 2  $color02
    __put_template 3  $color03
    __put_template 4  $color04
    __put_template 5  $color05
    __put_template 6  $color06
    __put_template 7  $color07
    __put_template 8  $color08
    __put_template 9  $color09
    __put_template 10 $color10
    __put_template 11 $color11
    __put_template 12 $color12
    __put_template 13 $color13
    __put_template 14 $color14
    __put_template 15 $color15

    # 256 color space
    __put_template 16 $color16
    __put_template 17 $color17
    __put_template 18 $color18
    __put_template 19 $color19
    __put_template 20 $color20
    __put_template 21 $color21

    # foreground / background / cursor color
    if test -n "$ITERM_SESSION_ID"
        # iTerm2 proprietary escape codes
        __put_template_custom Pg cdd6f4 # foreground
        __put_template_custom Ph 1e1e2e # background
        __put_template_custom Pi cdd6f4 # bold color
        __put_template_custom Pj 313244 # selection color
        __put_template_custom Pk cdd6f4 # selected text color
        __put_template_custom Pl cdd6f4 # cursor
        __put_template_custom Pm 1e1e2e # cursor text

    else
        __put_template_var 10 $color_foreground
        if test "$BASE16_SHELL_SET_BACKGROUND" != false
            __put_template_var 11 $color_background
            if string match -q -- '*rxvt*' $TERM
                __put_template_var 708 $color_background # internal border (rxvt)
            end
        end
        __put_template_custom 12 ";7" # cursor (reverse video)
    end

    if test -z $base16_fish_shell_disable_prompt_colors
        set -gx fish_color_normal normal
        set -gx fish_color_command "89b4fa" blue
        set -gx fish_color_quote "a6e3a1" green
        set -gx fish_color_redirection "f9e2af" yellow
        set -gx fish_color_end "94e2d5" cyan
        set -gx fish_color_error "f38ba8" red
        set -gx fish_color_param "f5e0dc" cyan
        set -gx fish_color_comment "45475a" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "cdd6f4" white --bold --background=brblack
        set -gx fish_color_search_match "f9e2af" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "94e2d5" cyan
        set -gx fish_color_escape "94e2d5" cyan
        set -gx fish_color_cwd "a6e3a1" green
        set -gx fish_color_cwd_root "f38ba8" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "45475a" brblack
        set -gx fish_color_user "a6e3a1" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "f9e2af" yellow
        set -gx fish_pager_color_prefix "cdd6f4" white --bold --underline
        set -gx fish_pager_color_progress "b4befe" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "1e" "1e" "2e"
    __base16_fish_shell_create_vimrc_background catppuccin-mocha
    set -U base16_fish_theme catppuccin-mocha

    if test -n "$_flag_t"
        set base16_colors_hex
        set padded_seq_values (seq -w 0 21)
        for seq_value in $padded_seq_values
            set -l color "color$seq_value"
            set base16_colors_hex $base16_colors_hex (string replace -a / "" $$color)
        end

        __base16_fish_shell_color_test $base16_colors_hex
    end
end
