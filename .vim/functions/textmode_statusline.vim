" A statusbar function, that provides a visual scrollbar (based on the courtesy of A. Politz)
func! MyTextModeStatusLine()
  " Setting window width for TagList dynamically
  let g:Tlist_WinWidth = &columns / 4

  let my_statusline = "%<" . expand("%:p") . "\ %h%w%m%r%y\ [%{&ff}]\ " . '[%{(&fenc==""?&enc:&fenc)}] '
  let my_statusline = my_statusline . "%="
  let my_statusline = my_statusline . "%#warningmsg#"
  let my_statusline = my_statusline . "%{SyntasticStatuslineFlag()}"
  let my_statusline = my_statusline . "%*"
  let my_statusline = my_statusline . "\ C:%c%V\ L:%l/%L\ (%p%%)\ "

  let barWidth = 10 " &columns / 4 " / winnr("$")
  let barWidth = barWidth < 3 ? 3 : barWidth

  if line('$') > 1
    let progress = (line('.') - 1) * (barWidth - 1) / (line('$') - 1)
  else
    let progress = barWidth/2
  endif

  let bar = ' [%1*%' . barWidth . '.' . barWidth . '(' . repeat('-', progress) .'%2*|%1*' . repeat('-', barWidth - progress - 1) . '%0*%)%<]'

  return my_statusline.bar
endfun
