"=======================================================================================================================
" HIGHLIGHT_WORD_UNDER_CURSOR:
"=======================================================================================================================

let w:m1 = 0
function! HighlightWordUnderCursor()
    if(exists('w:m1') && w:m1 > 0)
        silent! call matchdelete(w:m1)
        let w:m1 = 0
    endif
    let l:currentword = escape(expand('<cword>'), '.')
    if(strlen(l:currentword) > 0)
        let w:m1=100

        " match rgba...
        let l:q = matchstr(expand('<cword>'), '\x\{8\}')
        if(l:q == "") " without alpha
            let l:q = matchstr(expand('<cword>'), '\x\{6\}')
            let l:a = 255
        else " with alpha...
            let l:a = str2nr(strpart(l:q, 6, 2), 16)
        endif

        if(l:q != "")
            let l:r = str2nr(strpart(l:q, 0, 2), 16) * (l:a / 255.0)
            let l:g = str2nr(strpart(l:q, 2, 2), 16) * (l:a / 255.0)
            let l:b = str2nr(strpart(l:q, 4, 2), 16) * (l:a / 255.0)
            let l:color =
                        \ printf('%02x', float2nr(l:r))
                        \ . printf('%02x', float2nr(l:g))
                        \ . printf('%02x', float2nr(l:b))
                        \ . printf('%02x', float2nr(l:a))

            let l:brightness = (l:r / 3) + (l:g / 1) + (l:b / 8)

            " echo 'q:'. l:q . ' r:' . l:r . ' g:' . l:g . ' b:' . l:b . ' a:' . l:a . ' / ' . 
            "            \ (str2nr(l:a, 16) / 255.0) . ' brightness: ' . l:brightness . ' / color:' . l:color

            if(l:brightness > 240)
                exec 'highlight! ' . l:color . ' guibg=#' . strpart(l:color, 0, 6) . ' guifg=#000000'
            else
                exec 'highlight! ' . l:color . ' guibg=#' . strpart(l:color, 0, 6) . ' guifg=#ffffff'
            endif

            exec 'syntax clear ' . l:color
            exec 'syntax match ' . l:color . ' /\#' . l:q . '/'
        else
            silent! call matchadd('Underline', '\<'.l:currentword.'\>', -1, w:m1)
        endif
    endif
endfunction

" set updatetime=100
highlight! Underline cterm=underline gui=underline
autocmd CursorMoved,InsertLeave,TextChanged * call HighlightWordUnderCursor()

" vim: expandtab tabstop=4 sw=4
