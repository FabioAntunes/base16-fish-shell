# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Spaceduck scheme by Guillermo Rodriguez (https://github.com/pineapplegiant), packaged by Gabriel Fontes (https://github.com/Misterio77)

function base16-spaceduck -d "base16 Spaceduck theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "16/17/2d" # Base 00 - Black
    set color01 "e3/34/00" # Base 08 - Red
    set color02 "5c/cc/96" # Base 0B - Green
    set color03 "f2/ce/00" # Base 0A - Yellow
    set color04 "7a/5c/cc" # Base 0D - Blue
    set color05 "b3/a1/e6" # Base 0E - Magenta
    set color06 "00/a3/cc" # Base 0C - Cyan
    set color07 "ec/f0/c1" # Base 05 - White
    set color08 "68/6f/9a" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "ff/ff/ff" # Base 07 - Bright White
    set color16 "e3/94/00" # Base 09
    set color17 "ce/6f/8f" # Base 0F
    set color18 "1b/1c/36" # Base 01
    set color19 "30/36/5f" # Base 02
    set color20 "81/85/96" # Base 04
    set color21 "c1/c3/cc" # Base 06
    set color_foreground "ec/f0/c1" # Base 05
    set color_background "16/17/2d" # Base 00

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
        __put_template_custom Pg ecf0c1 # foreground
        __put_template_custom Ph 16172d # background
        __put_template_custom Pi ecf0c1 # bold color
        __put_template_custom Pj 30365f # selection color
        __put_template_custom Pk ecf0c1 # selected text color
        __put_template_custom Pl ecf0c1 # cursor
        __put_template_custom Pm 16172d # cursor text

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
        set -gx fish_color_command "7a5ccc" blue
        set -gx fish_color_quote "5ccc96" green
        set -gx fish_color_redirection "f2ce00" yellow
        set -gx fish_color_end "00a3cc" cyan
        set -gx fish_color_error "e33400" red
        set -gx fish_color_param "c1c3cc" cyan
        set -gx fish_color_comment "686f9a" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "ecf0c1" white --bold --background=brblack
        set -gx fish_color_search_match "f2ce00" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "00a3cc" cyan
        set -gx fish_color_escape "00a3cc" cyan
        set -gx fish_color_cwd "5ccc96" green
        set -gx fish_color_cwd_root "e33400" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "686f9a" brblack
        set -gx fish_color_user "5ccc96" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "f2ce00" yellow
        set -gx fish_pager_color_prefix "ecf0c1" white --bold --underline
        set -gx fish_pager_color_progress "ffffff" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "16" "17" "2d"
    __base16_fish_shell_create_vimrc_background spaceduck
    set -U base16_fish_theme spaceduck

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
