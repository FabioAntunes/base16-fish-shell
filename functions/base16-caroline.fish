# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# caroline scheme by ed (https://codeberg.org/ed)

function base16-caroline -d "base16 caroline theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "1c/12/13" # Base 00 - Black
    set color01 "c2/4f/57" # Base 08 - Red
    set color02 "80/6c/61" # Base 0B - Green
    set color03 "f2/81/71" # Base 0A - Yellow
    set color04 "68/4c/59" # Base 0D - Blue
    set color05 "a6/36/50" # Base 0E - Magenta
    set color06 "6b/65/66" # Base 0C - Cyan
    set color07 "a8/75/69" # Base 05 - White
    set color08 "6d/47/45" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "e3/a6/8c" # Base 07 - Bright White
    set color16 "a6/36/50" # Base 09
    set color17 "89/3f/45" # Base 0F
    set color18 "3a/24/25" # Base 01
    set color19 "56/38/37" # Base 02
    set color20 "8b/5d/57" # Base 04
    set color21 "c5/8d/7b" # Base 06
    set color_foreground "a8/75/69" # Base 05
    set color_background "1c/12/13" # Base 00

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
        __put_template_custom Pg a87569 # foreground
        __put_template_custom Ph 1c1213 # background
        __put_template_custom Pi a87569 # bold color
        __put_template_custom Pj 563837 # selection color
        __put_template_custom Pk a87569 # selected text color
        __put_template_custom Pl a87569 # cursor
        __put_template_custom Pm 1c1213 # cursor text

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
        set -gx fish_color_command "684c59" blue
        set -gx fish_color_quote "806c61" green
        set -gx fish_color_redirection "f28171" yellow
        set -gx fish_color_end "6b6566" cyan
        set -gx fish_color_error "c24f57" red
        set -gx fish_color_param "c58d7b" cyan
        set -gx fish_color_comment "6d4745" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "a87569" white --bold --background=brblack
        set -gx fish_color_search_match "f28171" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "6b6566" cyan
        set -gx fish_color_escape "6b6566" cyan
        set -gx fish_color_cwd "806c61" green
        set -gx fish_color_cwd_root "c24f57" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "6d4745" brblack
        set -gx fish_color_user "806c61" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "f28171" yellow
        set -gx fish_pager_color_prefix "a87569" white --bold --underline
        set -gx fish_pager_color_progress "e3a68c" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "1c" "12" "13"
    __base16_fish_shell_create_vimrc_background caroline
    set -U base16_fish_theme caroline

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
