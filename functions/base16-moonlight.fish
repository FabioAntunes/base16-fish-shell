# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Moonlight scheme by Jeremy Swinarton (https://github.com/jswinarton)

function base16-moonlight -d "base16 Moonlight theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "21/23/37" # Base 00 - Black
    set color01 "ff/53/70" # Base 08 - Red
    set color02 "2d/f4/c0" # Base 0B - Green
    set color03 "ff/c7/77" # Base 0A - Yellow
    set color04 "40/ff/ff" # Base 0D - Blue
    set color05 "b9/94/f1" # Base 0E - Magenta
    set color06 "04/d1/f9" # Base 0C - Cyan
    set color07 "a3/ac/e1" # Base 05 - White
    set color08 "74/8c/d6" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "ef/43/fa" # Base 07 - Bright White
    set color16 "f6/7f/81" # Base 09
    set color17 "ec/b2/f0" # Base 0F
    set color18 "40/3c/64" # Base 01
    set color19 "59/63/99" # Base 02
    set color20 "a1/ab/e0" # Base 04
    set color21 "b4/a4/f4" # Base 06
    set color_foreground "a3/ac/e1" # Base 05
    set color_background "21/23/37" # Base 00

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
        __put_template_custom Pg a3ace1 # foreground
        __put_template_custom Ph 212337 # background
        __put_template_custom Pi a3ace1 # bold color
        __put_template_custom Pj 596399 # selection color
        __put_template_custom Pk a3ace1 # selected text color
        __put_template_custom Pl a3ace1 # cursor
        __put_template_custom Pm 212337 # cursor text

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
        set -gx fish_color_command "40ffff" blue
        set -gx fish_color_quote "2df4c0" green
        set -gx fish_color_redirection "ffc777" yellow
        set -gx fish_color_end "04d1f9" cyan
        set -gx fish_color_error "ff5370" red
        set -gx fish_color_param "b4a4f4" cyan
        set -gx fish_color_comment "748cd6" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "a3ace1" white --bold --background=brblack
        set -gx fish_color_search_match "ffc777" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "04d1f9" cyan
        set -gx fish_color_escape "04d1f9" cyan
        set -gx fish_color_cwd "2df4c0" green
        set -gx fish_color_cwd_root "ff5370" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "748cd6" brblack
        set -gx fish_color_user "2df4c0" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "ffc777" yellow
        set -gx fish_pager_color_prefix "a3ace1" white --bold --underline
        set -gx fish_pager_color_progress "ef43fa" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "21" "23" "37"
    __base16_fish_shell_create_vimrc_background moonlight
    set -U base16_fish_theme moonlight

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
