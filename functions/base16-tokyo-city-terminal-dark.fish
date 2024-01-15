# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Tokyo City Terminal Dark scheme by Michaël Ball

function base16-tokyo-city-terminal-dark -d "base16 Tokyo City Terminal Dark theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "17/1d/23" # Base 00 - Black
    set color01 "d9/54/68" # Base 08 - Red
    set color02 "8b/d4/9c" # Base 0B - Green
    set color03 "eb/bf/83" # Base 0A - Yellow
    set color04 "53/9a/fc" # Base 0D - Blue
    set color05 "b6/2d/65" # Base 0E - Magenta
    set color06 "70/e1/e8" # Base 0C - Cyan
    set color07 "d8/e2/ec" # Base 05 - White
    set color08 "52/62/70" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "fb/fb/fd" # Base 07 - Bright White
    set color16 "ff/9e/64" # Base 09
    set color17 "dd/9d/82" # Base 0F
    set color18 "1d/25/2c" # Base 01
    set color19 "28/32/3a" # Base 02
    set color20 "b7/c5/d3" # Base 04
    set color21 "f6/f6/f8" # Base 06
    set color_foreground "d8/e2/ec" # Base 05
    set color_background "17/1d/23" # Base 00

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
        __put_template_custom Pg d8e2ec # foreground
        __put_template_custom Ph 171d23 # background
        __put_template_custom Pi d8e2ec # bold color
        __put_template_custom Pj 28323a # selection color
        __put_template_custom Pk d8e2ec # selected text color
        __put_template_custom Pl d8e2ec # cursor
        __put_template_custom Pm 171d23 # cursor text

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
        set -gx fish_color_command "539afc" blue
        set -gx fish_color_quote "8bd49c" green
        set -gx fish_color_redirection "ebbf83" yellow
        set -gx fish_color_end "70e1e8" cyan
        set -gx fish_color_error "d95468" red
        set -gx fish_color_param "f6f6f8" cyan
        set -gx fish_color_comment "526270" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "d8e2ec" white --bold --background=brblack
        set -gx fish_color_search_match "ebbf83" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "70e1e8" cyan
        set -gx fish_color_escape "70e1e8" cyan
        set -gx fish_color_cwd "8bd49c" green
        set -gx fish_color_cwd_root "d95468" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "526270" brblack
        set -gx fish_color_user "8bd49c" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "ebbf83" yellow
        set -gx fish_pager_color_prefix "d8e2ec" white --bold --underline
        set -gx fish_pager_color_progress "fbfbfd" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "17" "1d" "23"
    __base16_fish_shell_create_vimrc_background tokyo-city-terminal-dark
    set -U base16_fish_theme tokyo-city-terminal-dark

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
