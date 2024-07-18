# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Ayu Dark scheme by Khue Nguyen &lt;Z5483Y@gmail.com&gt;

function base16-ayu-dark -d "base16 Ayu Dark theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "0f/14/19" # Base 00 - Black
    set color01 "f0/71/78" # Base 08 - Red
    set color02 "b8/cc/52" # Base 0B - Green
    set color03 "ff/b4/54" # Base 0A - Yellow
    set color04 "59/c2/ff" # Base 0D - Blue
    set color05 "d2/a6/ff" # Base 0E - Magenta
    set color06 "95/e6/cb" # Base 0C - Cyan
    set color07 "e6/e1/cf" # Base 05 - White
    set color08 "3e/4b/59" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "f3/f4/f5" # Base 07 - Bright White
    set color16 "ff/8f/40" # Base 09
    set color17 "e6/b6/73" # Base 0F
    set color18 "13/17/21" # Base 01
    set color19 "27/2d/38" # Base 02
    set color20 "bf/bd/b6" # Base 04
    set color21 "e6/e1/cf" # Base 06
    set color_foreground "e6/e1/cf" # Base 05
    set color_background "0f/14/19" # Base 00

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
        __put_template_custom Pg e6e1cf # foreground
        __put_template_custom Ph 0f1419 # background
        __put_template_custom Pi e6e1cf # bold color
        __put_template_custom Pj 272d38 # selection color
        __put_template_custom Pk e6e1cf # selected text color
        __put_template_custom Pl e6e1cf # cursor
        __put_template_custom Pm 0f1419 # cursor text

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
        set -gx fish_color_command "59c2ff" blue
        set -gx fish_color_quote "b8cc52" green
        set -gx fish_color_redirection "ffb454" yellow
        set -gx fish_color_end "95e6cb" cyan
        set -gx fish_color_error "f07178" red
        set -gx fish_color_param "e6e1cf" cyan
        set -gx fish_color_comment "3e4b59" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "e6e1cf" white --bold --background=brblack
        set -gx fish_color_search_match "ffb454" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "95e6cb" cyan
        set -gx fish_color_escape "95e6cb" cyan
        set -gx fish_color_cwd "b8cc52" green
        set -gx fish_color_cwd_root "f07178" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "3e4b59" brblack
        set -gx fish_color_user "b8cc52" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "ffb454" yellow
        set -gx fish_pager_color_prefix "e6e1cf" white --bold --underline
        set -gx fish_pager_color_progress "f3f4f5" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "0f" "14" "19"
    __base16_fish_shell_create_vimrc_background ayu-dark
    set -U base16_fish_theme ayu-dark

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
