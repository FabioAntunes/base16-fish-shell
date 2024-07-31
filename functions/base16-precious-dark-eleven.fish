# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Precious Dark Eleven scheme by 4lex4 &lt;4lex49@zoho.com&gt;

function base16-precious-dark-eleven -d "base16 Precious Dark Eleven theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "1c/1e/20" # Base 00 - Black
    set color01 "ff/87/82" # Base 08 - Red
    set color02 "95/b6/58" # Base 0B - Green
    set color03 "d0/a5/43" # Base 0A - Yellow
    set color04 "68/b0/ee" # Base 0D - Blue
    set color05 "b7/99/fe" # Base 0E - Magenta
    set color06 "42/bd/a7" # Base 0C - Cyan
    set color07 "b8/b7/b6" # Base 05 - White
    set color08 "85/85/85" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "b8/b7/b6" # Base 07 - Bright White
    set color16 "ea/97/55" # Base 09
    set color17 "f3/82/d8" # Base 0F
    set color18 "29/2b/2d" # Base 01
    set color19 "37/39/3a" # Base 02
    set color20 "a8/a8/a7" # Base 04
    set color21 "b8/b7/b6" # Base 06
    set color_foreground "b8/b7/b6" # Base 05
    set color_background "1c/1e/20" # Base 00

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
        __put_template_custom Pg b8b7b6 # foreground
        __put_template_custom Ph 1c1e20 # background
        __put_template_custom Pi b8b7b6 # bold color
        __put_template_custom Pj 37393a # selection color
        __put_template_custom Pk b8b7b6 # selected text color
        __put_template_custom Pl b8b7b6 # cursor
        __put_template_custom Pm 1c1e20 # cursor text

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
        set -gx fish_color_command "68b0ee" blue
        set -gx fish_color_quote "95b658" green
        set -gx fish_color_redirection "d0a543" yellow
        set -gx fish_color_end "42bda7" cyan
        set -gx fish_color_error "ff8782" red
        set -gx fish_color_param "b8b7b6" cyan
        set -gx fish_color_comment "858585" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "b8b7b6" white --bold --background=brblack
        set -gx fish_color_search_match "d0a543" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "42bda7" cyan
        set -gx fish_color_escape "42bda7" cyan
        set -gx fish_color_cwd "95b658" green
        set -gx fish_color_cwd_root "ff8782" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "858585" brblack
        set -gx fish_color_user "95b658" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "d0a543" yellow
        set -gx fish_pager_color_prefix "b8b7b6" white --bold --underline
        set -gx fish_pager_color_progress "b8b7b6" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "1c" "1e" "20"
    __base16_fish_shell_create_vimrc_background precious-dark-eleven
    set -U base16_fish_theme precious-dark-eleven

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
