# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Gruber scheme by Patel, Nimai &lt;nimai.m.patel@gmail.com&gt;, colors from www.github.com/rexim/gruber-darker-theme

function base16-gruber -d "base16 Gruber theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "18/18/18" # Base 00 - Black
    set color01 "f4/38/41" # Base 08 - Red
    set color02 "73/c9/36" # Base 0B - Green
    set color03 "ff/dd/33" # Base 0A - Yellow
    set color04 "96/a6/c8" # Base 0D - Blue
    set color05 "9e/95/c7" # Base 0E - Magenta
    set color06 "95/a9/9f" # Base 0C - Cyan
    set color07 "f4/f4/ff" # Base 05 - White
    set color08 "52/49/4e" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "e4/e4/ef" # Base 07 - Bright White
    set color16 "c7/3c/3f" # Base 09
    set color17 "cc/8c/3c" # Base 0F
    set color18 "45/3d/41" # Base 01
    set color19 "48/48/48" # Base 02
    set color20 "e4/e4/ef" # Base 04
    set color21 "f5/f5/f5" # Base 06
    set color_foreground "f4/f4/ff" # Base 05
    set color_background "18/18/18" # Base 00

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
        __put_template_custom Pg f4f4ff # foreground
        __put_template_custom Ph 181818 # background
        __put_template_custom Pi f4f4ff # bold color
        __put_template_custom Pj 484848 # selection color
        __put_template_custom Pk f4f4ff # selected text color
        __put_template_custom Pl f4f4ff # cursor
        __put_template_custom Pm 181818 # cursor text

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
        set -gx fish_color_command "96a6c8" blue
        set -gx fish_color_quote "73c936" green
        set -gx fish_color_redirection "ffdd33" yellow
        set -gx fish_color_end "95a99f" cyan
        set -gx fish_color_error "f43841" red
        set -gx fish_color_param "f5f5f5" cyan
        set -gx fish_color_comment "52494e" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "f4f4ff" white --bold --background=brblack
        set -gx fish_color_search_match "ffdd33" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "95a99f" cyan
        set -gx fish_color_escape "95a99f" cyan
        set -gx fish_color_cwd "73c936" green
        set -gx fish_color_cwd_root "f43841" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "52494e" brblack
        set -gx fish_color_user "73c936" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "ffdd33" yellow
        set -gx fish_pager_color_prefix "f4f4ff" white --bold --underline
        set -gx fish_pager_color_progress "e4e4ef" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "18" "18" "18"
    __base16_fish_shell_create_vimrc_background gruber
    set -U base16_fish_theme gruber

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
