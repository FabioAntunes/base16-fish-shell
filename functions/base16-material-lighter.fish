# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Material Lighter scheme by Nate Peterson

function base16-material-lighter -d "base16 Material Lighter theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "fa/fa/fa" # Base 00 - Black
    set color01 "ff/53/70" # Base 08 - Red
    set color02 "91/b8/59" # Base 0B - Green
    set color03 "ff/b6/2c" # Base 0A - Yellow
    set color04 "61/82/b8" # Base 0D - Blue
    set color05 "7c/4d/ff" # Base 0E - Magenta
    set color06 "39/ad/b5" # Base 0C - Cyan
    set color07 "80/cb/c4" # Base 05 - White
    set color08 "cc/d7/da" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "ff/ff/ff" # Base 07 - Bright White
    set color16 "f7/6d/47" # Base 09
    set color17 "e5/39/35" # Base 0F
    set color18 "e7/ea/ec" # Base 01
    set color19 "cc/ea/e7" # Base 02
    set color20 "87/96/b0" # Base 04
    set color21 "80/cb/c4" # Base 06
    set color_foreground "80/cb/c4" # Base 05
    set color_background "fa/fa/fa" # Base 00

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
        __put_template_custom Pg 80cbc4 # foreground
        __put_template_custom Ph fafafa # background
        __put_template_custom Pi 80cbc4 # bold color
        __put_template_custom Pj cceae7 # selection color
        __put_template_custom Pk 80cbc4 # selected text color
        __put_template_custom Pl 80cbc4 # cursor
        __put_template_custom Pm fafafa # cursor text

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
        set -gx fish_color_command "6182b8" blue
        set -gx fish_color_quote "91b859" green
        set -gx fish_color_redirection "ffb62c" yellow
        set -gx fish_color_end "39adb5" cyan
        set -gx fish_color_error "ff5370" red
        set -gx fish_color_param "80cbc4" cyan
        set -gx fish_color_comment "ccd7da" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "80cbc4" white --bold --background=brblack
        set -gx fish_color_search_match "ffb62c" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "39adb5" cyan
        set -gx fish_color_escape "39adb5" cyan
        set -gx fish_color_cwd "91b859" green
        set -gx fish_color_cwd_root "ff5370" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "ccd7da" brblack
        set -gx fish_color_user "91b859" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "ffb62c" yellow
        set -gx fish_pager_color_prefix "80cbc4" white --bold --underline
        set -gx fish_pager_color_progress "ffffff" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "fa" "fa" "fa"
    __base16_fish_shell_create_vimrc_background material-lighter
    set -U base16_fish_theme material-lighter

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
