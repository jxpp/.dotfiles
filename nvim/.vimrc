set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Este maneja git, dejando hacer operaciones desde vim con sentencias como :gp
" para git push, :gc para git commit y así.
Plugin 'tpope/vim-fugitive'

" Para manejar `surroundings`, e.g.: comillas dobles/simples, corchetes
" paréntesis, etc.
Plugin 'tpope/vim-surround'

" Para una barra de status en la parte de abajo: indica coding, tipo de
" fichero, número de línea y modo de vim en el que te encuentras. Puedes
" personalizarlo para que ponga lo que quieras.
" Plugin 'itchyny/lightline.vim'
" Plugin 'powerline/powerline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Autocompletador. Vas escribiendo y te muestra opciones. Reconoce
" automáticamente términos de otros ficheros que estén en la misma estructura
" de directorio y si tienen documentación te la muestra directamente en una
" ventana aparte
Plugin 'Shougo/deoplete.nvim'
Plugin 'davidhalter/jedi-vim'
Plugin 'deoplete-plugins/deoplete-jedi'

" Para autocrear html y css. Magia negra.
Plugin 'mattn/emmet-vim'

" FZF
Plugin 'junegunn/fzf.vim'

" Snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" Emojis
Plugin 'junegunn/vim-emoji'

" For writing
Plugin 'reedes/vim-pencil'
Plugin 'junegunn/goyo.vim'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on


" Muestra syntax highlighting por defecto
syntax on

" Codificación utf-8 por defecto
set encoding=utf-8

" Por defecto usa 4 espacios como indentación. (Esta línea es bastante más
" complicada que eso, te recomiendo revises la wiki de vim para ver qué hace
" cada cosa exactamente.
set expandtab tabstop=4 softtabstop=0 shiftwidth=4

" Cambia la tecla <Leader> que permite hacer combinaciones de teclas chachis
let mapleader = " "

" Le pone un fondo diferente a las líneas que se pasen de 80 caracteres, el
" estándar de columnas de terminal.
"highlight ColorColumn ctermbg=1
"call matchadd('ColorColumn', '\%81v', 1)

" Pone la prioridad de borrar: primero borra indentación si la hay, después
" saltos de línea. Esto impide que borrar un indentación autoinsertada en una
" línea vacía te borre la línea entera.
set backspace=indent,eol,start

" Muestra el resultado de los comandos ejecutados y muestra números de línea a
" la izquierda.
set ruler

" Cuando buscas un término (con `/`) te va buscando mientras escribes.
set incsearch

" Cuando haces una búsqueda señala todas las encontradas. Una vez hagas la
" búsqueda puedes ir a la siguiente con n y a la anterior con shift+n
set hlsearch

" Permite usar el ratón para situar el cursos y elegir visualmente código.
" (¡Ojo! Todavía aplican los shortcuts de vim para copiar y pegar).
set mouse=a

" Configuración extra para el plugin YCM específica para Python. Si quieres te
" paso el fichero de configuración para esto.
let g:ycm_python_binary_path = "python"
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion  = ['<c-j>']
let g:ycm_key_list_previous_completion  = ['<c-r>']

" Estas dos líneas son para permitir a vim usar más colores. Hace que si usas
" un tema para tu terminal que use colores de 256 bits se vean correctamente en
" Vim.
" set term=screen-256color
" set t_Co=256
" Situa los splits al revés de como abren normalmente. Esto es: los splits
" verticales hacia la derecha y los horizontales hacia abajo.
set splitbelow
set splitright

" Hace unas pequeñas optimizaciones en la elección de color si utilizas fondos
" de terminal oscuros
set background=light

" No hará autoindentaciones. Pura preferencia personal y salva mucho tiempo en
" Python.
set nosmartindent

" Lightline necessary config
set laststatus=2
set noshowmode

" En los formatos especificados solo usar dos espacios como indentación.
autocmd FileType html,htmldjango,css,scss,markdown,c,cpp,json,yaml,javascript setlocal shiftwidth=2 tabstop=2 sts=2

" Solo usa en emmet en los formatos especificados.
let g:user_emmet_install_global = 0
autocmd FileType html,htmldjango,css,scss,markdown EmmetInstall

" Opciones para tomar apuntes. En ciertos formatos automáticamente cambiará de
" línea al llegar a las 80 columnas de texto. De resto permitirá ajustar texto
" a 80 columnas mediante el shortcut gq.
" Ejemplos: gqq ajusta la línea en la que estás, gqip ajusta el párrafo en el
" que estás y gggqG ajusta a 80 columnas todo el documento actual (gg=ir al
" principio, gq=ajustar columnas, G=hasta el final del documento).
set tw=79 wm=0

" Hace que la barrita del split vertical sea de un color plano.
set fillchars+=vert:│
hi VertSplit cterm=NONE ctermbg=NONE ctermfg=16

" Utilizar por defecto expresiones regulares extendidas
set magic

" Permite a vim utilizar toda la subestructura de ficheros para hacer
" recomendaciones
set path+=**

" Muestra todas las opciones para autocompletar
set wildmenu

set rtp+=~/.fzf

nnoremap <leader>f :Files<cr>
nnoremap <leader>g :GFiles<cr>

nnoremap <F5> :!make run<cr>

set tags=.tags

" Lo siguiente es para syntastic, un correcto de sintaxis. Estas opciones son
" todas muy buenas si lo usas. Cada vez que guardas un fichero te muestra
" errores de sintáxis.
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_checkers_args = '-c ~/.config/flake8'
let g:syntastic_enable_balloons = 1
let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": [],
    \ "passive_filetypes": [] }
nnoremap <leader>s :SyntasticCheck<CR>

"set cursorline
nnoremap <Leader>c :set cursorline! <CR>
"hi CursorLine cterm=inverse ctermbg=NONE ctermfg=NONE guibg=darkred guifg=white

nnoremap <Leader>h :noh <CR>

inoremap <C-s> <Esc>:w<CR>a

nnoremap ; :
nnoremap : ;

nnoremap <S-h> ^
nnoremap <S-l> $

hi Search cterm=NONE ctermfg=16 ctermbg=lightmagenta

command! -range Emojify <line1>,<line2>s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g

nnoremap <leader>ee :%Emojify<CR>

highlight todoGroup ctermfg=15 ctermbg=red
match todoGroup /TODO:.*:.*:(.*):\?/

nnoremap <leader>a :Ag<CR>

let g:jedi#show_call_signatures = 2
let g:jedi#use_splits_not_buffers = 'winwidth'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = 'n'
let g:airline_symbols.space = "\ua0"
let g:airline_symbols.space = " "

let g:airline#extensions#tmuxline#enabled = 0
let g:airline_theme = 'fruit_punch'

" Shift+TAB te lleva a final de línea en modo insertar
inoremap <S-Tab> <ESC>:normal A<CR>

let g:netrw_liststyle = 3

" Remap the enter key to select current option in completion popup
inoremap <expr> <CR> pumvisible() ? '<C-y>' : '<CR>'

function! s:goyo_enter()
    set noshowmode
    set noshowcmd
    set scrolloff=999
    set laststatus=0
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()

set fo-=t

set relativenumber
highlight LineNr ctermfg=lightgrey
set numberwidth=3

hi Visual ctermfg=black ctermbg=white

let g:python3_host_prog = '/home/jesus/.config/nvim/.venv/bin/python'

let g:deoplete#enable_at_startup = 1

hi Pmenu ctermfg=black ctermbg=white
hi PmenuSel ctermfg=black ctermbg=darkgrey
