"############################ colorscheme ####################
set background=dark
let g:pencil#conceallevel = 2     " 0=disable, 1=one char, 2=hide char, 3=hide all (def)
let g:pencil#autoformat = 1
let g:pencil_terminal_italics = 1
set number
syntax on
let g:solarized_termcolors=256
let g:solarized_termtrans = 0
let g:solarized_degrade = 0
let g:solarized_bold = 1
let g:solarized_underline = 1
let g:solarized_italic = 1
let g:solarized_contrast = "high"
let g:solarized_visibility= "high"
colorscheme solarized
let g:airline_theme='minimalist'
let g:current_theme = 'Main'
set relativenumber

"############################ themes #############################
function! ThemeMain()
    let g:current_theme = 'Main'

    "extras
    set relativenumber
    syntax on
    Goyo!
    PencilOff

    "colorschemes
    set background=dark
    let g:solarized_termcolors=256
    let g:solarized_termtrans = 0
    let g:solarized_degrade = 0
    let g:solarized_bold = 1
    let g:solarized_underline = 1
    let g:solarized_italic = 1
    let g:solarized_contrast = "high"
    let g:solarized_visibility= "high"
    colorscheme solarized
    let g:airline_theme='minimalist'
    AirlineRefresh
    ":edit
endfunction

function! ThemeTrans()
    let g:current_theme = 'Trans'

    "extras
    set nornu
    syntax off
    Goyo!
    PencilOff

    "colorschemes
    set background=dark
    colorscheme goodwolf
    let g:airline_theme='badwolf'
    AirlineRefresh
endfunction

function! ThemeWriter()
    let g:current_theme = 'Writer'

    "extras
    set nornu
    syntax on
    let g:pencil#autoformat = 0 
    let g:pencil_terminal_italics = 1
    Goyo!
    Goyo
    PencilSoft

    "colorschemes
    set background=light
    "let g:pencil_higher_contrast_ui = 1
    colorscheme pencil
    let g:airline_theme='pencil'
    "AirlineRefresh
endfunction

function! ThemeClean()
    let g:current_theme = 'Clean'

    "extras
    set nornu
    syntax on
    let g:pencil#autoformat = 0 
    let g:pencil_terminal_italics = 1
    Goyo!
    Goyo
    PencilSoft

    "colorschemes
    set background=dark
    colorscheme badwolf
    let g:airline_theme='badwolf'
    AirlineRefresh
endfunction

"############################# switch #################################
function! SwitchTheme1()
    if (g:current_theme != 'Main')
        call ThemeMain()
    else
        call ThemeTrans()
    endif
endfunction

function! SwitchTheme2()
    if (g:current_theme != 'Writer')
        call ThemeWriter()
    else
        call ThemeClean()
    endif
endfunction

command! Th1 call SwitchTheme1()
command! Th2 call SwitchTheme2()
nnoremap <F5> :call SwitchTheme1()<CR>
inoremap <F5> <ESC>:call SwitchTheme1()<CR>a
vnoremap <F5> <ESC>:call SwitchTheme1()<CR>
nnoremap <F6> :call SwitchTheme2()<CR>
inoremap <F6> <ESC>:call SwitchTheme2()<CR>a
vnoremap <F6> <ESC>:call SwitchTheme2()<CR>

"toggle number
function! NumberToggle()
    if(&relativenumber == 0)
        call NumberToggleRE()
        
    else
        call NumberToggleNO()
    endif
endfunc
function! NumberToggleRE()
    if(g:current_theme == 'Main')
        set relativenumber
    endif
endfunc
function! NumberToggleNO()
    if(g:current_theme == 'Main')
        set nornu
    endif
endfunc

:au FocusLost * :call NumberToggleNO()
:au FocusGained * :call NumberToggleRE()
autocmd InsertEnter * :call NumberToggleNO()
autocmd InsertLeave * :call NumberToggleRE()



"############################# airline ###################################
function! AirlineStandard()
    set laststatus=2
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1
    let g:airline_detect_paste=1
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    " airline symbols
    let g:airline_left_sep = ' '
    let g:airline_left_alt_sep = ' '
    let g:airline_right_sep = ' '
    let g:airline_right_alt_sep = ' '
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
endfunction
call AirlineStandard()


function! s:goyo_enter()
    if(g:current_theme == 'Main')
        let g:current_theme = 'Main2'
    endif
endfunction

function! s:goyo_leave()
    if(g:current_theme == 'Main2')
        call ThemeMain()
    endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


