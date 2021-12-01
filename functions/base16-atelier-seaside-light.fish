# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Atelier Seaside Light scheme by Bram de Haan (http://atelierbramdehaan.nl)

function base16-atelier-seaside-light -d "base16 Atelier Seaside Light theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "f4/fb/f4" # Base 00 - Black
    set color01 "e6/19/3c" # Base 08 - Red
    set color02 "29/a3/29" # Base 0B - Green
    set color03 "98/98/1b" # Base 0A - Yellow
    set color04 "3d/62/f5" # Base 0D - Blue
    set color05 "ad/2b/ee" # Base 0E - Magenta
    set color06 "19/99/b3" # Base 0C - Cyan
    set color07 "5e/6e/5e" # Base 05 - White
    set color08 "80/99/80" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "13/15/13" # Base 07 - Bright White
    set color16 "87/71/1d" # Base 09
    set color17 "e6/19/c3" # Base 0F
    set color18 "cf/e8/cf" # Base 01
    set color19 "8c/a6/8c" # Base 02
    set color20 "68/7d/68" # Base 04
    set color21 "24/29/24" # Base 06
    set color_foreground "5e/6e/5e" # Base 05
    set color_background "f4/fb/f4" # Base 00

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
        __put_template_custom Pg 5e6e5e # foreground
        __put_template_custom Ph f4fbf4 # background
        __put_template_custom Pi 5e6e5e # bold color
        __put_template_custom Pj 8ca68c # selection color
        __put_template_custom Pk 5e6e5e # selected text color
        __put_template_custom Pl 5e6e5e # cursor
        __put_template_custom Pm f4fbf4 # cursor text

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
        set -gx fish_color_command "3d62f5" blue
        set -gx fish_color_quote "29a329" green
        set -gx fish_color_redirection "98981b" yellow
        set -gx fish_color_end "1999b3" cyan
        set -gx fish_color_error "e6193c" red
        set -gx fish_color_param "242924" cyan
        set -gx fish_color_comment "809980" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "5e6e5e" white --bold --background=brblack
        set -gx fish_color_search_match "98981b" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "1999b3" cyan
        set -gx fish_color_escape "1999b3" cyan
        set -gx fish_color_cwd "29a329" green
        set -gx fish_color_cwd_root "e6193c" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "809980" brblack
        set -gx fish_color_user "29a329" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "98981b" yellow
        set -gx fish_pager_color_prefix "5e6e5e" white --bold --underline
        set -gx fish_pager_color_progress "131513" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "f4" "fb" "f4"
    __base16_fish_shell_create_vimrc_background atelier-seaside-light
    set -U base16_fish_theme atelier-seaside-light

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
