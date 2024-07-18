# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Ayu Mirage scheme by Khue Nguyen &lt;Z5483Y@gmail.com&gt;

function base16-ayu-mirage -d "base16 Ayu Mirage theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "17/1b/24" # Base 00 - Black
    set color01 "f2/87/79" # Base 08 - Red
    set color02 "d5/ff/80" # Base 0B - Green
    set color03 "ff/d1/73" # Base 0A - Yellow
    set color04 "5c/cf/e6" # Base 0D - Blue
    set color05 "d4/bf/ff" # Base 0E - Magenta
    set color06 "95/e6/cb" # Base 0C - Cyan
    set color07 "cc/ca/c2" # Base 05 - White
    set color08 "70/7a/8c" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "f3/f4/f5" # Base 07 - Bright White
    set color16 "ff/ad/66" # Base 09
    set color17 "f2/9e/74" # Base 0F
    set color18 "1f/24/30" # Base 01
    set color19 "24/29/36" # Base 02
    set color20 "8a/91/99" # Base 04
    set color21 "d9/d7/ce" # Base 06
    set color_foreground "cc/ca/c2" # Base 05
    set color_background "17/1b/24" # Base 00

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
        __put_template_custom Pg cccac2 # foreground
        __put_template_custom Ph 171b24 # background
        __put_template_custom Pi cccac2 # bold color
        __put_template_custom Pj 242936 # selection color
        __put_template_custom Pk cccac2 # selected text color
        __put_template_custom Pl cccac2 # cursor
        __put_template_custom Pm 171b24 # cursor text

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
        set -gx fish_color_command "5ccfe6" blue
        set -gx fish_color_quote "d5ff80" green
        set -gx fish_color_redirection "ffd173" yellow
        set -gx fish_color_end "95e6cb" cyan
        set -gx fish_color_error "f28779" red
        set -gx fish_color_param "d9d7ce" cyan
        set -gx fish_color_comment "707a8c" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "cccac2" white --bold --background=brblack
        set -gx fish_color_search_match "ffd173" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "95e6cb" cyan
        set -gx fish_color_escape "95e6cb" cyan
        set -gx fish_color_cwd "d5ff80" green
        set -gx fish_color_cwd_root "f28779" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "707a8c" brblack
        set -gx fish_color_user "d5ff80" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "ffd173" yellow
        set -gx fish_pager_color_prefix "cccac2" white --bold --underline
        set -gx fish_pager_color_progress "f3f4f5" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "17" "1b" "24"
    __base16_fish_shell_create_vimrc_background ayu-mirage
    set -U base16_fish_theme ayu-mirage

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
