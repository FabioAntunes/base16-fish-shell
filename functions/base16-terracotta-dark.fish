# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Terracotta Dark scheme by Alexander Rossell Hayes (https://github.com/rossellhayes)

function base16-terracotta-dark -d "base16 Terracotta Dark theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "24/1d/1a" # Base 00 - Black
    set color01 "f6/99/8f" # Base 08 - Red
    set color02 "b6/c6/8a" # Base 0B - Green
    set color03 "ff/c3/7a" # Base 0A - Yellow
    set color04 "b0/a4/c3" # Base 0D - Blue
    set color05 "d8/a2/b0" # Base 0E - Magenta
    set color06 "c0/bc/db" # Base 0C - Cyan
    set color07 "b8/a5/9d" # Base 05 - White
    set color08 "59/47/40" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "dc/d2/ce" # Base 07 - Bright White
    set color16 "ff/a8/88" # Base 09
    set color17 "f1/ae/97" # Base 0F
    set color18 "36/2b/27" # Base 01
    set color19 "47/39/33" # Base 02
    set color20 "a7/8e/84" # Base 04
    set color21 "ca/bb/b5" # Base 06
    set color_foreground "b8/a5/9d" # Base 05
    set color_background "24/1d/1a" # Base 00

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
        __put_template_custom Pg b8a59d # foreground
        __put_template_custom Ph 241d1a # background
        __put_template_custom Pi b8a59d # bold color
        __put_template_custom Pj 473933 # selection color
        __put_template_custom Pk b8a59d # selected text color
        __put_template_custom Pl b8a59d # cursor
        __put_template_custom Pm 241d1a # cursor text

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
        set -gx fish_color_command "b0a4c3" blue
        set -gx fish_color_quote "b6c68a" green
        set -gx fish_color_redirection "ffc37a" yellow
        set -gx fish_color_end "c0bcdb" cyan
        set -gx fish_color_error "f6998f" red
        set -gx fish_color_param "cabbb5" cyan
        set -gx fish_color_comment "594740" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "b8a59d" white --bold --background=brblack
        set -gx fish_color_search_match "ffc37a" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "c0bcdb" cyan
        set -gx fish_color_escape "c0bcdb" cyan
        set -gx fish_color_cwd "b6c68a" green
        set -gx fish_color_cwd_root "f6998f" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "594740" brblack
        set -gx fish_color_user "b6c68a" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "ffc37a" yellow
        set -gx fish_pager_color_prefix "b8a59d" white --bold --underline
        set -gx fish_pager_color_progress "dcd2ce" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "24" "1d" "1a"
    __base16_fish_shell_create_vimrc_background terracotta-dark
    set -U base16_fish_theme terracotta-dark

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
