# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Precious Dark Fifteen scheme by 4lex4 &lt;4lex49@zoho.com&gt;

function base16-precious-dark-fifteen -d "base16 Precious Dark Fifteen theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "23/26/2b" # Base 00 - Black
    set color01 "ff/87/82" # Base 08 - Red
    set color02 "95/b6/59" # Base 0B - Green
    set color03 "cf/a5/46" # Base 0A - Yellow
    set color04 "66/b0/ef" # Base 0D - Blue
    set color05 "b7/99/ff" # Base 0E - Magenta
    set color06 "42/bd/a7" # Base 0C - Cyan
    set color07 "ba/b9/b6" # Base 05 - White
    set color08 "89/89/89" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "ba/b9/b6" # Base 07 - Bright White
    set color16 "e9/98/57" # Base 09
    set color17 "f3/82/d8" # Base 0F
    set color18 "30/33/37" # Base 01
    set color19 "3e/40/44" # Base 02
    set color20 "ab/aa/a8" # Base 04
    set color21 "ba/b9/b6" # Base 06
    set color_foreground "ba/b9/b6" # Base 05
    set color_background "23/26/2b" # Base 00

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
        __put_template_custom Pg bab9b6 # foreground
        __put_template_custom Ph 23262b # background
        __put_template_custom Pi bab9b6 # bold color
        __put_template_custom Pj 3e4044 # selection color
        __put_template_custom Pk bab9b6 # selected text color
        __put_template_custom Pl bab9b6 # cursor
        __put_template_custom Pm 23262b # cursor text

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
        set -gx fish_color_command "66b0ef" blue
        set -gx fish_color_quote "95b659" green
        set -gx fish_color_redirection "cfa546" yellow
        set -gx fish_color_end "42bda7" cyan
        set -gx fish_color_error "ff8782" red
        set -gx fish_color_param "bab9b6" cyan
        set -gx fish_color_comment "898989" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "bab9b6" white --bold --background=brblack
        set -gx fish_color_search_match "cfa546" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "42bda7" cyan
        set -gx fish_color_escape "42bda7" cyan
        set -gx fish_color_cwd "95b659" green
        set -gx fish_color_cwd_root "ff8782" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "898989" brblack
        set -gx fish_color_user "95b659" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "cfa546" yellow
        set -gx fish_pager_color_prefix "bab9b6" white --bold --underline
        set -gx fish_pager_color_progress "bab9b6" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "23" "26" "2b"
    __base16_fish_shell_create_vimrc_background precious-dark-fifteen
    set -U base16_fish_theme precious-dark-fifteen

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
