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

```fish
fisher add FabioAntunes/base16-fish-shell
```

Open a new shell and type `base16` followed by a tab to perform tab completion.

## Features

Pure fish solution, no need to source bash functions.
Sets one universal variable with the current theme, whenever a new interactive session is started a function in conf.d will apply the theme's function.
Luma calculation, a global variable `base16_fish_shell_background` is set with the background. Possible values are `dark` or `light`
Base16-vim support

### Base16-Vim Users

Every time you run a base16 function it will update `~/.vimrc_background` file with the current colour scheme, you just need to source this file in your vimrc: i.e. (remove the base16colorspace line if not needed)

    ```vimscript
    if filereadable(expand("~/.vimrc_background"))
      let base16colorspace=256
      source ~/.vimrc_background
    endif
    ```

The script will also calculate the Luma of the background colour of each theme, setting your vim background to **light** or **dark** accordingly.

## Troubleshooting

Run the included colour test option and check that your colour assignments appear correct. If your teminal does not support the setting of colours in within the 256 colour space (e.g. Apple Terminal), colours 17 to 21 will appear blue.

![setting 256 colourspace not supported](https://raw.github.com/chriskempson/base16-shell/master/setting-256-colourspace-not-supported.png)

To run the test just pass the flag `-t` or `--test` to any of the theme functions. 

```fish
base16-solarflare -t
```

### Inverted blacks and whites

This is the expected behaviour when using a light theme:
https://github.com/chriskempson/base16-shell/issues/150
