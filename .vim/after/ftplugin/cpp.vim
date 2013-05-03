" echo current function
map <Leader>f :se lz<CR>:sp<CR>mx[[?^\i<CR>yt(`x:q<CR>:se nolz<CR>:echo "Function: " . @"<CR>
