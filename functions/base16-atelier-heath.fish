# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Atelier Heath scheme by Bram de Haan (http://atelierbramdehaan.nl)

function base16-atelier-heath -d "base16 Atelier Heath theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "1b/18/1b" # Base 00 - Black
    set color01 "ca/40/2b" # Base 08 - Red
    set color02 "91/8b/3b" # Base 0B - Green
    set color03 "bb/8a/35" # Base 0A - Yellow
    set color04 "51/6a/ec" # Base 0D - Blue
    set color05 "7b/59/c0" # Base 0E - Magenta
    set color06 "15/93/93" # Base 0C - Cyan
    set color07 "ab/9b/ab" # Base 05 - White
    set color08 "77/69/77" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "f7/f3/f7" # Base 07 - Bright White
    set color16 "a6/59/26" # Base 09
    set color17 "cc/33/cc" # Base 0F
    set color18 "29/23/29" # Base 01
    set color19 "69/5d/69" # Base 02
    set color20 "9e/8f/9e" # Base 04
    set color21 "d8/ca/d8" # Base 06
    set color_foreground "ab/9b/ab" # Base 05
    set color_background "1b/18/1b" # Base 00

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
        __put_template_custom Pg ab9bab # foreground
        __put_template_custom Ph 1b181b # background
        __put_template_custom Pi ab9bab # bold color
        __put_template_custom Pj 695d69 # selection color
        __put_template_custom Pk ab9bab # selected text color
        __put_template_custom Pl ab9bab # cursor
        __put_template_custom Pm 1b181b # cursor text

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
        set -gx fish_color_command "516aec" blue
        set -gx fish_color_quote "918b3b" green
        set -gx fish_color_redirection "bb8a35" yellow
        set -gx fish_color_end "159393" cyan
        set -gx fish_color_error "ca402b" red
        set -gx fish_color_param "d8cad8" cyan
        set -gx fish_color_comment "776977" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "ab9bab" white --bold --background=brblack
        set -gx fish_color_search_match "bb8a35" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "159393" cyan
        set -gx fish_color_escape "159393" cyan
        set -gx fish_color_cwd "918b3b" green
        set -gx fish_color_cwd_root "ca402b" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "776977" brblack
        set -gx fish_color_user "918b3b" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "bb8a35" yellow
        set -gx fish_pager_color_prefix "ab9bab" white --bold --underline
        set -gx fish_pager_color_progress "f7f3f7" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "1b" "18" "1b"
    __base16_fish_shell_create_vimrc_background atelier-heath
    set -U base16_fish_theme atelier-heath

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
