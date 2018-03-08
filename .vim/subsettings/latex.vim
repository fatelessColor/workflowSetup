filetype plugin on
autocmd FileType tex inoremap ;be \begin{DELRN}<Enter>(!!!) <Enter>\end{DELRN}<Enter>(!!!)<Esc>3k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
autocmd FileType tex inoremap ;sec \section
autocmd FileType tex inoremap ;ssec \subsection
autocmd FileType tex inoremap ;sssec \subsubsection

autocmd FileType tex inoremap ;un \underline{}(!!!) <Esc>6hi
autocmd FileType tex inoremap ;ov \overline{}(!!!) <Esc>6hi
autocmd FileType tex inoremap ;it \textit{}(!!!) <Esc>6hi
autocmd FileType tex inoremap ;bf \textbf{}(!!!) <Esc>6hi
autocmd FileType tex inoremap ;te \text{}(!!!) <Esc>6hi
autocmd FileType tex inoremap ;im <Esc>:call ScreenshotInfuser()<CR>
autocmd FileType tex inoremap ;fr \frac{}{(!!!)}(!!!) <Esc>13hi
autocmd FileType tex inoremap ;lim \lim \limits_{}(!!!) <Esc>6hi
autocmd FileType tex inoremap ;sum \sum \limits^{}_{(!!!)}(!!!) <Esc>14hi

autocmd FileType tex inoremap ;pl \begin{tikzpicture} <CR>\draw[->] (-DELRN,0) -- (DELRN,0) node[right] {$x$}; <CR>\draw[->] (0,-DELRN) -- (0,DELRN) node[above] {$y$}; <CR>\draw[scale=0.DELRN,domain=-DELRN:DELRN,smooth,variable=\x,black] plot ({\x},{(!!!)}); <CR>\end{tikzpicture} <CR>(!!!)<Esc>4k:MultipleCursorsFind<Space>DELRN<CR>c

"compile
autocmd FileType tex nmap <F9> :!pdflatex % <CR>:!pkill -HUP mupdf <CR>
autocmd FileType tex nmap <F12> :call MupdfTex() <CR>

autocmd FileType tex inoremap ;ta <Esc>:call TexTable()<CR>
autocmd FileType tex inoremap ;ar <Esc>:call TexArray()<CR>

function! MupdfTex()
    let g:tex2pdf = expand('%:t:r')
    let g:tex2pdf = g:tex2pdf . '.pdf'
    exe "silent !mupdf " . g:tex2pdf . " &"
    
endfunction


function! TexTable()
    let g:tex_c_column = 0
    let g:textableinput = input('Columns: ')
    "let g:textablesplit = split ("HELLO","\zs")
    "exe ":normal i" . "\\table{" . g:textablesplit[3] . "}"
    let g:tex_m_columns = strlen(substitute(g:textableinput, "[^l]", "","g"))
    let g:tex_m_columns += strlen(substitute(g:textableinput, "[^r]", "","g"))
    let g:tex_m_columns += strlen(substitute(g:textableinput, "[^c]", "","g"))

    exe ":normal i" . "\\begin{tabular}{" . g:textableinput . "}" . "\<CR>"
    exe ":normal i" . "\\end{tabular}\<CR>"
    exe ":normal 2ko"

    let g:textableloop = 'true'
    while (g:textableloop == 'true')
        let g:tex_c_column = 0
        exe ":normal i\<Tab>" . "[+]"
        let g:tex_c_column = g:tex_c_column + 1
        while (g:tex_c_column < g:tex_m_columns)
            exe ":normal A\<Tab>\<Tab>" . "&" . "\<Tab>" . "(+)"
            let g:tex_c_column = g:tex_c_column + 1
        endwhile

        exe ":normal 0"
        let g:tex_c_column = 0
        while (g:tex_c_column < g:tex_m_columns)
            exe ":normal /[+]\<CR>h"
            let g:textableinput = input(g:tex_c_column+1 . ': ')
            exe ":normal 3xi" . g:textableinput
            if (g:tex_c_column + 1 < g:tex_m_columns)
                exe ":normal /(+)3xi[+]<Esc>4h"
            endif
            let g:tex_c_column = g:tex_c_column + 1
        endwhile
        exe ":normal A\\\\"

        let g:textableinput = input('(e|l) ')
        if (g:textableinput == 'e')
            let g:textableloop = 'false'
        elseif (g:textableinput == 'l')
            exe ":normal o\\hline\<CR>"
        else
            exe ":normal o"
        endif
    endwhile
    exe ":normal 2ji"
endfunction


function! TexArray()
    let g:tex_c_column = 0
    let g:textableinput = input('Columns: ')
    "let g:textablesplit = split ("HELLO","\zs")
    "exe ":normal i" . "\\table{" . g:textablesplit[3] . "}"
    let g:tex_m_columns = strlen(substitute(g:textableinput, "[^l]", "","g"))
    let g:tex_m_columns += strlen(substitute(g:textableinput, "[^r]", "","g"))
    let g:tex_m_columns += strlen(substitute(g:textableinput, "[^c]", "","g"))

    exe ":normal i" . "\\begin{array}{" . g:textableinput . "}" . "\<CR>"
    exe ":normal i" . "\\end{array}\<CR>"
    exe ":normal 2ko"

    let g:textableloop = 'true'
    while (g:textableloop == 'true')
        let g:tex_c_column = 0
        exe ":normal i\<Tab>" . "[+]"
        let g:tex_c_column = g:tex_c_column + 1
        while (g:tex_c_column < g:tex_m_columns)
            exe ":normal A\<Tab>\<Tab>" . "&" . "\<Tab>" . "(+)"
            let g:tex_c_column = g:tex_c_column + 1
        endwhile

        exe ":normal 0"
        let g:tex_c_column = 0
        while (g:tex_c_column < g:tex_m_columns)
            exe ":normal /[+]\<CR>h"
            let g:textableinput = input(g:tex_c_column+1 . ': ')
            exe ":normal 3xi" . g:textableinput
            if (g:tex_c_column + 1 < g:tex_m_columns)
                exe ":normal /(+)3xi[+]<Esc>4h"
            endif
            let g:tex_c_column = g:tex_c_column + 1
        endwhile
        exe ":normal A\\\\"

        let g:textableinput = input('(e|l) ')
        if (g:textableinput == 'e')
            let g:textableloop = 'false'
        elseif (g:textableinput == 'l')
            exe ":normal o\\hline\<CR>"
        else
            exe ":normal o"
        endif
    endwhile
    exe ":normal 2ji"
endfunction

function! ScreenshotInfuser()
    let g:screenshotFilename = 'images/' . input('Image: ') . '.png'
    exe ":silent !ls ~/Pictures/screenshots/ -1 > ~/Pictures/screenshots/.ls.txt"
    exe ":silent !tail -n 1 ~/Pictures/screenshots/.ls.txt > ~/Pictures/screenshots/.last.txt"
    exe ":silent !mkdir images"
    exe ":silent !cp ~/Pictures/screenshots/$(cat ~/Pictures/screenshots/.last.txt) " . g:screenshotFilename
    exe ":silent normal i\\begin{center}\<CR>\\includegraphics[width=0.5\\linewidth]{" . g:screenshotFilename . "}\<CR>\\end{center}"
    exe ":!clear"
endfunction

autocmd BufEnter * set updatetime=800
"let g:livepreview_previewer = 'mupdf'




