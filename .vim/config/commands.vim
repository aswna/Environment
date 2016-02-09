" Try to reset settings after vimdiff.
command! -nargs=0 Q q|diffoff|set nowrap

" Some "aliases".
command! -nargs=0 QA qa
command! -nargs=0 Qa qa
command! -nargs=0 WQA wqa
command! -nargs=0 WQa wqa
command! -nargs=0 Wqa wqa
command! -nargs=0 Wq wq
command! -nargs=0 W w

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made since the last save.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | 0r # | Gdd | diffthis | wincmd p | diffthis | wincmd p
endif

command! -range -nargs=0 -bar JsonTool <line1>,<line2>!python -m json.tool
