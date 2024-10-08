# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Terracotta scheme by Alexander Rossell Hayes (https://github.com/rossellhayes)

function base16-terracotta -d "base16 Terracotta theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "ef/ea/e8" # Base 00 - Black
    set color01 "a7/50/45" # Base 08 - Red
    set color02 "7a/89/4a" # Base 0B - Green
    set color03 "ce/94/3e" # Base 0A - Yellow
    set color04 "62/55/74" # Base 0D - Blue
    set color05 "8d/59/68" # Base 0E - Magenta
    set color06 "84/7f/9e" # Base 0C - Cyan
    set color07 "47/37/31" # Base 05 - White
    set color08 "c0/ac/a4" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "24/1c/19" # Base 07 - Bright White
    set color16 "bd/69/42" # Base 09
    set color17 "b0/71/58" # Base 0F
    set color18 "df/d6/d1" # Base 01
    set color19 "d0/c1/bb" # Base 02
    set color20 "59/45/3d" # Base 04
    set color21 "35/2a/25" # Base 06
    set color_foreground "47/37/31" # Base 05
    set color_background "ef/ea/e8" # Base 00

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
        __put_template_custom Pg 473731 # foreground
        __put_template_custom Ph efeae8 # background
        __put_template_custom Pi 473731 # bold color
        __put_template_custom Pj d0c1bb # selection color
        __put_template_custom Pk 473731 # selected text color
        __put_template_custom Pl 473731 # cursor
        __put_template_custom Pm efeae8 # cursor text

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
        set -gx fish_color_command "625574" blue
        set -gx fish_color_quote "7a894a" green
        set -gx fish_color_redirection "ce943e" yellow
        set -gx fish_color_end "847f9e" cyan
        set -gx fish_color_error "a75045" red
        set -gx fish_color_param "352a25" cyan
        set -gx fish_color_comment "c0aca4" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "473731" white --bold --background=brblack
        set -gx fish_color_search_match "ce943e" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "847f9e" cyan
        set -gx fish_color_escape "847f9e" cyan
        set -gx fish_color_cwd "7a894a" green
        set -gx fish_color_cwd_root "a75045" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "c0aca4" brblack
        set -gx fish_color_user "7a894a" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "ce943e" yellow
        set -gx fish_pager_color_prefix "473731" white --bold --underline
        set -gx fish_pager_color_progress "241c19" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "ef" "ea" "e8"
    __base16_fish_shell_create_vimrc_background terracotta
    set -U base16_fish_theme terracotta

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
