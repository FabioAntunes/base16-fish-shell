# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# SAGA scheme by https://github.com/SAGAtheme/SAGA

function base16-saga -d "base16 SAGA theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "05/08/0a" # Base 00 - Black
    set color01 "ff/d4/e9" # Base 08 - Red
    set color02 "f7/dd/ff" # Base 0B - Green
    set color03 "fb/eb/c8" # Base 0A - Yellow
    set color04 "c9/ff/f7" # Base 0D - Blue
    set color05 "dc/c3/f9" # Base 0E - Magenta
    set color06 "c5/ed/c1" # Base 0C - Cyan
    set color07 "dc/e2/f7" # Base 05 - White
    set color08 "14/1f/27" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "cc/d3/fe" # Base 07 - Bright White
    set color16 "fb/cb/ae" # Base 09
    set color17 "f6/dd/dd" # Base 0F
    set color18 "0a/10/14" # Base 01
    set color19 "0f/18/1e" # Base 02
    set color20 "19/26/30" # Base 04
    set color21 "f8/ea/e7" # Base 06
    set color_foreground "dc/e2/f7" # Base 05
    set color_background "05/08/0a" # Base 00

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
        __put_template_custom Pg dce2f7 # foreground
        __put_template_custom Ph 05080a # background
        __put_template_custom Pi dce2f7 # bold color
        __put_template_custom Pj 0f181e # selection color
        __put_template_custom Pk dce2f7 # selected text color
        __put_template_custom Pl dce2f7 # cursor
        __put_template_custom Pm 05080a # cursor text

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
        set -gx fish_color_command "c9fff7" blue
        set -gx fish_color_quote "f7ddff" green
        set -gx fish_color_redirection "fbebc8" yellow
        set -gx fish_color_end "c5edc1" cyan
        set -gx fish_color_error "ffd4e9" red
        set -gx fish_color_param "f8eae7" cyan
        set -gx fish_color_comment "141f27" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "dce2f7" white --bold --background=brblack
        set -gx fish_color_search_match "fbebc8" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "c5edc1" cyan
        set -gx fish_color_escape "c5edc1" cyan
        set -gx fish_color_cwd "f7ddff" green
        set -gx fish_color_cwd_root "ffd4e9" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "141f27" brblack
        set -gx fish_color_user "f7ddff" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "fbebc8" yellow
        set -gx fish_pager_color_prefix "dce2f7" white --bold --underline
        set -gx fish_pager_color_progress "ccd3fe" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "05" "08" "0a"
    __base16_fish_shell_create_vimrc_background saga
    set -U base16_fish_theme saga

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
