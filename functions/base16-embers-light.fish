# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Embers Light scheme by Jannik Siebert (https://github.com/janniks)

function base16-embers-light -d "base16 Embers Light theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "d1/d6/db" # Base 00 - Black
    set color01 "57/6d/82" # Base 08 - Red
    set color02 "6d/82/57" # Base 0B - Green
    set color03 "57/82/6d" # Base 0A - Yellow
    set color04 "82/57/6d" # Base 0D - Blue
    set color05 "6d/57/82" # Base 0E - Magenta
    set color06 "82/6d/57" # Base 0C - Cyan
    set color07 "32/3b/43" # Base 05 - White
    set color08 "75/80/8a" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "0f/13/16" # Base 07 - Bright White
    set color16 "57/82/82" # Base 09
    set color17 "57/57/82" # Base 0F
    set color18 "ae/b6/be" # Base 01
    set color19 "90/9a/a3" # Base 02
    set color20 "47/50/5a" # Base 04
    set color21 "20/26/2c" # Base 06
    set color_foreground "32/3b/43" # Base 05
    set color_background "d1/d6/db" # Base 00

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
        __put_template_custom Pg 323b43 # foreground
        __put_template_custom Ph d1d6db # background
        __put_template_custom Pi 323b43 # bold color
        __put_template_custom Pj 909aa3 # selection color
        __put_template_custom Pk 323b43 # selected text color
        __put_template_custom Pl 323b43 # cursor
        __put_template_custom Pm d1d6db # cursor text

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
        set -gx fish_color_command "82576d" blue
        set -gx fish_color_quote "6d8257" green
        set -gx fish_color_redirection "57826d" yellow
        set -gx fish_color_end "826d57" cyan
        set -gx fish_color_error "576d82" red
        set -gx fish_color_param "20262c" cyan
        set -gx fish_color_comment "75808a" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "323b43" white --bold --background=brblack
        set -gx fish_color_search_match "57826d" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "826d57" cyan
        set -gx fish_color_escape "826d57" cyan
        set -gx fish_color_cwd "6d8257" green
        set -gx fish_color_cwd_root "576d82" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "75808a" brblack
        set -gx fish_color_user "6d8257" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "57826d" yellow
        set -gx fish_pager_color_prefix "323b43" white --bold --underline
        set -gx fish_pager_color_progress "0f1316" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "d1" "d6" "db"
    __base16_fish_shell_create_vimrc_background embers-light
    set -U base16_fish_theme embers-light

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
