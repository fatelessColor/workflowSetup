let g:tex_flavor = "latex"

function! FindTemplate()
    let g:curr_filetype = ''
    if &filetype == ''
        let g:curr_filetype = 'none'
    else
        let g:curr_filetype = &filetype
    endif
    echom 'filetype: ' . g:curr_filetype


    let g:template_path = '~/Templates/'. g:curr_filetype . '/' . input('template: ') . '.' . g:curr_filetype
    if filereadable(expand(g:template_path))
        exe ":normal :r " . g:template_path . "\<CR>"
    
        echom 'path: "' . g:template_path . '"'
    else
        echom ': ERROR: Template does not exist!'
    endif
endfunction

command! Template :call FindTemplate()<CR>


