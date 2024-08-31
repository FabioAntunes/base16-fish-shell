# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Tokyodark scheme by Jamy Golden (https://github.com/JamyGolden), Based on Tokyodark.nvim (https://github.com/tiagovla/tokyodark.nvim)

function base16-tokyodark -d "base16 Tokyodark theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "11/12/1d" # Base 00 - Black
    set color01 "ee/6d/85" # Base 08 - Red
    set color02 "95/c5/61" # Base 0B - Green
    set color03 "d7/a6/5f" # Base 0A - Yellow
    set color04 "71/99/ee" # Base 0D - Blue
    set color05 "a4/85/dd" # Base 0E - Magenta
    set color06 "9f/bb/f3" # Base 0C - Cyan
    set color07 "a0/a8/cd" # Base 05 - White
    set color08 "35/39/45" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "bc/c2/dc" # Base 07 - Bright White
    set color16 "f6/95/5b" # Base 09
    set color17 "77/34/40" # Base 0F
    set color18 "21/22/34" # Base 01
    set color19 "21/22/34" # Base 02
    set color20 "4a/50/57" # Base 04
    set color21 "ab/b2/bf" # Base 06
    set color_foreground "a0/a8/cd" # Base 05
    set color_background "11/12/1d" # Base 00

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
        __put_template_custom Pg a0a8cd # foreground
        __put_template_custom Ph 11121d # background
        __put_template_custom Pi a0a8cd # bold color
        __put_template_custom Pj 212234 # selection color
        __put_template_custom Pk a0a8cd # selected text color
        __put_template_custom Pl a0a8cd # cursor
        __put_template_custom Pm 11121d # cursor text

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
        set -gx fish_color_command "7199ee" blue
        set -gx fish_color_quote "95c561" green
        set -gx fish_color_redirection "d7a65f" yellow
        set -gx fish_color_end "9fbbf3" cyan
        set -gx fish_color_error "ee6d85" red
        set -gx fish_color_param "abb2bf" cyan
        set -gx fish_color_comment "353945" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "a0a8cd" white --bold --background=brblack
        set -gx fish_color_search_match "d7a65f" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "9fbbf3" cyan
        set -gx fish_color_escape "9fbbf3" cyan
        set -gx fish_color_cwd "95c561" green
        set -gx fish_color_cwd_root "ee6d85" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "353945" brblack
        set -gx fish_color_user "95c561" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "d7a65f" yellow
        set -gx fish_pager_color_prefix "a0a8cd" white --bold --underline
        set -gx fish_pager_color_progress "bcc2dc" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "11" "12" "1d"
    __base16_fish_shell_create_vimrc_background tokyodark
    set -U base16_fish_theme tokyodark

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
