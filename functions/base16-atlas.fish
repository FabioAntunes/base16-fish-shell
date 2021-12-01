# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Atlas scheme by Alex Lende (https://ajlende.com)

function base16-atlas -d "base16 Atlas theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "00/26/35" # Base 00 - Black
    set color01 "ff/5a/67" # Base 08 - Red
    set color02 "7f/c0/6e" # Base 0B - Green
    set color03 "ff/cc/1b" # Base 0A - Yellow
    set color04 "5d/d7/b9" # Base 0D - Blue
    set color05 "9a/70/a4" # Base 0E - Magenta
    set color06 "14/74/7e" # Base 0C - Cyan
    set color07 "a1/a1/9a" # Base 05 - White
    set color08 "6c/8b/91" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "fa/fa/f8" # Base 07 - Bright White
    set color16 "f0/8e/48" # Base 09
    set color17 "c4/30/60" # Base 0F
    set color18 "00/38/4d" # Base 01
    set color19 "51/7f/8d" # Base 02
    set color20 "86/96/96" # Base 04
    set color21 "e6/e6/dc" # Base 06
    set color_foreground "a1/a1/9a" # Base 05
    set color_background "00/26/35" # Base 00

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
        __put_template_custom Pg a1a19a # foreground
        __put_template_custom Ph 002635 # background
        __put_template_custom Pi a1a19a # bold color
        __put_template_custom Pj 517f8d # selection color
        __put_template_custom Pk a1a19a # selected text color
        __put_template_custom Pl a1a19a # cursor
        __put_template_custom Pm 002635 # cursor text

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
        set -gx fish_color_command "5dd7b9" blue
        set -gx fish_color_quote "7fc06e" green
        set -gx fish_color_redirection "ffcc1b" yellow
        set -gx fish_color_end "14747e" cyan
        set -gx fish_color_error "ff5a67" red
        set -gx fish_color_param "e6e6dc" cyan
        set -gx fish_color_comment "6c8b91" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "a1a19a" white --bold --background=brblack
        set -gx fish_color_search_match "ffcc1b" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "14747e" cyan
        set -gx fish_color_escape "14747e" cyan
        set -gx fish_color_cwd "7fc06e" green
        set -gx fish_color_cwd_root "ff5a67" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "6c8b91" brblack
        set -gx fish_color_user "7fc06e" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "ffcc1b" yellow
        set -gx fish_pager_color_prefix "a1a19a" white --bold --underline
        set -gx fish_pager_color_progress "fafaf8" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "00" "26" "35"
    __base16_fish_shell_create_vimrc_background atlas
    set -U base16_fish_theme atlas

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
