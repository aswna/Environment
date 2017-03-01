function! FlashCursorLine()
  for i in [1, 2, 3]
    let l:sleep_time = 200 / l:i
    let time_to_sleep = l:sleep_time . " m"
    set cursorline
    redraw
    execute "sleep ".l:time_to_sleep
    set nocursorline
    redraw
    execute "sleep ".l:time_to_sleep
  endfor
endfunction
