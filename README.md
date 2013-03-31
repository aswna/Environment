# Environment #
## Overview ##
Configuration files for my [zsh][1] (shell), [GNU screen][2] (terminal multiplexer) and
[Vim][3] (text editor) environment on Linux, used from [PuTTY][4] (ssh client) on Windows.

I use the [Solarized color scheme][5] in [Vim][6], [PuTTY][7] and [Gnome terminal][8].

## Markup used in this file ##
In this file [GitHub Flavored Markdown][9] is used.

## Cloning repository ##
See more info about [cloning on GitHub][10].

### For read-only access it is easy to use the git:// URL. ###
    git clone git://github.com/aswna/Environment.git

### For read/write access it is best to setup ssh keys and use SSH. ###
    git clone git@github.com:aswna/Environment.git

## Submodules ##
### Adding new submodule ###
Adding a new Git submodule is easy.

    git submodule add <git repo> <directory to clone submodule into>

### Cloning, updating a submodule ###
You can clone the repository in a way, which clones the submodules, too, with Git 1.6.5 and later.

    git clone --recursive <git repo>

In an already existing (cloned) repository, you need to initialize the submodules first and -- usually -- switch to the main branch. The best I could find is the following:

    git submodule update --init --recursive
    git submodule foreach --recursive git checkout master
    git submodule foreach --recursive git pull

### Deleting a submodule ###
1. Delete the relevant line from the <code>.gitmodules</code> file.
2. Delete the relevant section from <code>.git/config</code>.
3. Run <code>git rm --cached &lt;path_to_submodule&gt;</code> (no trailing slash).
4. Commit the "superproject".
5. Delete the now untracked submodule files.

For more details see the [Git submodule tutorial][11].

### Troubleshooting ###
#### Cannot clone/sync with Git on Windows ####
Check whether you are using Symantec Endpoint Protection. If so, the you may want to change
Client Management settings: Current location to "Out of ... premises".

#### After deleting a submodule and adding back another with the same name, Git gets confused ####
Sometimes I replace an official submodule with my own fork until the fix gets merged into the official repository. Even, when I follow the above recipe for the submodule deletion, Git gets confused.
I could not find out a better solution than creating a new clone of the superproject repository (containing all the submodules). Note: take care of the non-tracked private files!
Is there a flaw in my Git usage? Deleting the out-dated entry from <code>.git/config</code> might help.

### Troubleshooting (obsolete) ###
Following troubles are obsolete, since my way of use has changed.

#### Alt-Left/Alt-Right do not switch between GNU screen windows using from PuTTY
Use default PuTTY config options, except for Terminal->Features->Disable application cursor keys mode.
Its default setting is off, and it must be turned on.

#### Vim key bindings do not work as expected using from PuTTY
See above.

#### You are not currently on a branch... ####
Sometimes git pull cannot succeed. Example:

    Stopping at 'zsh'; script returned non-zero status.
    > cd zsh
    > git branch
    * (no branch)
      master
    > git checkout master
See above "Cloning, updating a submodule".

#### warning: templates not found /some/path/git-core/templates ####
Set the correct templates path explicitly.

    git clone --template=/path/to/git-core/templates git@github.com:aswna/Environment.git

[1]: http://www.zsh.org/ "zsh"
[2]: http://www.gnu.org/software/screen/ "GNU screen"
[3]: http://www.vim.org/ "Vim"
[4]: http://www.chiark.greenend.org.uk/~sgtatham/putty/ "PuTTY"
[5]: http://ethanschoonover.com/solarized "Solarized"
[6]: https://github.com/altercation/vim-colors-solarized "Vim colors solarized"
[7]: https://github.com/brantb/solarized/tree/master/putty-colors-solarized "PuTTY colors solarized"
[8]: https://github.com/sigurdga/gnome-terminal-colors-solarized "Gnome terminal colors solarized"
[9]: http://github.github.com/github-flavored-markdown/ "GFM"
[10]: https://help.github.com/articles/which-remote-url-should-i-use "Which remote URL should I use?"
[11]: https://git.wiki.kernel.org/index.php/GitSubmoduleTutorial "Git submodule tutorial"
