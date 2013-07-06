" A statusbar function, that provides a visual scrollbar (based on the courtesy of A. Politz)
func! MyStatusLine()
  let my_statusline = "%<" . expand("%:p") . "\ %h%w%m%r%y\ [%{&ff}]\ " . '[%{(&fenc==""?&enc:&fenc)}] '
  let my_statusline = my_statusline . "%="
  let my_statusline = my_statusline . "%#warningmsg#"
  let my_statusline = my_statusline . "%{SyntasticStatuslineFlag()}"
  let my_statusline = my_statusline . "%*"
  let my_statusline = my_statusline . "\ C:%c%V\ L:%l/%L\ (%p%%)\ "

  let bar_width = 10

  if line('$') > 1
    let progress = (line('.') - 1) * (bar_width - 1) / (line('$') - 1)
  else
    let progress = bar_width/2
  endif

  let bar = ' [%1*%' . bar_width . '.' . bar_width . '(' . repeat('-', progress) .'%2*|%1*' . repeat('-', bar_width - progress - 1) . '%0*%)%<]'

  return my_statusline.bar
endfun
