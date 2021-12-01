# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Flat scheme by Chris Kempson (http://chriskempson.com)

function base16-flat -d "base16 Flat theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "2c/3e/50" # Base 00 - Black
    set color01 "e7/4c/3c" # Base 08 - Red
    set color02 "2e/cc/71" # Base 0B - Green
    set color03 "f1/c4/0f" # Base 0A - Yellow
    set color04 "34/98/db" # Base 0D - Blue
    set color05 "9b/59/b6" # Base 0E - Magenta
    set color06 "1a/bc/9c" # Base 0C - Cyan
    set color07 "e0/e0/e0" # Base 05 - White
    set color08 "95/a5/a6" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "ec/f0/f1" # Base 07 - Bright White
    set color16 "e6/7e/22" # Base 09
    set color17 "be/64/3c" # Base 0F
    set color18 "34/49/5e" # Base 01
    set color19 "7f/8c/8d" # Base 02
    set color20 "bd/c3/c7" # Base 04
    set color21 "f5/f5/f5" # Base 06
    set color_foreground "e0/e0/e0" # Base 05
    set color_background "2c/3e/50" # Base 00

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
        __put_template_custom Pg e0e0e0 # foreground
        __put_template_custom Ph 2c3e50 # background
        __put_template_custom Pi e0e0e0 # bold color
        __put_template_custom Pj 7f8c8d # selection color
        __put_template_custom Pk e0e0e0 # selected text color
        __put_template_custom Pl e0e0e0 # cursor
        __put_template_custom Pm 2c3e50 # cursor text

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
        set -gx fish_color_command "3498db" blue
        set -gx fish_color_quote "2ecc71" green
        set -gx fish_color_redirection "f1c40f" yellow
        set -gx fish_color_end "1abc9c" cyan
        set -gx fish_color_error "e74c3c" red
        set -gx fish_color_param "f5f5f5" cyan
        set -gx fish_color_comment "95a5a6" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "e0e0e0" white --bold --background=brblack
        set -gx fish_color_search_match "f1c40f" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "1abc9c" cyan
        set -gx fish_color_escape "1abc9c" cyan
        set -gx fish_color_cwd "2ecc71" green
        set -gx fish_color_cwd_root "e74c3c" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "95a5a6" brblack
        set -gx fish_color_user "2ecc71" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "f1c40f" yellow
        set -gx fish_pager_color_prefix "e0e0e0" white --bold --underline
        set -gx fish_pager_color_progress "ecf0f1" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "2c" "3e" "50"
    __base16_fish_shell_create_vimrc_background flat
    set -U base16_fish_theme flat

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
