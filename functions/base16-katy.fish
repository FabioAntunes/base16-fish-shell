# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Katy scheme by George Essig (https://github.com/gessig)

function base16-katy -d "base16 Katy theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "29/2d/3e" # Base 00 - Black
    set color01 "6e/98/e1" # Base 08 - Red
    set color02 "78/c0/6e" # Base 0B - Green
    set color03 "e0/a5/57" # Base 0A - Yellow
    set color04 "82/aa/ff" # Base 0D - Blue
    set color05 "c7/92/ea" # Base 0E - Magenta
    set color06 "83/b7/e5" # Base 0C - Cyan
    set color07 "95/9d/cb" # Base 05 - White
    set color08 "67/6e/95" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "ff/ff/ff" # Base 07 - Bright White
    set color16 "f7/8c/6c" # Base 09
    set color17 "ff/53/70" # Base 0F
    set color18 "44/42/67" # Base 01
    set color19 "5c/59/8b" # Base 02
    set color20 "87/96/b0" # Base 04
    set color21 "95/9d/cb" # Base 06
    set color_foreground "95/9d/cb" # Base 05
    set color_background "29/2d/3e" # Base 00

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
        __put_template_custom Pg 959dcb # foreground
        __put_template_custom Ph 292d3e # background
        __put_template_custom Pi 959dcb # bold color
        __put_template_custom Pj 5c598b # selection color
        __put_template_custom Pk 959dcb # selected text color
        __put_template_custom Pl 959dcb # cursor
        __put_template_custom Pm 292d3e # cursor text

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
        set -gx fish_color_command "82aaff" blue
        set -gx fish_color_quote "78c06e" green
        set -gx fish_color_redirection "e0a557" yellow
        set -gx fish_color_end "83b7e5" cyan
        set -gx fish_color_error "6e98e1" red
        set -gx fish_color_param "959dcb" cyan
        set -gx fish_color_comment "676e95" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "959dcb" white --bold --background=brblack
        set -gx fish_color_search_match "e0a557" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "83b7e5" cyan
        set -gx fish_color_escape "83b7e5" cyan
        set -gx fish_color_cwd "78c06e" green
        set -gx fish_color_cwd_root "6e98e1" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "676e95" brblack
        set -gx fish_color_user "78c06e" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "e0a557" yellow
        set -gx fish_pager_color_prefix "959dcb" white --bold --underline
        set -gx fish_pager_color_progress "ffffff" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "29" "2d" "3e"
    __base16_fish_shell_create_vimrc_background katy
    set -U base16_fish_theme katy

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
