let g:rgbActive = 'false'

function! LiveRGB()
    "execute '!./.screenlayout/wallpaper.sh 0 &'
    if (g:rgbActive == 'true')
        execute '!nohup /home/cubey/.screenlayout/wallpaper.sh 0 > /dev/null 2>&1 &'
        :silent !clear
    endif
endfunction

function! ToggleRGB()
    if (g:rgbActive == 'true')
        :unmap! <Space>
        let g:rgbActive = 'false'
    else
        let g:rgbActive = 'true'
        :inoremap <silent> <Space> <Esc>:call LiveRGB()<CR>a<Space>
    endif
endfunction

command! RGB  call ToggleRGB()

