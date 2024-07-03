" check whether vim-plug is installed and install it if necessary

let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
"
"call plug#begin('~/.nvim/plugged')
call plug#begin('~/.config/nvim/plugged')
" Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile', 'for': ['js', 'javascript', 'jsx', 'tsx']}

Plug 'github/copilot.vim'
Plug '/home/danny/code/wsc_vim'
Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim'
" Plug 'xasopheno/WereSoCool_vim'
"
"
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'itchyny/lightline.vim'
" let g:lightline = {
      " \ 'colorscheme': 'one',
      " \ 'background': 'dark'
      " \ }
" Plug 'brooth/far.vim'
Plug 'folke/trouble.nvim'
Plug 'NoahTheDuke/vim-just'
" Plug 'tyru/eskk.vim'
Plug 'dingdean/wgsl.vim'
Plug 'chrisbra/csv.vim'
Plug 'kana/vim-smartinput'
Plug 'sheerun/vim-polyglot'
Plug 'jparise/vim-graphql'
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }
Plug 'tpope/vim-fugitive'
Plug 'alexdavid/vim-min-git-status'
Plug 'cespare/vim-toml'
Plug 'tikhomirov/vim-glsl'
Plug 'neovimhaskell/haskell-vim'
Plug 'hashivim/vim-terraform'
let g:terraform_fmt_on_save=1
let g:terraform_align=1
Plug 'nathanaelkane/vim-indent-guides'

" Format on save, if desired
"augroup fmt
  "autocmd!
  "autocmd BufWritePre * undojoin | Neoformat
"augroup END

" To Run Manually
nnoremap <leader>fm :Neoformat<CR>
autocmd Filetype gitcommit setlocal spell textwidth=72
"
"
"Plug 'davidhalter/jedi-vim' "python autocompletion
" Plug 'rust-lang/rust.vim', {'do': 'cargo install racer -f; rustup component add rls rust-analysis rust-src'}
Plug 'qnighy/lalrpop.vim'

Plug 'mbbill/undotree'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/nvim-treesitter-context'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'integralist/vim-mypy'
Plug 'rstacruz/vim-closer'
Plug 'machakann/vim-sandwich'

" Print function signatures in echo area
Plug 'Shougo/echodoc.vim'

" Icons
Plug 'ryanoasis/vim-devicons'

Plug 'jeetsukumaran/vim-buffergator'




" Remap keys for gotos
" h coc-nvim
" code-action
" show_documentationc
" ~/.config/nvim/after/ftplugin/typescript.vim
nmap <leader> cR <Plug>(coc-refactor)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction-line)
nmap <leader>af  <Plug>(coc-codeaction)

nmap <leader>al <Plug>(coc-codelens-action)
nmap <leader>qf <plug>(coc-fix-current)
nnoremap <leader>ef :CocCommand eslint.executeAutofix<cr>
nmap <leader>ev <plug>(coc-diagnostic-info)


" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit ad current position
nmap gC <Plug>(coc-git-commit)
" Find merge conflicts
nnoremap <leader>gmc /\v^[<=>\|]{7}.*$<CR>
"git diff
nnoremap <leader>gd :Gdiff<CR>
nnoremap git :Git<Space>
nnoremap <leader>gs :Gministatus<CR>:wincmd K<CR>
nnoremap <leader>gc :Git commit<CR>:set spell<CR><C-W>Ki
nnoremap <leader>ff :Rg<Space>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" inoremap <silent><expr> <Tab>
      " \ pumvisible() ? "\<C-n>" :
      " \ <SID>check_back_space() ? "\<Tab>" :
      " \ coc#refresh()

" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" COC
set cmdheight=2                                 " Better display for messages
set updatetime=300                              " Smaller updatetime for CursorHold & CursorHoldI
set shortmess+=c                                " don't give |ins-completion-menu| messages.
set signcolumn=yes                              " always show signcolumns
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')                   " Highlight symbol under cursor on CursorHold
" augroup mygroup
  " autocmd!
  " autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected') " Setup formatexpr specified filetype(s).
  " autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')     " Update signature help on jump placeholder
" augroup end
command! -nargs=0 Format :call CocAction('format')                             " Use `:Format` for format current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)                   " Use `:Fold` for fold current buffer


Plug 'pseewald/vim-anyfold'
Plug 'arecarn/vim-fold-cycle'
Plug 'sjl/gundo.vim'

" snippets
Plug 'honza/vim-snippets'

" enable ncm2 for all buffers
"autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

Plug 'roxma/nvim-yarp'
Plug 'majutsushi/tagbar'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdcommenter'
let g:NERDCustomDelimiters={
	\ 'javascript': { 'left': '// ', 'right': '', 'leftAlt': '{/* ', 'rightAlt': ' */}' },
\}
let NERDSpaceDelims=1
Plug 'justinmk/vim-sneak'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'nikvdp/ejs-syntax'
Plug 'jelera/vim-javascript-syntax'

" Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'

Plug 'HerringtonDarkholme/yats.vim'

Plug 'airblade/vim-gitgutter'
" Plug 'ap/vim-css-color'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
let g:Hexokinase_highlighters = ['backgroundfull']
Plug 'chrisbra/colorizer'
"Plug 'roxma/vim-paste-easy'

Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
"Plug 'mhartington/nvim-typescript', {'for': ['typescript', 'tsx'], 'do': './install.sh \| UpdateRemotePlugins' }
"Plug 'Shougo/deoplete.nvim'
Plug 'Vimjas/vim-python-pep8-indent'

" For Denite features
Plug 'Shougo/denite.nvim'

Plug 'christoomey/vim-tmux-navigator' 
" Plug 'tweekmonster/impsort.vim'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/seoul256.vim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'joshdick/onedark.vim'
Plug 'roryokane/detectindent'
Plug 'terryma/vim-multiple-cursors'

"let g:jedi#completions_enabled = 0
"let g:jedi#use_splits_not_buffers = "right"
",
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
let g:prettier#config#print_width = '70'
Plug 'rking/ag.vim'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git' 

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
let g:NERDTreeShowHidden = 1
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'Xuyuanp/nerdtree-git-plugin'
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>

" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go'
" let g:go_def_mapping_enabled = 0

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }

call plug#end()

" lua <<EOF
" require 'nvim-treesitter.configs'.setup {
  " ensure_installed = "maintained", -- "all", "maintained", or list of languages
  " highlight = {
    " enable = true,  -- false will disable the whole extension
    " disable = {},   -- list of languages that will be disabled
  " },
  " refactor = {
    " highlight_definitions = { enable = true },
    " highlight_current_scope = { enable = false },
  " },
" }
" EOF

filetype plugin indent on
syntax enable
syntax on

"autocmd Filetype * AnyFoldActivate

set termguicolors 
set incsearch
set hlsearch " highlight search results
set cindent
set textwidth=120
" set colorcolumn=100

set hidden
set backspace=indent,eol,start " make backspace behave in a sane manner
set clipboard=unnamed
set autoread

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif


if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options

if has('mouse')
    set mouse=a
endif

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

set magic " Set magic on, for regex

"shows when leader is set
set showcmd

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

set tabstop=2
set softtabstop=2
set expandtab 
set shiftwidth=2
set smarttab
set autoindent
set smartindent
set nowrap

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

map ' :NERDTreeToggle<CR>
map ; :FZF<CR>
map <leader>h :noh<CR>
" map re :Rg<Space>


nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1
" let g:airline_theme = 'violet'
" Support virtualenv
let g:pymode_virtualenv = 1
" enable 24 bit color support if supported
if (has("termguicolors"))
    if (!(has("nvim")))
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
    set termguicolors
endif

" turn hybrid line numbers on
" :set number relativenumber
" :set nu rnu

"if executable('rls')
    "au User lsp_setup call lsp#register_server({
        "\ 'name': 'rls',
        "\ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        "\ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        "\ 'whitelist': ['rust'],
        "\ })
"endif

" Appearance {{{
    set number " show line numbers
    set wrap " turn on line wrapping
    set wrapmargin=8 " wrap lines when coming within n characters from side
    set linebreak " set soft wrapping
    set showbreak=… " show ellipsis at breaking
    set autoindent " automatically set indent of new line
    set ttyfast " faster redrawing
    set diffopt+=vertical,iwhite,internal,algorithm:patience,hiddenoff
    set laststatus=2 " show the status line all the time
    set so=7 " set 7 lines to the cursors - when moving vertical
    set wildmenu " enhanced command line completion
    set hidden " current buffer can be put into background
    set showcmd " show incomplete commands
    set noshowmode " don't show which mode disabled for PowerLine
    set wildmode=list:longest " complete files like a shell
    set shell=$SHELL
    set cmdheight=1 " command bar height
    set title " set terminal title
    set showmatch " show matching braces
    set mat=2 " how many tenths of a second to blink

    " " code folding settings
    set encoding=utf8
    " " let g:airline_powerline_fonts = 1

" }}}

autocmd Filetype * AnyFoldActivate  
set foldlevel=99

let g:autofmt_autosave = 1
let g:seoul256_background = 233
set background=dark
" colo seoul256
colo gruvbox

" if (has("autocmd") && !has("gui_running"))
  " augroup colors
    " autocmd!
    " let s:background = { "gui": "#161616", "cterm": "255", "cterm16": "0" }
    " autocmd ColorScheme * call onedark#set_highlight("Normal", { "bg": s:background }) "No `fg` setting
  " augroup END
" endif
" set background=dark


" ESC shortcuts for insert mode
" inoremap jj <Esc>
" inoremap jk <Esc>
" inoremap kj <Esc>
noremap zxc :w<CR>
noremap qwe :wq<CR>
noremap fff :set foldlevel=0<CR>
noremap ffo :set foldlevel=99<CR>

" Run q macro
nmap <silent> <leader>q @q
vmap <silent> <leader>q :norm! @q<CR>
"noremap <silent> <C-[> :set foldlevel=0<CR>
"noremap <silent> <C-]> :set foldlevel=99<CR>


if has("persistent_undo")
    set undodir="~/.nvim/plugged/.undodir"
    set undofile
endif


" Wrap in try/catch to avoid errors on initial install before plugin is available
try
" === Denite setup ==="
" Use ripgrep for searching current directory for files
" By default, ripgrep will respect rules in .gitignore
"   --files: Print each file that would be searched (but don't search)
"   --glob:  Include or exclues files for searching that match the given glob
"            (aka ignore .git files)
"
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

" Use ripgrep in place of "grep"
call denite#custom#var('grep', 'command', ['rg'])

" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

" Open file commands
call denite#custom#map('insert,normal', "<C-t>", '<denite:do_action:tabopen>')
call denite#custom#map('insert,normal', "<C-v>", '<denite:do_action:vsplit>')
call denite#custom#map('insert,normal', "<C-h>", '<denite:do_action:split>')

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'default' : {
\ 'auto_resize': 1,
\ 'prompt': 'λ:',
\ 'direction': 'rightbelow',
\ 'winminheight': '10',
\ 'highlight_mode_insert': 'Visual',
\ 'highlight_mode_normal': 'Visual',
\ 'prompt_highlight': 'Function',
\ 'highlight_matched_char': 'Function',
\ 'highlight_matched_range': 'Normal'
\ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)
catch
  echo 'Denite not installed. It should work after running :PlugInstall'
endtry

							" *coc-completion-example*

" Note: use command `:verbose imap` to check current insert
" key-mappings when your key-mappings not work.

" Use <tab> and <S-tab> to navigate completion list: >

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
\ coc#pum#visible() ? coc#pum#next(1):
\ <SID>check_back_space() ? "\<Tab>" :
\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <CR> to confirm completion, use: >
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"
" <
" To make <CR> to confirm selection of selected complete item or notify coc.nvim
" to format on enter, use: >
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" " Map <tab> for trigger completion, completion confirm, snippet expand and jump
" " like VSCode: >

" inoremap <silent><expr> <TAB>
  " \ coc#pum#visible() ? coc#_select_confirm() :
  " \ coc#expandableOrJumpable() ?
  " \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  " \ <SID>check_back_space() ? "\<TAB>" :
  " \ coc#refresh()

" function! s:check_back_space() abort
  " let col = col('.') - 1
  " return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" let g:coc_snippet_next = '<tab>'
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" <
" Note: the `coc-snippets` extension is required for this to work.

" === Coc.nvim === "
" use <tab> for trigger completion and navigate to next complete item
let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-eslint',
  \ 'coc-stylelintplus',
  \ 'coc-highlight',
  \ 'coc-git',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-lists',
  \ 'coc-tsserver',
  \ 'coc-yaml',
  \ 'coc-vimlsp',
  \ 'coc-gitignore',
  \ 'coc-pyright',
  \ 'coc-yaml',
  \ 'coc-sql',
  \ 'coc-styled-components'
  \ ]

function! s:isPreviewWindowOpen()
  for nr in range(1, winnr('$'))
    if getwinvar(nr, "&pvw") == 1
      return 1
    endif
  endfor
  return 0
endfunction

" Close preview window without changing the sizes of other windows.
function! s:closePreview()
  if !s:isPreviewWindowOpen()
    return
  endif

  let eq = &equalalways
  set noequalalways
  pclose
  if eq
    let cmd = winrestcmd()
    let &equalalways = eq
    exe cmd
  endif
endfunction

nnoremap <silent> <C-W>z :call <SID>closePreview()<cr>

command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList -A grep '.<q-args>

function! s:GrepArgs(...)
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  return join(list, "\n")
endfunction

" coc-settings.json uses jsonc, which adds comment syntax
autocmd FileType json syntax match Comment +\/\/.\+$+"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction



" " try

" " === Vim airline ==== "
" " Enable extensions
" let g:airline_extensions = ['branch', 'hunks', 'coc']

" " Update section z to just have line number
" let g:airline_section_z = airline#section#create(['linenr'])

" " Do not draw separators for empty sections (only for the active window) >
" let g:airline_skip_empty_sections = 1

" " Smartly uniquify buffers names with similar filename, suppressing common parts of paths.
" let g:airline#extensions#tabline#formatter = 'unique_tail'

" " Custom setup that removes filetype/whitespace from default vim airline bar
" let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]

" let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'

" let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

" " Configure error/warning section to use coc.nvim
" let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
" let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" " Hide the Nerdtree status line to avoid clutter
" let g:NERDTreeStatusline = ''

" " Disable vim-airline in preview mode
" let g:airline_exclude_preview = 1

" " Enable powerline fonts
" let g:airline_powerline_fonts = 1

" " Enable caching of syntax highlighting groups
" let g:airline_highlighting_cache = 1

" " Define custom airline symbols
" if !exists('g:airline_symbols')
  " let g:airline_symbols = {}
" endif

" " unicode symbols
" let g:airline_left_sep = '❮'
" let g:airline_right_sep = '❯'
" "" Don't show git changes to current file in airline
" "let g:airline#extensions#hunks#enabled=0

" catch
  " echo 'Airline not installed. It should work after running :PlugInstall'
" endtry


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
      " \ pumvisible() ? "\<C-n>" :
      " \ <SID>check_back_space() ? "\<TAB>" :
      " \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" function! s:check_back_space() abort
  " let col = col('.') - 1
  " return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
" " Use <c-space> for trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()
" Pressing enter closes popupmenu if it is open, and inserts a line break.
" Defer to vim-smartinput when the popupmenu is not visible.
"
" It seems that coc.nvim incorrectly puts the popupmenu into state 2 (as
" described in the popupmenu-completion documentation) when it should be in
" state 3. In state 2 <Enter> inserts the currently selected match instead of
" inserting a line break.
"
" Do not automatically close single quotes in Rust when writing lifetime
" variable declarations.
"
set conceallevel=0


call smartinput#define_rule({
\   'at': '<\s*\(''\s*[a-z]\s*,\s*\)*\%#',
\   'char': '''',
\   'input': '''',
\   'filetype': ['rust'],
\ })

" Do not automatically close single quotes in Rust when writing reference types
" with lifetime specifiers.
call smartinput#define_rule({
\   'at': '&\%#',
\   'char': '''',
\   'input': '''',
\   'filetype': ['rust'],
\ })

" call smartinput#map_to_trigger('i', '<Plug>SmartinputCR', '<Enter>', '<CR>')
" imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<Plug>SmartinputCR"
map <Space> <Leader>
