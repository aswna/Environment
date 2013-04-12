" Number of command-lines to be remembered.
set history=20000

" Write the contents of the file, if it has been modified, in case of several
" commands, buffer changes.
set autowriteall

let s:my_tmp_dir = $HOME . "/tmp"
let s:my_tmp_vim_dir = s:my_tmp_dir . "/vim"
let s:my_tmp_vim_ccview_dir = s:my_tmp_vim_dir
if IsEnvVarSet($CCVIEW)
  let s:my_tmp_vim_ccview_dir = s:my_tmp_vim_ccview_dir . "/" . $CCVIEW
endif
if !isdirectory(s:my_tmp_vim_ccview_dir)
  if exists("*mkdir")
    echom "Creating tmp vim (ccview = " . $CCVIEW . ") dir: " . s:my_tmp_vim_ccview_dir
    call mkdir(s:my_tmp_vim_ccview_dir, "p")
  endif
endif

" For Unix and Win32, if a directory ends in two path separators "//"
" or "\\", the swap file name will be built from the complete path
" to the file with all path separators substituted to percent '%' signs.
" This will ensure file name uniqueness in the preserve directory.
let s:base_backup_directory=s:my_tmp_vim_dir . "//"
let s:base_backup_directory=s:base_backup_directory . "," . s:my_tmp_dir . "//"
let s:base_backup_directory=s:base_backup_directory . "," . "/var/tmp"   . "//"
let s:base_backup_directory=s:base_backup_directory . "," . "/tmp"       . "//"

" List of directories for the swap files.
let &directory=s:my_tmp_vim_ccview_dir . "//," . s:base_backup_directory

" List of directories for the backup files.
let &backupdir=&directory

" Create backups.
set backup

if has("persistent_undo")
    " List of directories for the undo files.
    let &undodir=&directory
    set undofile
endif

augroup SetPersistencyDirAccordingToFileLocation
  au!
  autocmd BufEnter * call SetPersistencyDirs()

  function! SetPersistencyDirs()
    if (match(expand("%:p"), "^/vobs/") == 0)
      let &directory=s:my_tmp_vim_ccview_dir . "//," . s:base_backup_directory
    else
      let &directory=s:base_backup_directory
    endif
    let &backupdir=&directory
    if has("persistent_undo")
      let &undodir=&directory
    endif
  endfunction
augroup END
