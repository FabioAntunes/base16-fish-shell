# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Everforest scheme by Sainnhe Park (https://github.com/sainnhe)

function base16-everforest -d "base16 Everforest theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "2f/38/3e" # Base 00 - Black
    set color01 "7f/bb/b3" # Base 08 - Red
    set color02 "83/c0/92" # Base 0B - Green
    set color03 "db/bc/7f" # Base 0A - Yellow
    set color04 "a7/c0/80" # Base 0D - Blue
    set color05 "e6/7e/80" # Base 0E - Magenta
    set color06 "e6/98/75" # Base 0C - Cyan
    set color07 "d3/c6/aa" # Base 05 - White
    set color08 "85/92/89" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "fd/f6/e3" # Base 07 - Bright White
    set color16 "d6/99/b6" # Base 09
    set color17 "ea/ed/c8" # Base 0F
    set color18 "37/42/47" # Base 01
    set color19 "4a/55/5b" # Base 02
    set color20 "9d/a9/a0" # Base 04
    set color21 "e4/e1/cd" # Base 06
    set color_foreground "d3/c6/aa" # Base 05
    set color_background "2f/38/3e" # Base 00

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
        __put_template_custom Pg d3c6aa # foreground
        __put_template_custom Ph 2f383e # background
        __put_template_custom Pi d3c6aa # bold color
        __put_template_custom Pj 4a555b # selection color
        __put_template_custom Pk d3c6aa # selected text color
        __put_template_custom Pl d3c6aa # cursor
        __put_template_custom Pm 2f383e # cursor text

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
        set -gx fish_color_command "a7c080" blue
        set -gx fish_color_quote "83c092" green
        set -gx fish_color_redirection "dbbc7f" yellow
        set -gx fish_color_end "e69875" cyan
        set -gx fish_color_error "7fbbb3" red
        set -gx fish_color_param "e4e1cd" cyan
        set -gx fish_color_comment "859289" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "d3c6aa" white --bold --background=brblack
        set -gx fish_color_search_match "dbbc7f" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "e69875" cyan
        set -gx fish_color_escape "e69875" cyan
        set -gx fish_color_cwd "83c092" green
        set -gx fish_color_cwd_root "7fbbb3" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "859289" brblack
        set -gx fish_color_user "83c092" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "dbbc7f" yellow
        set -gx fish_pager_color_prefix "d3c6aa" white --bold --underline
        set -gx fish_pager_color_progress "fdf6e3" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "2f" "38" "3e"
    __base16_fish_shell_create_vimrc_background everforest
    set -U base16_fish_theme everforest

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
