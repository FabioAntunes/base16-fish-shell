# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Mountain scheme by gnsfujiwara (https://github.com/gnsfujiwara)

function base16-mountain -d "base16 Mountain theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "0f/0f/0f" # Base 00 - Black
    set color01 "ac/8a/8c" # Base 08 - Red
    set color02 "8a/ac/8b" # Base 0B - Green
    set color03 "ac/a9/8a" # Base 0A - Yellow
    set color04 "8f/8a/ac" # Base 0D - Blue
    set color05 "ac/8a/ac" # Base 0E - Magenta
    set color06 "8a/ab/ac" # Base 0C - Cyan
    set color07 "ca/ca/ca" # Base 05 - White
    set color08 "4c/4c/4c" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "f0/f0/f0" # Base 07 - Bright White
    set color16 "ce/b1/88" # Base 09
    set color17 "ac/8a/8c" # Base 0F
    set color18 "19/19/19" # Base 01
    set color19 "26/26/26" # Base 02
    set color20 "ac/8a/8c" # Base 04
    set color21 "e7/e7/e7" # Base 06
    set color_foreground "ca/ca/ca" # Base 05
    set color_background "0f/0f/0f" # Base 00

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
        __put_template_custom Pg cacaca # foreground
        __put_template_custom Ph 0f0f0f # background
        __put_template_custom Pi cacaca # bold color
        __put_template_custom Pj 262626 # selection color
        __put_template_custom Pk cacaca # selected text color
        __put_template_custom Pl cacaca # cursor
        __put_template_custom Pm 0f0f0f # cursor text

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
        set -gx fish_color_command "8f8aac" blue
        set -gx fish_color_quote "8aac8b" green
        set -gx fish_color_redirection "aca98a" yellow
        set -gx fish_color_end "8aabac" cyan
        set -gx fish_color_error "ac8a8c" red
        set -gx fish_color_param "e7e7e7" cyan
        set -gx fish_color_comment "4c4c4c" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "cacaca" white --bold --background=brblack
        set -gx fish_color_search_match "aca98a" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "8aabac" cyan
        set -gx fish_color_escape "8aabac" cyan
        set -gx fish_color_cwd "8aac8b" green
        set -gx fish_color_cwd_root "ac8a8c" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "4c4c4c" brblack
        set -gx fish_color_user "8aac8b" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "aca98a" yellow
        set -gx fish_pager_color_prefix "cacaca" white --bold --underline
        set -gx fish_pager_color_progress "f0f0f0" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "0f" "0f" "0f"
    __base16_fish_shell_create_vimrc_background mountain
    set -U base16_fish_theme mountain

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
