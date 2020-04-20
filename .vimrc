call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'vim-syntastic/syntastic'
Plug 'eslint/eslint'
Plug 'pangloss/vim-javascript'

call plug#end()

set cursorline " подсветить активную строку
set noerrorbells " отключить звуковые уведомления
set novisualbell " отключить визуальные уведомления
set number " включить нумерацию строк
set expandtab " конвентировать табы в пробелы
set tabstop=2 " количество пробелов табуляции
set shiftwidth=2 " количество пробелов отступа
set autoindent " включить автоматический отступ
set fileformats=unix,dos,mac " формат переноса строк, который будет использоваться при четнии и записи файлов
set conceallevel=1
set backupcopy=yes " этот параметр требуется для корректной работы watch'еров, типа webpack
set wrap!
set foldenable
let g:mapleader='\'

" параметры поиска
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch


syntax on " включить подсветку синтаксиса


colorscheme PaperColor
let g:airline_theme='papercolor'

 " поддержка прозрачности фона для совместимости с прозрачностью терминала
hi Normal guibg=NONE ctermbg=NONE 


" маппинги
map <leader> <Plug>(esymotion-prefix)

" Настроки плагинов

""""""""""""""""
" vim-airline
""""""""""""""""
let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов
let g:airline#extensions#keymap#enabled = 0 "Не показывать текущий маппинг
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" "Кастомная графа положения курсора
let g:Powerline_symbols='unicode' "Поддержка unicode
let g:airline#extensions#xkblayout#enabled = 0

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

"unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''"

""""""""""""""""
" vim-javascript
""""""""""""""""
let g:javascript_plugin_jsdoc = 1


" подстветка quext как json
augroup qext_ft
   au!
   autocmd BufNewFile,BufRead *.qext   setlocal syntax=json
augroup END

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END


" сворачивание блоков vim
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END



""""""""""""""""
" syntastic
""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

""""""""""""""""
" ctrlp
""""""""""""""""
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

""""""""""""""""
" custom feature
""""""""""""""""

" переключение dark-light mode
" решение взято отсюда https://superuser.com/a/1246650
" скрипт xfce4-color-switch взят отсюда https://askubuntu.com/a/676452
function! NightMode_switch()
  if $VISUALMODE ==? 'dark'
    set background=dark
    "execute "silent !xfce4-color-switch base16-papercolor-dark.16"
    "execute "silent !tmux source-file " . shellescape(expand('~/.local/share/xfce4/terminal/colorschemes/base16-papercolor-dark.16.theme'))
  else
    set background=light
    "execute "silent !xfce4-color-switch base16-papercolor-light.16"
    "execute "silent !tmux source-file " . shellescape(expand('~/.local/share/xfce4/terminal/colorschemes/base16-papercolor-ligth.16.theme'))
  endif
endfunction

command! BSwitch call NightMode_switch()
call NightMode_switch()

