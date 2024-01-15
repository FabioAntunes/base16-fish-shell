# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Kanagawa scheme by Tommaso Laurenzi (https://github.com/rebelot)

function base16-kanagawa -d "base16 Kanagawa theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "1f/1f/28" # Base 00 - Black
    set color01 "c3/40/43" # Base 08 - Red
    set color02 "76/94/6a" # Base 0B - Green
    set color03 "c0/a3/6e" # Base 0A - Yellow
    set color04 "7e/9c/d8" # Base 0D - Blue
    set color05 "95/7f/b8" # Base 0E - Magenta
    set color06 "6a/95/89" # Base 0C - Cyan
    set color07 "dc/d7/ba" # Base 05 - White
    set color08 "54/54/6d" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "71/7c/7c" # Base 07 - Bright White
    set color16 "ff/a0/66" # Base 09
    set color17 "d2/7e/99" # Base 0F
    set color18 "16/16/1d" # Base 01
    set color19 "22/32/49" # Base 02
    set color20 "72/71/69" # Base 04
    set color21 "c8/c0/93" # Base 06
    set color_foreground "dc/d7/ba" # Base 05
    set color_background "1f/1f/28" # Base 00

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
        __put_template_custom Pg dcd7ba # foreground
        __put_template_custom Ph 1f1f28 # background
        __put_template_custom Pi dcd7ba # bold color
        __put_template_custom Pj 223249 # selection color
        __put_template_custom Pk dcd7ba # selected text color
        __put_template_custom Pl dcd7ba # cursor
        __put_template_custom Pm 1f1f28 # cursor text

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
        set -gx fish_color_command "7e9cd8" blue
        set -gx fish_color_quote "76946a" green
        set -gx fish_color_redirection "c0a36e" yellow
        set -gx fish_color_end "6a9589" cyan
        set -gx fish_color_error "c34043" red
        set -gx fish_color_param "c8c093" cyan
        set -gx fish_color_comment "54546d" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "dcd7ba" white --bold --background=brblack
        set -gx fish_color_search_match "c0a36e" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "6a9589" cyan
        set -gx fish_color_escape "6a9589" cyan
        set -gx fish_color_cwd "76946a" green
        set -gx fish_color_cwd_root "c34043" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "54546d" brblack
        set -gx fish_color_user "76946a" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "c0a36e" yellow
        set -gx fish_pager_color_prefix "dcd7ba" white --bold --underline
        set -gx fish_pager_color_progress "717c7c" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "1f" "1f" "28"
    __base16_fish_shell_create_vimrc_background kanagawa
    set -U base16_fish_theme kanagawa

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
