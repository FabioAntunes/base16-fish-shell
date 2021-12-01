# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Heetch Light scheme by Geoffrey Teale (tealeg@gmail.com)

function base16-heetch-light -d "base16 Heetch Light theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "fe/ff/ff" # Base 00 - Black
    set color01 "27/d9/d5" # Base 08 - Red
    set color02 "f8/00/59" # Base 0B - Green
    set color03 "5b/a2/b6" # Base 0A - Yellow
    set color04 "47/f9/f5" # Base 0D - Blue
    set color05 "bd/01/52" # Base 0E - Magenta
    set color06 "c3/36/78" # Base 0C - Cyan
    set color07 "5a/49/6e" # Base 05 - White
    set color08 "9c/92/a8" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "19/01/34" # Base 07 - Bright White
    set color16 "bd/b6/c5" # Base 09
    set color17 "de/da/e2" # Base 0F
    set color18 "39/25/51" # Base 01
    set color19 "7b/6d/8b" # Base 02
    set color20 "dd/d6/e5" # Base 04
    set color21 "47/05/46" # Base 06
    set color_foreground "5a/49/6e" # Base 05
    set color_background "fe/ff/ff" # Base 00

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
        __put_template_custom Pg 5a496e # foreground
        __put_template_custom Ph feffff # background
        __put_template_custom Pi 5a496e # bold color
        __put_template_custom Pj 7b6d8b # selection color
        __put_template_custom Pk 5a496e # selected text color
        __put_template_custom Pl 5a496e # cursor
        __put_template_custom Pm feffff # cursor text

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
        set -gx fish_color_command "47f9f5" blue
        set -gx fish_color_quote "f80059" green
        set -gx fish_color_redirection "5ba2b6" yellow
        set -gx fish_color_end "c33678" cyan
        set -gx fish_color_error "27d9d5" red
        set -gx fish_color_param "470546" cyan
        set -gx fish_color_comment "9c92a8" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "5a496e" white --bold --background=brblack
        set -gx fish_color_search_match "5ba2b6" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "c33678" cyan
        set -gx fish_color_escape "c33678" cyan
        set -gx fish_color_cwd "f80059" green
        set -gx fish_color_cwd_root "27d9d5" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "9c92a8" brblack
        set -gx fish_color_user "f80059" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "5ba2b6" yellow
        set -gx fish_pager_color_prefix "5a496e" white --bold --underline
        set -gx fish_pager_color_progress "190134" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "fe" "ff" "ff"
    __base16_fish_shell_create_vimrc_background heetch-light
    set -U base16_fish_theme heetch-light

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
