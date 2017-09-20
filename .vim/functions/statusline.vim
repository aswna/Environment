let s:PROGRESS_BARS = ['█', '▇', '▆', '▅', '▄', '▃', '▂', '▁', ' ']
let s:PROGRESS_BARS_LEN_M_1 = len(s:PROGRESS_BARS) - 1

" A statusbar function, that provides a visual scrollbar (based on the courtesy of A. Politz)
func! MyStatusLine()
  let my_statusline = "%<" . expand("%:p") . " %m%r%w%h%q%y[%{&ff}]" . '[%{(&fenc==""?&enc:&fenc)}] '
  let my_statusline = my_statusline . "%="
  let my_statusline = my_statusline . "%#warningmsg#"
  let my_statusline = my_statusline . "%{SyntasticStatuslineFlag()}"
  let my_statusline = my_statusline . "%*"
  let my_statusline = my_statusline . "V:%b[0x%B]"
  let my_statusline = my_statusline . "\ C:%c%V\ L:%l/%L\ [%o] (%p%%)"

  let i = s:PROGRESS_BARS_LEN_M_1
  if line('$') > 1
    let i = (line('.') - 1) * s:PROGRESS_BARS_LEN_M_1 / (line('$') - 1)
  endif
  let progress = s:PROGRESS_BARS[i]

  let bar = '|' . progress . '|'

  return my_statusline . bar
endfun
