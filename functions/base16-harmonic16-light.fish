# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Harmonic16 Light scheme by Jannik Siebert (https://github.com/janniks)

function base16-harmonic16-light -d "base16 Harmonic16 Light theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "f7/f9/fb" # Base 00 - Black
    set color01 "bf/8b/56" # Base 08 - Red
    set color02 "56/bf/8b" # Base 0B - Green
    set color03 "8b/bf/56" # Base 0A - Yellow
    set color04 "8b/56/bf" # Base 0D - Blue
    set color05 "bf/56/8b" # Base 0E - Magenta
    set color06 "56/8b/bf" # Base 0C - Cyan
    set color07 "40/5c/79" # Base 05 - White
    set color08 "aa/bc/ce" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "0b/1c/2c" # Base 07 - Bright White
    set color16 "bf/bf/56" # Base 09
    set color17 "bf/56/56" # Base 0F
    set color18 "e5/eb/f1" # Base 01
    set color19 "cb/d6/e2" # Base 02
    set color20 "62/7e/99" # Base 04
    set color21 "22/3b/54" # Base 06
    set color_foreground "40/5c/79" # Base 05
    set color_background "f7/f9/fb" # Base 00

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
        __put_template_custom Pg 405c79 # foreground
        __put_template_custom Ph f7f9fb # background
        __put_template_custom Pi 405c79 # bold color
        __put_template_custom Pj cbd6e2 # selection color
        __put_template_custom Pk 405c79 # selected text color
        __put_template_custom Pl 405c79 # cursor
        __put_template_custom Pm f7f9fb # cursor text

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
        set -gx fish_color_command "8b56bf" blue
        set -gx fish_color_quote "56bf8b" green
        set -gx fish_color_redirection "8bbf56" yellow
        set -gx fish_color_end "568bbf" cyan
        set -gx fish_color_error "bf8b56" red
        set -gx fish_color_param "223b54" cyan
        set -gx fish_color_comment "aabcce" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "405c79" white --bold --background=brblack
        set -gx fish_color_search_match "8bbf56" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "568bbf" cyan
        set -gx fish_color_escape "568bbf" cyan
        set -gx fish_color_cwd "56bf8b" green
        set -gx fish_color_cwd_root "bf8b56" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "aabcce" brblack
        set -gx fish_color_user "56bf8b" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "8bbf56" yellow
        set -gx fish_pager_color_prefix "405c79" white --bold --underline
        set -gx fish_pager_color_progress "0b1c2c" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "f7" "f9" "fb"
    __base16_fish_shell_create_vimrc_background harmonic16-light
    set -U base16_fish_theme harmonic16-light

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
