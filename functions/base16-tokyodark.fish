# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Tokyodark scheme by Tiagovla (https://github.com/tiagovla/)

function base16-tokyodark -d "base16 Tokyodark theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "11/12/1d" # Base 00 - Black
    set color01 "a4/85/dd" # Base 08 - Red
    set color02 "d7/a6/5f" # Base 0B - Green
    set color03 "71/99/ee" # Base 0A - Yellow
    set color04 "95/c5/61" # Base 0D - Blue
    set color05 "ee/6d/85" # Base 0E - Magenta
    set color06 "a4/85/dd" # Base 0C - Cyan
    set color07 "ab/b2/bf" # Base 05 - White
    set color08 "39/3a/45" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "2c/2d/38" # Base 07 - Bright White
    set color16 "a4/85/dd" # Base 09
    set color17 "77/34/40" # Base 0F
    set color18 "15/16/21" # Base 01
    set color19 "43/44/4f" # Base 02
    set color20 "1b/1c/27" # Base 04
    set color21 "55/56/61" # Base 06
    set color_foreground "ab/b2/bf" # Base 05
    set color_background "11/12/1d" # Base 00

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
        __put_template_custom Pg abb2bf # foreground
        __put_template_custom Ph 11121d # background
        __put_template_custom Pi abb2bf # bold color
        __put_template_custom Pj 43444f # selection color
        __put_template_custom Pk abb2bf # selected text color
        __put_template_custom Pl abb2bf # cursor
        __put_template_custom Pm 11121d # cursor text

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
        set -gx fish_color_command "95c561" blue
        set -gx fish_color_quote "d7a65f" green
        set -gx fish_color_redirection "7199ee" yellow
        set -gx fish_color_end "a485dd" cyan
        set -gx fish_color_error "a485dd" red
        set -gx fish_color_param "555661" cyan
        set -gx fish_color_comment "393a45" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "abb2bf" white --bold --background=brblack
        set -gx fish_color_search_match "7199ee" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "a485dd" cyan
        set -gx fish_color_escape "a485dd" cyan
        set -gx fish_color_cwd "d7a65f" green
        set -gx fish_color_cwd_root "a485dd" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "393a45" brblack
        set -gx fish_color_user "d7a65f" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "7199ee" yellow
        set -gx fish_pager_color_prefix "abb2bf" white --bold --underline
        set -gx fish_pager_color_progress "2c2d38" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "11" "12" "1d"
    __base16_fish_shell_create_vimrc_background tokyodark
    set -U base16_fish_theme tokyodark

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
