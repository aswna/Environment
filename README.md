# Environment #
## Overview ##
Configuration files for my [zsh][1] (shell), [GNU screen][2] (terminal multiplexer) and
[Vim][3] (text editor) environment on Linux/Windows, used from [PuTTY][4] (ssh client) on Windows.

I use the [Solarized color scheme][5] in [Vim][6], [PuTTY][7], [Gnome terminal][8] and for [GNU dircolors][20].

## Markup used in this file ##
In this file [GitHub Flavored Markdown][9] is used.

## Cloning repository ##
See more info about [cloning on GitHub][10]. See below Submodules section, too.

### For read-only access it is easy to use the git:// URL. ###
    git clone git://github.com/aswna/Environment.git

### For read/write access it is best to setup ssh keys and use SSH. ###
    git clone git@github.com:aswna/Environment.git

## Using this repository ##
Create symbolic links in your home directory to the configuration files in this repository.
Some examples:

    .config/redshift.conf -> <repo dir>/.config/redshift.conf
    .dircolors            -> <repo dir>/dircolors-solarized/dircolors.256dark
    etc                   -> <repo dir>/etc
    .gitconfig            -> <repo dir>/.gitconfig
    .hgrc                 -> <repo dir>/.hgrc
    .plan                 -> <repo dir>/.plan
    .pystartup            -> <repo dir>/.pystartup
    .screenrc             -> <repo dir>/.screenrc
    .vim                  -> <repo dir>/.vim
    .vimrc                -> <repo dir>/.vimrc
    .zsh                  -> <repo dir>/.zsh
    .zshrc                -> <repo dir>/.zshrc

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
4. Delete the now untracked submodule directory.
5. Commit the "superproject" (modified <code>.gitmodules</code> file and deleted submodule directory).
6. Remove the submodule cache from <code>.git/modules/</code>. Example:
   <code>rm -rf .git/modules/.vim/bundle/vim-cccs</code>. Otherwise, it does not seem possible to add a
   different submodule with the same name, to the same place.

For more details see the [Git submodule tutorial][11].

## Notes for usage on Windows ##
On Windows -- currently -- the only interesting thing here is the Vim configuration, settings.

Add Python directories to System Path: Computer -> Right-click -> Properties -> Advanced System
settings -> Advanced (in System Properties) -> Environment variables -> System variables -> Path.

    Path = ...;C:\Python27;C:\Python27\Scripts;C:\Python27\Lib\site-packages

Add some Unix-like utilities from Git install path:

    Path = ...;C:\Program Files (x86)\Git\bin

### How to install syntax checkers for Python (used by Syntastic) ###
I assume Python (2.7) is already installed. Download and execute [distribute_setup.py][12],
then install [pip][13] with the following command:

    easy_install pip

After having pip, it is easy to install the Python syntax checkers. Namely

    pip install -U flake8 frosted isort mccabe py3kwarn pycodestyle pydocstyle pyflakes pylama pylint

Note: [flake8][14] installs [pycodestyle][15], [pyflakes][16] and [mccabe][17]. [Pylama][18] is a wrapper
around pycodestyle, [pydocstyle][19], pyflakes, pylint, maccabe, and isort. Pylama seems to be a better alternative
compared to flake8.

## Troubleshooting ##
### Cannot clone/sync with Git on Windows ###
Make sure, you have the correct proxy settings in the shell, where the git commands are invoked.
(There are no quotes around &lt;your proxy:port&gt;)

    set http_proxy=<your proxy:port>
    set https_proxy=<your proxy:port>

Check whether you are using Symantec Endpoint Protection. If so, the you may want to change
Client Management settings: Current location to "Out of ... premises".

### After deleting a submodule and adding back another with the same name, Git gets confused ###
See step 6. in Deleting a submodule section above.

### error: SSL certificate problem, verify that the CA cert is OK. ###
Error during the pull of YouCompleteMe:

    Entering '.vim/bundle/YouCompleteMe/python/ycm/completers/python/jedi'
    error: SSL certificate problem, verify that the CA cert is OK. Details:
    error:14090086:SSL routines:SSL3_GET_SERVER_CERTIFICATE:certificate verify failed while accessing https://github.com/davidhalter/jedi.git/info/refs?service=git-upload-pack
    fatal: HTTP request failed
    Stopping at 'python/ycm/completers/python/jedi'; script returned non-zero status.
    Stopping at '.vim/bundle/YouCompleteMe'; script returned non-zero status.

Solution (workaround 1): Edit below files, to contain the git protocol and not https for Jedi.

    .git/modules/.vim/bundle/YouCompleteMe/modules/python/ycm/completers/python/jedi/config
    .vim/bundle/YouCompleteMe/.gitmodules

Solution (workaround 2):

    env GIT_SSL_NO_VERIFY=true git submodule foreach --recursive git pull

## Troubleshooting (obsolete) ##
Following troubles are obsolete, since my way of use has changed.

### Alt-Left/Alt-Right do not switch between GNU screen windows using from PuTTY ###
Use default PuTTY config options, except for Terminal -> Features -> Disable application cursor keys mode.
Its default setting is off, and it must be turned on.

### Vim key bindings do not work as expected using from PuTTY ###
See above.

### You are not currently on a branch... ###
Sometimes git pull cannot succeed. Example:

    Stopping at 'zsh'; script returned non-zero status.
    > cd zsh
    > git branch
    * (no branch)
      master
    > git checkout master
See above "Cloning, updating a submodule".

### warning: templates not found /some/path/git-core/templates ###
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
[12]: http://python-distribute.org/distribute_setup.py "distribute_setup.py"
[13]: https://pypi.python.org/pypi/pip "pip"
[14]: https://pypi.python.org/pypi/flake8 "flake8"
[15]: https://pypi.python.org/pypi/pycodestyle "pycodestyle"
[16]: https://pypi.python.org/pypi/pyflakes "pyflakes"
[17]: https://pypi.python.org/pypi/mccabe "mccabe"
[18]: https://pypi.python.org/pypi/pylama "pylama"
[19]: https://pypi.python.org/pypi/pydocstyle "pydocstyle"
[20]: https://github.com/seebi/dircolors-solarized "dircolors-solarized"
