# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Unikitty Dark scheme by Josh W Lewis (@joshwlewis)

function base16-unikitty-dark -d "base16 Unikitty Dark theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "2e/2a/31" # Base 00 - Black
    set color01 "d8/13/7f" # Base 08 - Red
    set color02 "17/ad/98" # Base 0B - Green
    set color03 "dc/8a/0e" # Base 0A - Yellow
    set color04 "79/6a/f5" # Base 0D - Blue
    set color05 "bb/60/ea" # Base 0E - Magenta
    set color06 "14/9b/da" # Base 0C - Cyan
    set color07 "bc/ba/be" # Base 05 - White
    set color08 "83/80/85" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "f5/f4/f7" # Base 07 - Bright White
    set color16 "d6/54/07" # Base 09
    set color17 "c7/20/ca" # Base 0F
    set color18 "4a/46/4d" # Base 01
    set color19 "66/63/69" # Base 02
    set color20 "9f/9d/a2" # Base 04
    set color21 "d8/d7/da" # Base 06
    set color_foreground "bc/ba/be" # Base 05
    set color_background "2e/2a/31" # Base 00

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
        __put_template_custom Pg bcbabe # foreground
        __put_template_custom Ph 2e2a31 # background
        __put_template_custom Pi bcbabe # bold color
        __put_template_custom Pj 666369 # selection color
        __put_template_custom Pk bcbabe # selected text color
        __put_template_custom Pl bcbabe # cursor
        __put_template_custom Pm 2e2a31 # cursor text

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
        set -gx fish_color_command "796af5" blue
        set -gx fish_color_quote "17ad98" green
        set -gx fish_color_redirection "dc8a0e" yellow
        set -gx fish_color_end "149bda" cyan
        set -gx fish_color_error "d8137f" red
        set -gx fish_color_param "d8d7da" cyan
        set -gx fish_color_comment "838085" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "bcbabe" white --bold --background=brblack
        set -gx fish_color_search_match "dc8a0e" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "149bda" cyan
        set -gx fish_color_escape "149bda" cyan
        set -gx fish_color_cwd "17ad98" green
        set -gx fish_color_cwd_root "d8137f" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "838085" brblack
        set -gx fish_color_user "17ad98" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "dc8a0e" yellow
        set -gx fish_pager_color_prefix "bcbabe" white --bold --underline
        set -gx fish_pager_color_progress "f5f4f7" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "2e" "2a" "31"
    __base16_fish_shell_create_vimrc_background unikitty-dark
    set -U base16_fish_theme unikitty-dark

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
