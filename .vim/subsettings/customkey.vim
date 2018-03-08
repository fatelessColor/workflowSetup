" vimrc settings
nmap <F1> :NERDTree ~/.vim/<CR>
nnoremap <F2> :bprevious<CR>
nnoremap <F3> :bnext<CR>
nnoremap <F4> :bd<CR>
command! REF :so $MYVIMRC

" arrow keys
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

"activate mouse
set mouse=a

"NERDTree
nmap <F7> :NERDTreeToggle<CR>

"tagbar
nmap <F8> :TagbarToggle<CR>

" marker
nnoremap <Tab><Tab> /(<!!>)<enter>j
imap <C-o> (<!!>)

" multimarker
nnoremap <Tab><space> :MultipleCursorsFind<Space>(<++>)<Enter>c
imap <C-p> (<++>)

" filler
nnoremap <space><space> /(!!!)<enter>5xi

" smooth scrolling
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
nmap <silent> <C-j> :call comfortable_motion#flick(80)<CR>
nmap <silent> <C-k>   :call comfortable_motion#flick(-80)<CR>
let g:comfortable_motion_friction = 0.0
let g:comfortable_motion_air_drag = 4.0


map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)

"map z/ <Plug>(incsearch-fuzzyspell-/)
"map z? <Plug>(incsearch-fuzzyspell-?)
"map zg/ <Plug>(incsearch-fuzzyspell-stay)

