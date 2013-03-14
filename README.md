# Environment #
## Overview ##
Configuration files for my [zsh][1] (shell), [GNU screen][2] (terminal multiplexer) and
[Vim][3] (text editor) environment on Unix used from [PuTTY][4] (ssh client) on Windows.

## Markup used in this file ##
In this file [GitHub Flavored Markdown][6] is used.

## Cloning repository ##
See more info about [cloning on GitHub][7].

### For read-only access it is easy to use the git:// URL. ###
    git clone git://github.com/aswna/Environment.git

### For read/write access it is best to setup ssh keys and use SSH. ###
    git clone git@github.com:aswna/Environment.git

### Troubleshooting ###
#### warning: templates not found /some/path/git-core/templates ####
Set the correct templates path explicitly.

    git clone --template=/path/to/git-core/templates git@github.com:aswna/Environment.git

#### Cannot clone/sync with git on Windows ####
Check whether you are using Symantec Endpoint Protection. If so, the you may want to change
Client Management settings: Current location to "Out of ... premises".

### Troubleshooting (obsolete) ###
Following troubles are obsolete, since my way of use changed.

#### Alt-Left/Alt-Right do not switch between GNU screen windows in PuTTY
Use default PuTTY config options, except for Terminal->Features->Disable application cursor keys mode.
Its default setting is off, and it must be turned on.

#### Vim key bindings do not work as expected in PuTTY
See above.

[1]: http://www.zsh.org/ "zsh"
[2]: http://www.gnu.org/software/screen/ "GNU screen"
[3]: http://www.vim.org/ "Vim"
[4]: http://www.chiark.greenend.org.uk/~sgtatham/putty/ "PuTTY"
[5]: http://sourceforge.net/projects/portableapps/files/PuTTY%20Portable/ "PuTTY portable"
[6]: http://github.github.com/github-flavored-markdown/ "GFM"
[7]: https://help.github.com/articles/which-remote-url-should-i-use "Which remote URL should I use?"
