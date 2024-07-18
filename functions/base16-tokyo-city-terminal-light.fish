# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Tokyo City Terminal Light scheme by Michaël Ball

function base16-tokyo-city-terminal-light -d "base16 Tokyo City Terminal Light theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "fb/fb/fd" # Base 00 - Black
    set color01 "8c/43/51" # Base 08 - Red
    set color02 "33/63/5c" # Base 0B - Green
    set color03 "8f/5e/15" # Base 0A - Yellow
    set color04 "34/54/8a" # Base 0D - Blue
    set color05 "5a/4a/78" # Base 0E - Magenta
    set color06 "0f/4b/6e" # Base 0C - Cyan
    set color07 "28/32/3a" # Base 05 - White
    set color08 "b7/c5/d3" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "17/1d/23" # Base 07 - Bright White
    set color16 "96/50/27" # Base 09
    set color17 "7e/51/40" # Base 0F
    set color18 "f6/f6/f8" # Base 01
    set color19 "d8/e2/ec" # Base 02
    set color20 "52/62/70" # Base 04
    set color21 "1d/25/2c" # Base 06
    set color_foreground "28/32/3a" # Base 05
    set color_background "fb/fb/fd" # Base 00

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
        __put_template_custom Pg 28323a # foreground
        __put_template_custom Ph fbfbfd # background
        __put_template_custom Pi 28323a # bold color
        __put_template_custom Pj d8e2ec # selection color
        __put_template_custom Pk 28323a # selected text color
        __put_template_custom Pl 28323a # cursor
        __put_template_custom Pm fbfbfd # cursor text

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
        set -gx fish_color_command "34548a" blue
        set -gx fish_color_quote "33635c" green
        set -gx fish_color_redirection "8f5e15" yellow
        set -gx fish_color_end "0f4b6e" cyan
        set -gx fish_color_error "8c4351" red
        set -gx fish_color_param "1d252c" cyan
        set -gx fish_color_comment "b7c5d3" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "28323a" white --bold --background=brblack
        set -gx fish_color_search_match "8f5e15" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "0f4b6e" cyan
        set -gx fish_color_escape "0f4b6e" cyan
        set -gx fish_color_cwd "33635c" green
        set -gx fish_color_cwd_root "8c4351" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "b7c5d3" brblack
        set -gx fish_color_user "33635c" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "8f5e15" yellow
        set -gx fish_pager_color_prefix "28323a" white --bold --underline
        set -gx fish_pager_color_progress "171d23" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "fb" "fb" "fd"
    __base16_fish_shell_create_vimrc_background tokyo-city-terminal-light
    set -U base16_fish_theme tokyo-city-terminal-light

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
