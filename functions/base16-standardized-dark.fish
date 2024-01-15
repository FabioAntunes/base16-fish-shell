# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# standardized-dark scheme by ali (https://github.com/ali-githb/base16-standardized-scheme)

function base16-standardized-dark -d "base16 standardized-dark theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "22/22/22" # Base 00 - Black
    set color01 "e1/5d/67" # Base 08 - Red
    set color02 "5d/b1/29" # Base 0B - Green
    set color03 "e1/b3/1a" # Base 0A - Yellow
    set color04 "00/a3/f2" # Base 0D - Blue
    set color05 "b4/6e/e0" # Base 0E - Magenta
    set color06 "21/c9/92" # Base 0C - Cyan
    set color07 "c0/c0/c0" # Base 05 - White
    set color08 "89/89/89" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "ff/ff/ff" # Base 07 - Bright White
    set color16 "fc/80/4e" # Base 09
    set color17 "b8/7d/28" # Base 0F
    set color18 "30/30/30" # Base 01
    set color19 "55/55/55" # Base 02
    set color20 "89/89/89" # Base 04
    set color21 "e0/e0/e0" # Base 06
    set color_foreground "c0/c0/c0" # Base 05
    set color_background "22/22/22" # Base 00

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
        __put_template_custom Pg c0c0c0 # foreground
        __put_template_custom Ph 222222 # background
        __put_template_custom Pi c0c0c0 # bold color
        __put_template_custom Pj 555555 # selection color
        __put_template_custom Pk c0c0c0 # selected text color
        __put_template_custom Pl c0c0c0 # cursor
        __put_template_custom Pm 222222 # cursor text

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
        set -gx fish_color_command "00a3f2" blue
        set -gx fish_color_quote "5db129" green
        set -gx fish_color_redirection "e1b31a" yellow
        set -gx fish_color_end "21c992" cyan
        set -gx fish_color_error "e15d67" red
        set -gx fish_color_param "e0e0e0" cyan
        set -gx fish_color_comment "898989" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "c0c0c0" white --bold --background=brblack
        set -gx fish_color_search_match "e1b31a" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "21c992" cyan
        set -gx fish_color_escape "21c992" cyan
        set -gx fish_color_cwd "5db129" green
        set -gx fish_color_cwd_root "e15d67" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "898989" brblack
        set -gx fish_color_user "5db129" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "e1b31a" yellow
        set -gx fish_pager_color_prefix "c0c0c0" white --bold --underline
        set -gx fish_pager_color_progress "ffffff" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "22" "22" "22"
    __base16_fish_shell_create_vimrc_background standardized-dark
    set -U base16_fish_theme standardized-dark

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
