# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Spacemacs scheme by Nasser Alshammari (https://github.com/nashamri/spacemacs-theme)

function base16-spacemacs -d "base16 Spacemacs theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "1f/20/22" # Base 00 - Black
    set color01 "f2/24/1f" # Base 08 - Red
    set color02 "67/b1/1d" # Base 0B - Green
    set color03 "b1/95/1d" # Base 0A - Yellow
    set color04 "4f/97/d7" # Base 0D - Blue
    set color05 "a3/1d/b1" # Base 0E - Magenta
    set color06 "2d/95/74" # Base 0C - Cyan
    set color07 "a3/a3/a3" # Base 05 - White
    set color08 "58/58/58" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "f8/f8/f8" # Base 07 - Bright White
    set color16 "ff/a5/00" # Base 09
    set color17 "b0/30/60" # Base 0F
    set color18 "28/28/28" # Base 01
    set color19 "44/41/55" # Base 02
    set color20 "b8/b8/b8" # Base 04
    set color21 "e8/e8/e8" # Base 06
    set color_foreground "a3/a3/a3" # Base 05
    set color_background "1f/20/22" # Base 00

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
        __put_template_custom Pg a3a3a3 # foreground
        __put_template_custom Ph 1f2022 # background
        __put_template_custom Pi a3a3a3 # bold color
        __put_template_custom Pj 444155 # selection color
        __put_template_custom Pk a3a3a3 # selected text color
        __put_template_custom Pl a3a3a3 # cursor
        __put_template_custom Pm 1f2022 # cursor text

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
        set -gx fish_color_command "4f97d7" blue
        set -gx fish_color_quote "67b11d" green
        set -gx fish_color_redirection "b1951d" yellow
        set -gx fish_color_end "2d9574" cyan
        set -gx fish_color_error "f2241f" red
        set -gx fish_color_param "e8e8e8" cyan
        set -gx fish_color_comment "585858" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "a3a3a3" white --bold --background=brblack
        set -gx fish_color_search_match "b1951d" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "2d9574" cyan
        set -gx fish_color_escape "2d9574" cyan
        set -gx fish_color_cwd "67b11d" green
        set -gx fish_color_cwd_root "f2241f" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "585858" brblack
        set -gx fish_color_user "67b11d" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "b1951d" yellow
        set -gx fish_pager_color_prefix "a3a3a3" white --bold --underline
        set -gx fish_pager_color_progress "f8f8f8" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "1f" "20" "22"
    __base16_fish_shell_create_vimrc_background spacemacs
    set -U base16_fish_theme spacemacs

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
