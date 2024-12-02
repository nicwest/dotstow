function! s:do() abort
    set ft=python
    normal ggddVgq
    diffthis
    new
    set ft=python
    normal pVgq
    diffthis
endfunction

command! Pydiff call s:do()
