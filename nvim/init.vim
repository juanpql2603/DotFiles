"""""""""""""""""""""""""""""""""""
"             Plugins             "
"""""""""""""""""""""""""""""""""""

call plug#begin()
  " Tema del editor 
  Plug 'morhetz/gruvbox'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  
  " Utidades del editor
  Plug 'moll/vim-bbye' "Me permiter cerrar Buffer
  Plug 'voldikss/vim-floaterm' "Me permite ejecutar terminales flotantes dentro del editor

  " Explorador de archivos
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'dylanaraps/fff.vim'
  
  " Autocompletar Codigo
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'alvan/vim-closetag'
  
  " Snippets { html, css, javascript, python}
  Plug 'honza/vim-snippets'
  Plug 'SirVer/ultisnips' 
  
  " Detector de errores
  Plug 'neomake/neomake'
  
  " Colemak keybinding
  Plug 'jooize/vim-colemak'
  


call plug#end()

"""""""""""""""""""""""""""""""""""""
"     Configuracion del editor      "
"""""""""""""""""""""""""""""""""""""
set encoding=UTF-8
set title  " Muestra el nombre del archivo en la ventana de la terminal
set number  " Muestra los números de las líneas
set mouse=a  " Permite la integración del mouse (seleccionar texto, mover el cursor)

set nowrap  " No dividir la línea si es muy larga

set cursorline  " Resalta la línea actual
set colorcolumn=120  " Muestra la columna límite a 120 caracteres

" Indentación a 2 espacios
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab  " Insertar espacios en lugar de <Tab>s

set hidden  " Permitir cambiar de buffers sin tener que guardarlos

set ignorecase  " Ignorar mayúsculas al hacer una búsqueda
set smartcase  " No ignorar mayúsculas si la palabra a buscar contiene mayúsculas

set spelllang=en,es  " Corregir palabras usando diccionarios en inglés y español

set termguicolors  " Activa true colors en la terminal

""""""""""""""""""""""""""""""""
" configuracion de los plugins "
""""""""""""""""""""""""""""""""

" GruvBox
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox  " Nombre del tema

" Vim Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline_powerline_fonts = 1

" NERDTree
" Permite Salir de vim automaticamente si se cierra el ultimo buffer
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Este comando no deja que otros buffer reemplacen a NERDTree
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

"NeoMake
call neomake#configure#automake('nrwi', 500) "Llama a neomake al escribir o leer un búfer, y sobre los cambios en la inserción y modo normal (después de 500 ms; sin demora al escribir).

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
" list all snippets for current filetype
let g:UltiSnipsListSnippets="<c-l>"

"""""""""""""""""""""""""""""""""""
"        Atajos de teclado        "
"""""""""""""""""""""""""""""""""""
let g:mapleader = ' '

noremap <leader>s :w!<CR>
noremap <leader>q :q!<CR>

noremap <leader>w :Bdelete<CR>

noremap <leader>n :bnext<CR>
noremap <leader>t :bprevious<CR>

noremap <leader>no :NERDTree<CR>
noremap <leader>nt :NERDTreeToggle<CR>

nnoremap <leader>f :FloatermNew fff<CR>

" Usa <c-space> para mostar el autocompletado.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Navegar entre codigo.
nmap <leader>cd <Plug>(coc-definition)
nmap <leader>ct <Plug>(coc-type-definition)
nmap <leader>cs <Plug>(coc-implementation)
nmap <leader>cr <Plug>(coc-references)

