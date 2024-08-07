# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Gotham scheme by Andrea Leopardi (arranged by Brett Jones)

function base16-gotham -d "base16 Gotham theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "0c/10/14" # Base 00 - Black
    set color01 "c2/31/27" # Base 08 - Red
    set color02 "33/85/9e" # Base 0B - Green
    set color03 "ed/b4/43" # Base 0A - Yellow
    set color04 "19/54/66" # Base 0D - Blue
    set color05 "88/8c/a6" # Base 0E - Magenta
    set color06 "2a/a8/89" # Base 0C - Cyan
    set color07 "59/9c/ab" # Base 05 - White
    set color08 "0a/37/49" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "d3/eb/e9" # Base 07 - Bright White
    set color16 "d2/69/37" # Base 09
    set color17 "4e/51/66" # Base 0F
    set color18 "11/15/1c" # Base 01
    set color19 "09/1f/2e" # Base 02
    set color20 "24/53/61" # Base 04
    set color21 "99/d1/ce" # Base 06
    set color_foreground "59/9c/ab" # Base 05
    set color_background "0c/10/14" # Base 00

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
        __put_template_custom Pg 599cab # foreground
        __put_template_custom Ph 0c1014 # background
        __put_template_custom Pi 599cab # bold color
        __put_template_custom Pj 091f2e # selection color
        __put_template_custom Pk 599cab # selected text color
        __put_template_custom Pl 599cab # cursor
        __put_template_custom Pm 0c1014 # cursor text

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
        set -gx fish_color_command "195466" blue
        set -gx fish_color_quote "33859e" green
        set -gx fish_color_redirection "edb443" yellow
        set -gx fish_color_end "2aa889" cyan
        set -gx fish_color_error "c23127" red
        set -gx fish_color_param "99d1ce" cyan
        set -gx fish_color_comment "0a3749" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "599cab" white --bold --background=brblack
        set -gx fish_color_search_match "edb443" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "2aa889" cyan
        set -gx fish_color_escape "2aa889" cyan
        set -gx fish_color_cwd "33859e" green
        set -gx fish_color_cwd_root "c23127" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "0a3749" brblack
        set -gx fish_color_user "33859e" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "edb443" yellow
        set -gx fish_pager_color_prefix "599cab" white --bold --underline
        set -gx fish_pager_color_progress "d3ebe9" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "0c" "10" "14"
    __base16_fish_shell_create_vimrc_background gotham
    set -U base16_fish_theme gotham

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
