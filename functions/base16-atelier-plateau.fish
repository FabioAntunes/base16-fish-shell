# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Atelier Plateau scheme by Bram de Haan (http://atelierbramdehaan.nl)

function base16-atelier-plateau -d "base16 Atelier Plateau theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "1b/18/18" # Base 00 - Black
    set color01 "ca/49/49" # Base 08 - Red
    set color02 "4b/8b/8b" # Base 0B - Green
    set color03 "a0/6e/3b" # Base 0A - Yellow
    set color04 "72/72/ca" # Base 0D - Blue
    set color05 "84/64/c4" # Base 0E - Magenta
    set color06 "54/85/b6" # Base 0C - Cyan
    set color07 "8a/85/85" # Base 05 - White
    set color08 "65/5d/5d" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "f4/ec/ec" # Base 07 - Bright White
    set color16 "b4/5a/3c" # Base 09
    set color17 "bd/51/87" # Base 0F
    set color18 "29/24/24" # Base 01
    set color19 "58/50/50" # Base 02
    set color20 "7e/77/77" # Base 04
    set color21 "e7/df/df" # Base 06
    set color_foreground "8a/85/85" # Base 05
    set color_background "1b/18/18" # Base 00

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
        __put_template_custom Pg 8a8585 # foreground
        __put_template_custom Ph 1b1818 # background
        __put_template_custom Pi 8a8585 # bold color
        __put_template_custom Pj 585050 # selection color
        __put_template_custom Pk 8a8585 # selected text color
        __put_template_custom Pl 8a8585 # cursor
        __put_template_custom Pm 1b1818 # cursor text

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
        set -gx fish_color_command "7272ca" blue
        set -gx fish_color_quote "4b8b8b" green
        set -gx fish_color_redirection "a06e3b" yellow
        set -gx fish_color_end "5485b6" cyan
        set -gx fish_color_error "ca4949" red
        set -gx fish_color_param "e7dfdf" cyan
        set -gx fish_color_comment "655d5d" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "8a8585" white --bold --background=brblack
        set -gx fish_color_search_match "a06e3b" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "5485b6" cyan
        set -gx fish_color_escape "5485b6" cyan
        set -gx fish_color_cwd "4b8b8b" green
        set -gx fish_color_cwd_root "ca4949" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "655d5d" brblack
        set -gx fish_color_user "4b8b8b" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "a06e3b" yellow
        set -gx fish_pager_color_prefix "8a8585" white --bold --underline
        set -gx fish_pager_color_progress "f4ecec" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "1b" "18" "18"
    __base16_fish_shell_create_vimrc_background atelier-plateau
    set -U base16_fish_theme atelier-plateau

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
