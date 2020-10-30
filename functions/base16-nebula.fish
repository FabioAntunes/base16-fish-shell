# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Nebula scheme by Gabriel Fontes (https://github.com/Misterio77)

function base16-nebula -d "base16 Nebula theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv
    set padded_seq_values (seq -w 0 21)

    # colors
    set color00 "22/27/3b" # Base 00 - Black
    set color01 "77/7a/bc" # Base 08 - Red
    set color02 "65/62/a8" # Base 0B - Green
    set color03 "4f/90/62" # Base 0A - Yellow
    set color04 "4d/6b/b6" # Base 0D - Blue
    set color05 "71/6c/ae" # Base 0E - Magenta
    set color06 "22/6f/68" # Base 0C - Cyan
    set color07 "a4/a6/a9" # Base 05 - White
    set color08 "6e/6f/72" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "8d/bd/aa" # Base 07 - Bright White
    set color16 "94/92/9e" # Base 09
    set color17 "8c/70/a7" # Base 0F
    set color18 "41/4f/60" # Base 01
    set color19 "5a/83/80" # Base 02
    set color20 "87/88/8b" # Base 04
    set color21 "c7/c9/cd" # Base 06
    set color_foreground "a4/a6/a9" # Base 05
    set color_background "22/27/3b" # Base 00

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
      __put_template_custom Pg a4a6a9 # foreground
      __put_template_custom Ph 22273b # background
      __put_template_custom Pi a4a6a9 # bold color
      __put_template_custom Pj 5a8380 # selection color
      __put_template_custom Pk a4a6a9 # selected text color
      __put_template_custom Pl a4a6a9 # cursor
      __put_template_custom Pm 22273b # cursor text

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

    set -gx fish_color_autosuggestion "6e6f72" brblack
    set -gx fish_pager_color_description "94929e" yellow

    __base16_fish_shell_set_background "22" "27" "3b"
    __base16_fish_shell_create_vimrc_background nebula
    set -U base16_fish_theme nebula

    if test -n "$_flag_t"
        set base16_colors
        for seq_value in $padded_seq_values
            set base16_colors $base16_colors $seq_value
        end
        set base16_colors $base16_colors

        __base16_fish_shell_color_test $base16_colors
    end
end
