# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Codeschool scheme by blockloop

function base16-codeschool -d "base16 Codeschool theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "23/2c/31" # Base 00 - Black
    set color01 "2a/54/91" # Base 08 - Red
    set color02 "23/79/86" # Base 0B - Green
    set color03 "a0/3b/1e" # Base 0A - Yellow
    set color04 "48/4d/79" # Base 0D - Blue
    set color05 "c5/98/20" # Base 0E - Magenta
    set color06 "b0/2f/30" # Base 0C - Cyan
    set color07 "9e/a7/a6" # Base 05 - White
    set color08 "3f/49/44" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "b5/d8/f6" # Base 07 - Bright White
    set color16 "43/82/0d" # Base 09
    set color17 "c9/83/44" # Base 0F
    set color18 "1c/36/57" # Base 01
    set color19 "2a/34/3a" # Base 02
    set color20 "84/89/8c" # Base 04
    set color21 "a7/cf/a3" # Base 06
    set color_foreground "9e/a7/a6" # Base 05
    set color_background "23/2c/31" # Base 00

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
        __put_template_custom Pg 9ea7a6 # foreground
        __put_template_custom Ph 232c31 # background
        __put_template_custom Pi 9ea7a6 # bold color
        __put_template_custom Pj 2a343a # selection color
        __put_template_custom Pk 9ea7a6 # selected text color
        __put_template_custom Pl 9ea7a6 # cursor
        __put_template_custom Pm 232c31 # cursor text

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
        set -gx fish_color_command "484d79" blue
        set -gx fish_color_quote "237986" green
        set -gx fish_color_redirection "a03b1e" yellow
        set -gx fish_color_end "b02f30" cyan
        set -gx fish_color_error "2a5491" red
        set -gx fish_color_param "a7cfa3" cyan
        set -gx fish_color_comment "3f4944" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "9ea7a6" white --bold --background=brblack
        set -gx fish_color_search_match "a03b1e" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "b02f30" cyan
        set -gx fish_color_escape "b02f30" cyan
        set -gx fish_color_cwd "237986" green
        set -gx fish_color_cwd_root "2a5491" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "3f4944" brblack
        set -gx fish_color_user "237986" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "a03b1e" yellow
        set -gx fish_pager_color_prefix "9ea7a6" white --bold --underline
        set -gx fish_pager_color_progress "b5d8f6" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "23" "2c" "31"
    __base16_fish_shell_create_vimrc_background codeschool
    set -U base16_fish_theme codeschool

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
