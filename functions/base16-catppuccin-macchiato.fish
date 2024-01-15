# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Catppuccin Macchiato scheme by https://github.com/catppuccin/catppuccin

function base16-catppuccin-macchiato -d "base16 Catppuccin Macchiato theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "24/27/3a" # Base 00 - Black
    set color01 "ed/87/96" # Base 08 - Red
    set color02 "a6/da/95" # Base 0B - Green
    set color03 "ee/d4/9f" # Base 0A - Yellow
    set color04 "8a/ad/f4" # Base 0D - Blue
    set color05 "c6/a0/f6" # Base 0E - Magenta
    set color06 "8b/d5/ca" # Base 0C - Cyan
    set color07 "ca/d3/f5" # Base 05 - White
    set color08 "49/4d/64" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "b7/bd/f8" # Base 07 - Bright White
    set color16 "f5/a9/7f" # Base 09
    set color17 "f0/c6/c6" # Base 0F
    set color18 "1e/20/30" # Base 01
    set color19 "36/3a/4f" # Base 02
    set color20 "5b/60/78" # Base 04
    set color21 "f4/db/d6" # Base 06
    set color_foreground "ca/d3/f5" # Base 05
    set color_background "24/27/3a" # Base 00

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
        __put_template_custom Pg cad3f5 # foreground
        __put_template_custom Ph 24273a # background
        __put_template_custom Pi cad3f5 # bold color
        __put_template_custom Pj 363a4f # selection color
        __put_template_custom Pk cad3f5 # selected text color
        __put_template_custom Pl cad3f5 # cursor
        __put_template_custom Pm 24273a # cursor text

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
        set -gx fish_color_command "8aadf4" blue
        set -gx fish_color_quote "a6da95" green
        set -gx fish_color_redirection "eed49f" yellow
        set -gx fish_color_end "8bd5ca" cyan
        set -gx fish_color_error "ed8796" red
        set -gx fish_color_param "f4dbd6" cyan
        set -gx fish_color_comment "494d64" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "cad3f5" white --bold --background=brblack
        set -gx fish_color_search_match "eed49f" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "8bd5ca" cyan
        set -gx fish_color_escape "8bd5ca" cyan
        set -gx fish_color_cwd "a6da95" green
        set -gx fish_color_cwd_root "ed8796" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "494d64" brblack
        set -gx fish_color_user "a6da95" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "eed49f" yellow
        set -gx fish_pager_color_prefix "cad3f5" white --bold --underline
        set -gx fish_pager_color_progress "b7bdf8" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "24" "27" "3a"
    __base16_fish_shell_create_vimrc_background catppuccin-macchiato
    set -U base16_fish_theme catppuccin-macchiato

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
