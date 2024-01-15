# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Gruvbox Material Dark, Medium scheme by Mayush Kumar (https://github.com/MayushKumar), sainnhe (https://github.com/sainnhe/gruvbox-material-vscode)

function base16-gruvbox-material-dark-medium -d "base16 Gruvbox Material Dark, Medium theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv

    # colors
    set color00 "29/28/28" # Base 00 - Black
    set color01 "ea/69/62" # Base 08 - Red
    set color02 "a9/b6/65" # Base 0B - Green
    set color03 "d8/a6/57" # Base 0A - Yellow
    set color04 "7d/ae/a3" # Base 0D - Blue
    set color05 "d3/86/9b" # Base 0E - Magenta
    set color06 "89/b4/82" # Base 0C - Cyan
    set color07 "dd/c7/a1" # Base 05 - White
    set color08 "66/5c/54" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "fb/f1/c7" # Base 07 - Bright White
    set color16 "e7/8a/4e" # Base 09
    set color17 "bd/6f/3e" # Base 0F
    set color18 "32/30/2f" # Base 01
    set color19 "50/49/45" # Base 02
    set color20 "bd/ae/93" # Base 04
    set color21 "eb/db/b2" # Base 06
    set color_foreground "dd/c7/a1" # Base 05
    set color_background "29/28/28" # Base 00

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
        __put_template_custom Pg ddc7a1 # foreground
        __put_template_custom Ph 292828 # background
        __put_template_custom Pi ddc7a1 # bold color
        __put_template_custom Pj 504945 # selection color
        __put_template_custom Pk ddc7a1 # selected text color
        __put_template_custom Pl ddc7a1 # cursor
        __put_template_custom Pm 292828 # cursor text

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
        set -gx fish_color_command "7daea3" blue
        set -gx fish_color_quote "a9b665" green
        set -gx fish_color_redirection "d8a657" yellow
        set -gx fish_color_end "89b482" cyan
        set -gx fish_color_error "ea6962" red
        set -gx fish_color_param "ebdbb2" cyan
        set -gx fish_color_comment "665c54" brblack
        set -gx fish_color_match --background=brblue
        set -gx fish_color_selection "ddc7a1" white --bold --background=brblack
        set -gx fish_color_search_match "d8a657" bryellow --background=brblack
        set -gx fish_color_history_current --bold
        set -gx fish_color_operator "89b482" cyan
        set -gx fish_color_escape "89b482" cyan
        set -gx fish_color_cwd "a9b665" green
        set -gx fish_color_cwd_root "ea6962" red
        set -gx fish_color_valid_path --underline
        set -gx fish_color_autosuggestion "665c54" brblack
        set -gx fish_color_user "a9b665" brgreen
        set -gx fish_color_host normal
        set -gx fish_color_cancel -r
        set -gx fish_pager_color_completion normal
        set -gx fish_pager_color_description "d8a657" yellow
        set -gx fish_pager_color_prefix "ddc7a1" white --bold --underline
        set -gx fish_pager_color_progress "fbf1c7" brwhite --background=cyan
    end

    __base16_fish_shell_set_background "29" "28" "28"
    __base16_fish_shell_create_vimrc_background gruvbox-material-dark-medium
    set -U base16_fish_theme gruvbox-material-dark-medium

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
