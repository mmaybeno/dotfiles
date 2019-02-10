" Random things I may forget about vim settings:
" <Leader> most cases is '\'
" Fuzzy text file search uses <leader>t
" 	Also make sure to run `rake make` in command-t
" NERD tree uses Command+T (note the capital)
" Make sure to create a symlink to the .vimrc file since most
" OSs use $HOME/.vimrc as the main source file. So make sure to
" `ln -s $HOME/.vim/.vimrc $HOME/.vimrc`

" Git integration
" Main commands are:
" Gblame: line by line comparison
" Gwrite: stages file, ie git add <file>
" Gread: git checkout <file>
" Gcommit: commits file

" For Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-git'
Plugin 'wincent/Command-T'
Plugin 'mileszs/ack.vim'
Plugin 'sjl/gundo.vim'
Plugin 'fs111/pydoc.vim'
Plugin 'vim-scripts/pep8'
Plugin 'janko-m/vim-test'
Plugin 'reinh/vim-makegreen'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'vim-scripts/The-NERD-tree'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-airline'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'kien/ctrlp.vim'
Plugin 'fatih/vim-go'
Plugin 'dikiaap/minimalist'
Plugin 'w0rp/ale'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'christoomey/vim-tmux-navigator'

" All of your Plugins must be added before the following line
call vundle#end()            " required
syntax on                    " syntax highlighing
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Set 256 colors
set t_Co=256
colorscheme minimalist

" Tabs and spaces
" 1 tab == 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set backspace=2

" No screen wrapping
set nowrap

" Various other customizations
set number
set noshowmode
set splitright

" Mappings to access buffers (don't use "\p" because a
" " delay before pressing "p" would accidentally paste).
" " \l       : list buffers
" " \b \f \g : go back/forward/last-used
" " \1 \2 \3 : go to buffer 1/2/3 etc
" " :bn|:bd : delete buffer currently on without removing window
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>bd :bn<bar>:bd#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" Execute python
" nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
nnoremap <silent> <F9> :AsyncRun! time python %<CR>

" F4 toggles highlight
let hlstate=0
nnoremap <F4> :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<cr>

" F5 to remove trailing whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Status line additions:
set statusline=%{fugitive#statusline()}    " Git integration

" Code folding
set foldmethod=indent
set foldlevel=99

" Window splitting
" Vertical Split : Ctrl+w + v
" Horizontal Split: Ctrl+w + s
" Close current windows: Ctrl+w + q

" Allows using Ctrl+movement to move around windows
" map <c-j> <c-w>j
" map <c-k> <c-w>k
" map <c-l> <c-w>l
" map <c-h> <c-w>h

" Task lists
" use <leader>td to open and q to close
map <leader>td <Plug>TaskList

" Revision History - Gundo
map <leader>gt :GundoToggle<CR>

" Syntastic variables
let g:syntastic_python_checkers = ['flake8']

" Check Pep8 validation
let g:pep8_map='<leader>p8'

" Tab Completion and Documentation
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1


" Enable menu and pydoc preview
" use <leader>pw to access
set completeopt=menuone,longest,preview

" NERD Tree
map <C-n> :NERDTreeToggle<CR>

" Ack searching
nmap <leader>a <Esc>:Ack!

" python vim.test
au FileType python let test#python#runner = 'pytest'
au FileType python let test#python#nose#options= '-s --nologcapture'
au FileType python nmap <silent> <leader>t :TestNearest<CR>
au FileType python nmap <silent> <leader>T :TestFile<CR>
au FileType python nmap <silent> <leader>a :TestSuite<CR>
au FileType python nmap <silent> <leader>tl :TestLast<CR>
au FileType python nmap <silent> <leader>g :TestVisit<CR>

" go mappings
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" To get UltiSnips and YCM to work
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"" Ultisnips directory for snippets
let g:UltiSnipsSnippetDirectories=["UltiSnips","mysnippets"]
let g:ultisnips_python_style="sphinx"
let g:ultisnips_python_quoting_style="double"

" Airline configs
let g:airline#extensions#Syntastic#enabled=1
let g:airline#extensions#virtualenv#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#branch#displayed_head_limit=10
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])

" Airline theme
let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Ale lint checker customization
let g:ale_sign_column_always = 1

set laststatus=2

" tmux save on vim leave
let g:tmux_navigator_save_on_switch = 2

" tmux nav
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-w>h :TmuxNavigateLeft<cr>
nnoremap <silent> <c-w>j :TmuxNavigateDown<cr>
nnoremap <silent> <c-w>k :TmuxNavigateUp<cr>
nnoremap <silent> <c-w>l :TmuxNavigateRight<cr>
nnoremap <silent> <c-w>w :TmuxNavigatePrevious<cr>

" Quickfix window toggle
augroup vimrc
    autocmd QuickFixCmdPost * botright copen 8
augroup END
:noremap <F10> :call asyncrun#quickfix_toggle(8)<cr>

" Python 3 for YCM
let g:ycm_python_binary_path = 'python3'

" Virtualenv special sauce to allow recongizing libraries
" Add the virtualenv's site-packages to vim path
if has("python3")
    command! -nargs=1 Py py3 <args>
    silent! python3 1
else
    command! -nargs=1 Py py <args>
endif
Py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    exec(compile(open(activate_this, "rb").read(), activate_this, 'exec'), dict(__file__=activate_this))
EOF
