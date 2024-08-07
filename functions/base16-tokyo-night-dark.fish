# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Tokyo Night Dark scheme by Michaël Ball

function base16-tokyo-night-dark -d "base16 Tokyo Night Dark theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "1a/1b/26" # Base 00 - Black
    set color01 "c0/ca/f5" # Base 08 - Red
    set color02 "9e/ce/6a" # Base 0B - Green
    set color03 "0d/b9/d7" # Base 0A - Yellow
    set color04 "2a/c3/de" # Base 0D - Blue
    set color05 "bb/9a/f7" # Base 0E - Magenta
    set color06 "b4/f9/f8" # Base 0C - Cyan
    set color07 "a9/b1/d6" # Base 05 - White
    set color08 "44/4b/6a" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "d5/d6/db" # Base 07 - Bright White
    set color16 "a9/b1/d6" # Base 09
    set color17 "f7/76/8e" # Base 0F
    set color18 "16/16/1e" # Base 01
    set color19 "2f/35/49" # Base 02
    set color20 "78/7c/99" # Base 04
    set color21 "cb/cc/d1" # Base 06
    set color_foreground "a9/b1/d6" # Base 05
    set color_background "1a/1b/26" # Base 00

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
        __put_template_custom Pg a9b1d6 # foreground
        __put_template_custom Ph 1a1b26 # background
        __put_template_custom Pi a9b1d6 # bold color
        __put_template_custom Pj 2f3549 # selection color
        __put_template_custom Pk a9b1d6 # selected text color
        __put_template_custom Pl a9b1d6 # cursor
        __put_template_custom Pm 1a1b26 # cursor text

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
        set -gx fish_color_command "2ac3de" blue
        set -gx fish_color_quote "9ece6a" green
        set -gx fish_color_redirection "0db9d7" yellow
        set -gx fish_color_end "b4f9f8" cyan
        set -gx fish_color_error "c0caf5" red
        set -gx fish_color_param "cbccd1" cyan
        set -gx fish_color_comment "444b6a" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "a9b1d6" white --bold --background=brblack
        set -gx fish_color_search_match "0db9d7" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "b4f9f8" cyan
        set -gx fish_color_escape "b4f9f8" cyan
        set -gx fish_color_cwd "9ece6a" green
        set -gx fish_color_cwd_root "c0caf5" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "444b6a" brblack
        set -gx fish_color_user "9ece6a" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "0db9d7" yellow
        set -gx fish_pager_color_prefix "a9b1d6" white --bold --underline
        set -gx fish_pager_color_progress "d5d6db" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "1a" "1b" "26"
    __base16_fish_shell_create_vimrc_background tokyo-night-dark
    set -U base16_fish_theme tokyo-night-dark

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
