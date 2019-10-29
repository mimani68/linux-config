:set autoindent
:set cindent
:set number

set nocompatible              " be iMproved, required
filetype off                  " required



"=====================================================
"
" 	  V I M  P L U G
" https://github.com/junegunn/vim-plug
"
"======================================================
"
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Multiple commands
Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }

" Loaded when clojure file is opened
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Multiple file types
Plug 'kovisoft/paredit', { 'for': ['clojure', 'scheme'] }

" On-demand loading on both conditions
Plug 'junegunn/vader.vim',  { 'on': 'Vader', 'for': 'vader' }

" Code to execute when the plugin is lazily loaded on demand
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
autocmd! User goyo.vim echom 'Goyo is now loaded!'


"
" LanguageClient-neovim
" --------------------------------------
" Language Server Protocol (LSP) support for vim and neovim.
Plug 'autozimu/LanguageClient-neovim', {
     \ 'branch': 'next',
     \ 'do': 'bash install.sh',
     \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Initialize plugin system
call plug#end()





"==================================================
"
"	      P A T H E G E N
"
"=================================================
execute pathogen#infect()

"
" S o l a r i z e d
" ---------------------------------------------
"
" Installation
" --------------------------------------------
"   $ cd ~/.vim/bundle
"   $ git clone git://github.com/altercation/vim-colors-solarized.git
"   
"
syntax enable
let g:solarized_termcolors=256
" set background=dark
" if has('gui_running')
"    set background=light
" else
"    set background=dark
" endif
colorscheme solarized


"
"
" The NERD Tree
" ------------------------------------------
"  The NERD tree allows you to explore your filesystem and to open files and directories. It presents the filesystem to you in the form of a tree which you manipulate with the keyboard and/or mouse. It also allows you to perform simple filesystem operations.
" 
" The following features and functionality are provided by the NERD tree:
"
" Files and directories are displayed in a hierarchical tree structure
" Different highlighting is provided for the following types of nodes:
" files
" directories
" sym-links
" windows .lnk files
" read-only files
" executable files
" Many (customisable) mappings are provided to manipulate the tree:
" Mappings to open/close/explore directory nodes
" Mappings to open files in new/existing windows/tabs
" Mappings to change the current root of the tree
" Mappings to navigate around the tree
" ...
" Directories and files can be bookmarked.
" Most NERD tree navigation can also be done with the mouse
" Filtering of tree content (can be toggled at runtime)
" custom file filters to prevent e.g. vim backup files being displayed
" optional displaying of hidden files (. files)
" files can be "turned off" so that only directories are displayed
" The position and size of the NERD tree window can be customised
" The order in which the nodes in the tree are listed can be customised.
" A model of your filesystem is created/maintained as you explore it. This has several advantages:
" All filesystem information is cached and is only re-read on demand
" If you revisit a part of the tree that you left earlier in your session, the directory nodes will be opened/closed as you left them
" The script remembers the cursor position and window position in the NERD tree so you can toggle it off (or just close the tree window) and then reopen it (with NERDTreeToggle) the NERD tree window will appear exactly as you left it
" You can have a separate NERD tree for each tab, share trees across tabs, or a mix of both.
" By default the script overrides the default file browser (netrw), so if you :edit a directory a (slightly modified) NERD tree will appear in the current window
" A programmable menu system is provided (simulates right clicking on a node)
" one default menu plugin is provided to perform basic filesystem operations (create/delete/move/copy files/directories)
" There's an API for adding your own keymappings


"
" Installation
" -------------------------------------------
"   $ cd ~/.vim/bundle
"   $ git clone https://github.com/scrooloose/nerdtree.git
"
"
" >> configuration
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd vimenter * NERDTree



"===============================================
"
" 		 V v n d l e
"
"===============================================
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"
"
" P L U G I N S
" ----------------------------------------
"  https://medium.com/@huntie/10-essential-vim-plugins-for-2018-39957190b7a9
"
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'nathanaelkane/vim-indent-guides'

"
" badwolf is a vim colorscheme put together by Steve Losh.
" -------------------------------------------------------------
" There are hundreds of vim color schemes out there and it’s 
"  not a good feeling – or use of your time – to keep going through 
"  them trying to find the one that clicks with you. Which is why I feel lucky to
"  have come across badwolf. I haven’t had any urge to go look for a
"  different one since I started using it many months ago.
Plugin 'sjl/badwolf'

"
" ctrlp.vim
"  -------------------------------------------------------------
" ctrlp is a fuzzy file and buffer finder that shows up above the vim status bar when you’re trying to find or edit another file.
" You can tab (⇥) through the options, narrow them down by entering some text, or choosing a directory and listing its contents with the down (↓) key.
Plugin 'ctrlpvim/ctrlp.vim'

"
" vim-easymotion
" -------------------------------------------------------------
" vim-easymotion lets you jump around your document with ease and great precision.
" There is a lot of complex configuration and usage that I won’t get into here, 
" and that isn’t necessary for it to be useful to you.
" I use vim-easymotion in two main ways: to jump to a specific word forward or backward relative to the cursor. 
" You can invoke the forward word jump with <leader><leader>w
" If you want to jump to “fees”, press w. If you want to jump to “outpacing”, press ;g.
" It’s awesome!
" To invoke backward word jump, use the command <leader><leader>b.
" Maybe you detect a theme: w is how you move one word ahead in vim, 
" and b is how you move one word back.
Plugin 'easymotion/vim-easymotion'

"
" vim-gitgutter
" -------------------------------------------------------------
" vim-gitgutter shows signs for line additions (+), modifications (~), 
" or removals (-) in the vim window gutter if the file you’re modifying is in a git repo.
" It can do more than that, like allowing you to jump between hunks (blocks of changes). 
" It is also highly customizable.
Plugin 'airblade/vim-gitgutter'

"
" vim-table-mode
" -------------------------------------------------------------
" Creating tables in Markdown can be a pain. You either have to accept a table that looks horrible in raw text view because different rows have different widths:
" 
" | Key | Value |
" |-----|-------|
" | first_name | 'sherif' |
" | last_name | 'soliman' |
" | occupation | 'junior badass' |
" | age | 403 |
" Or you have to spend a lot of time adding and removing spaces over and over to fit each new entry.
" 
" vim-table-mode does a great job solving that problem.
" 
" Once you want to start composing or editing a Markdown table, invoke vim-table-mode’s table mode with <leader>tm. Now, each time you enter | to leave the cell and move on to the next cell or row, vim-table-mode will reflow the entire table to give you straight edges.
" 
" It’s beautiful to see in action and makes me smile whenever I use it. Here is the table above composed in table mode:
" 
" | Key        | Value           |
" |------------|-----------------|
" | first_name | 'sherif'        |
" | last_name  | 'soliman'       |
" | occupation | 'junior badass' |
" | age        | 403             |
" I did not have to type a single space or extra -.
"
" As with almost all the plugins I’ve listed, I only described the most basic usage. You can do and customize quite a bit.
" 
" My only customization is:
"   let g:table_mode_corner="|"
"
" To tell the plugin to use | instead of + for table corners.
Plugin 'dhruvasagar/vim-table-mode'
let g:table_mode_corner="|"


"
" Dockerfile.vim
" -------------------------------------------------------
" Vim syntax file for Docker's Dockerfile and snippets for snipMate.
"
Plugin 'ekalinin/Dockerfile.vim'


"
" vim-airline
" ----------------------------------------------------------
" Lean & mean status/tabline for vim that's light as air.
"
" +-----------------------------------------------------------------------------+
" |~                                                                            |
" |~                                                                            |
" |~                     VIM - Vi IMproved                                      |
" |~                                                                            |
" |~                       version 8.0                                          |
" |~                    by Bram Moolenaar et al.                                |
" |~           Vim is open source and freely distributable                      |
" |~                                                                            |
" |~           type :h :q<Enter>          to exit                               |
" |~           type :help<Enter> or <F1>  for on-line help                      |
" |~           type :help version8<Enter> for version info                      |
" |~                                                                            |
" |~                                                                            |
" +-----------------------------------------------------------------------------+
" | A | B |                     C                            X | Y | Z |  [...] |
" +-----------------------------------------------------------------------------+
"
"
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'



"
" YOUCOMPLETEME: A CODE-COMPLETION ENGINE FOR VIM
" ---------------------------------------------------
"   https://vimawesome.com/plugin/youcompleteme
"
"   NEED LOCAL INSTALLATION
"
" Installation
" ---------------------------------------------------
"    $ sudo apt install build-essential cmake python3-dev
"    $ cd ~/.vim/bundle/YouCompleteMe
"    $ python3 install.py --js-completer --ts-completer
"    or 
"    $ ./install.py --all
"
"
Plugin 'valloric/youcompleteme'
let g:ycm_use_clangd = 0


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4



