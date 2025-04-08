# DEPRECATED

There are multiple projects out there that provide better functionality and are under active development.

Have a look at [tinted-theming](https://github.com/tinted-theming) and [mini.base16](https://github.com/echasnovski/mini.base16)

# Base16 Fish Shell 
See the [Base16 repository](https://github.com/chriskempson/base16) for more information.  
These scripts were built with [Base16 Builder Go](https://github.com/belak/base16-builder-go).

A pure fish shell solution to change your shell's default ANSI colours but most importantly, colours 17 to 21 of your shell's 256 colorspace (if supported by your terminal). This script makes it possible to honour the original bright colours of your shell (e.g. bright green is still green and so on) while providing additional base16 colours to applications such as Vim.

Heavily inspired on [Base16 Shell](https://github.com/chriskempson/base16-shell)

## Use Cases

* You want to use a `*.256.*` variant of a Terminal theme designed to honour the original bright colours.
* You prefer to use a script instead of a terminal emulator theme to colour your shell.
* You use this script to have different colour schemes appear on different SSH sessions.

## Installation

With [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish)
```fish
omf install https://github.com/FabioAntunes/base16-fish-shell
```

With [fisher](https://github.com/jorgebucaran/fisher)

```shell
fisher install FabioAntunes/base16-fish-shell
```

Open a new shell and type `base16` followed by a tab to perform tab completion.

## Features

* Pure fish solution, no need to source bash functions.
* Sets one universal variable with the current theme. Whenever a new interactive session has started, a function in conf.d will apply the theme's function.
* Luma calculation, a global variable `base16_fish_shell_background` is set with the background. Possible values are `dark` or `light`
Base16-vim support

### Fish Shell
Fish shell has universal variables with colours. These universal variables are responsible for the theme of the prompt. You can see your current colours and modify them using the interactive webpage using the command `fish_config`

When you select a scheme, base16-fish-shell will shadow the universal variables with global variables. If you prefer not to change the fish prompt colours, you can disable this by running the following:

```shell
set -U base16_fish_shell_disable_prompt_colors true
```

This will only disable things like colours for autocompletions, errors, commands, strings.

Here's the complete list of the colours modified by the scripts:
```
fish_color_normal
fish_color_command
fish_color_quote
fish_color_redirection
fish_color_end
fish_color_error
fish_color_param
fish_color_comment
fish_color_match
fish_color_selection
fish_color_search_match
fish_color_history_current
fish_color_operator
fish_color_escape
fish_color_cwd
fish_color_cwd_root
fish_color_valid_path
fish_color_autosuggestion 
fish_color_user
fish_color_host
fish_color_cancel
fish_pager_color_completion
fish_pager_color_description
fish_pager_color_prefix
fish_pager_color_progress 
```

### Base16-Vim Users

Every time you run a base16 function, it will update `~/.vimrc_background` file with the current colour scheme. You need to source this file in your .vimrc: i.e. (remove the base16colorspace line if not required)

```vim
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
```

The script will also calculate the Luma of the background colour of each theme, setting your vim background to **light** or **dark** accordingly.

## Troubleshooting

Run the included colour test option and check that your colour assignments appear correct. If your terminal does not support the setting of colours within the 256 colour space (e.g. Apple Terminal), colours 17 to 21 will appear blue.

![setting 256 colourspace not supported](https://raw.github.com/chriskempson/base16-shell/master/setting-256-colourspace-not-supported.png)

To run the test, pass the flag `-t` or `--test` to any theme functions. 

```shell
base16-solarflare -t
```

![Screenshot 2020-03-19 at 18 41 56](https://user-images.githubusercontent.com/2544673/77102790-50c07580-6a11-11ea-85e6-d88ba956d56d.png)


### Inverted blacks and whites

This is the expected behaviour when using a light theme:
https://github.com/chriskempson/base16-shell/issues/150
