scriptencoding utf-8
"{ Plugin installation
"{{ Vim-plug related settings.
" The root directory to install all plugins.
let g:plug_home=expand(stdpath('data') . '/plugged')

" Use fastgit for clone on Linux systems.
if g:is_linux
  let g:plug_url_format = 'https://hub.fastgit.org/%s.git'
endif

if empty(readdir(g:plug_home))
  augroup plug_init
    autocmd!
    autocmd VimEnter * PlugInstall --sync | quit |source $MYVIMRC
  augroup END
endif
"}}


"{{ Autocompletion related plugins
call plug#begin()
" Auto-completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Language Server Protocol client
Plug 'prabirshrestha/vim-lsp'
Plug 'lighttiger2505/deoplete-vim-lsp'

" Vim source for deoplete
if !executable('vim-language-server')
  " only use neco-vim when vim-language-server is not available
  Plug 'Shougo/neco-vim', { 'for': 'vim' }
endif
"}}
"{{ File Management related plugins
" We'll install NERDTree for file exploring
	" NERD Tree - tree explorer
" https://github.com/scrooloose/nerdtree
" http://usevim.com/2012/07/18/nerdtree/
" (loaded on first invocation of the command)
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" nerdtree-git-plugin - show git status in NERD Tree
" https://github.com/Xuyuanp/nerdtree-git-plugin
Plug 'Xuyuanp/nerdtree-git-plugin'
" Cool Icons pluging
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
" FZF plugins
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " Install fuzzy finder binary
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf.vim'  " Enable fuzzy finder in Vim
"}}

"{{ language-specific plugins
" Python syntax highlighting and more
if g:is_mac || g:is_win
  Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
endif

" Python indent (follows the PEP8 style)
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}

" Python-related text object
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'machakann/vim-swap'

" IDE for Lisp
if executable('sbcl')
  " Plug 'kovisoft/slimv'
  Plug 'vlime/vlime', {'rtp': 'vim/', 'for': 'lisp'}
endif

" C++ semantic highlighting
if executable('ccls')
  Plug 'jackguo380/vim-lsp-cxx-highlight'
endif

" JavaScript support
" Confirmar si los siguientes plugins son mejores que los otros
  " tern_for_vim
  " deoplete-ternjs
  " jspc.vim
  " vim-jsbeautify
 Plug 'pangloss/vim-javascript'   " javascript sintax

" these two plugins will add highlighting and indenting to JSX and TSX files.
Plug 'yuezk/vim-js'
" if you want to highlight tsx files.
Plug 'HerringtonDarkholme/yats.vim'
" or Plug 'leafgarland/typescript-vim'    " typescript syntax
Plug 'maxmellon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'

Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'jparise/vim-graphql'
"}}

"{{ Search related plugins
" Super fast movement with vim-sneak
Plug 'justinmk/vim-sneak'

" Clear highlight search automatically for you
Plug 'romainl/vim-cool'

" Show current search term in different color
Plug 'PeterRincker/vim-searchlight'

" Show match number for incsearch
Plug 'osyo-manga/vim-anzu'

" Stay after pressing * and search selected text
Plug 'haya14busa/vim-asterisk'

" File search, tag search and more
if g:is_win
  Plug 'Yggdroot/LeaderF'
else
  Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
endif

" Another similar plugin is command-t
" Plug 'wincent/command-t'

" Another grep tool (similar to Sublime Text Ctrl+Shift+F)
" Plug 'dyng/ctrlsf.vim'

" A greping tool
" Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
"}}

"{{ UI: Color, theme etc.
" A list of colorscheme plugin you may want to try. Find what suits you.
Plug 'lifepillar/vim-gruvbox8'
Plug 'ajmwagar/vim-deus'
Plug 'lifepillar/vim-solarized8'
Plug 'joshdick/onedark.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'sainnhe/edge'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/gruvbox-material'
Plug 'chriskempson/base16-vim'

if !exists('g:started_by_firenvim')
  " colorful status line and theme
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'mhinz/vim-startify'
endif
"}}

"{{ Plugin to deal with URL
" Highlight URLs inside vim
Plug 'itchyny/vim-highlighturl'

" For Windows and Mac, we can open an URL in the browser. For Linux, it may
" not be possible since we maybe in a server which disables GUI.
if g:is_win || g:is_mac
  " open URL in browser
  Plug 'tyru/open-browser.vim'
endif
"}}

"{{ Navigation and tags plugin
" Only install these plugins if ctags are installed on the system
if executable('ctags')
  " plugin to manage your tags
  Plug 'ludovicchabant/vim-gutentags'
  " show file tags in vim window
  Plug 'liuchengxu/vista.vim'
endif
"}}

"{{ File editting plugin
" Snippet engine and snippet template
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Automatic insertion and deletion of a pair of characters
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'

" Comment plugin
Plug 'tpope/vim-commentary'

" Multiple cursor plugin like Sublime Text?
" Plug 'mg979/vim-visual-multi'

" Title character case
Plug 'christoomey/vim-titlecase'

" Autosave files on certain events
Plug '907th/vim-auto-save'

" Show undo history visually
Plug 'simnalamburt/vim-mundo'

" Manage your yank history
if g:is_win || g:is_mac
  Plug 'svermeulen/vim-yoink'
endif

Plug 'bfredl/nvim-miniyank'

" Handy unix command inside Vim (Rename, Move etc.)
Plug 'tpope/vim-eunuch'

" Repeat vim motions
Plug 'tpope/vim-repeat'

" Show the content of register in preview window
" Plug 'junegunn/vim-peekaboo'
Plug 'jdhao/better-escape.vim'

if g:is_mac
  Plug 'lyokha/vim-xkbswitch'
elseif g:is_win
  Plug 'Neur1n/neuims'
endif
"}}

"{{ Linting, formating
" Syntax check and make
" Plug 'neomake/neomake'

" Another linting plugin
Plug 'dense-analysis/ale'

" Auto format tools
Plug 'sbdchd/neoformat', { 'on': 'Neoformat' }
" Plug 'Chiel92/vim-autoformat'
"}}

"{{ Git related plugins
" Show git change (change, delete, add) signs in vim sign column
Plug 'mhinz/vim-signify'
" Another similar plugin
" Plug 'airblade/vim-gitgutter'

" Git command inside vim
" Excellent git wrapper
" https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'
Plug 'APZelos/blamer.nvim'
"}}

"{{ Plugins for markdown writing
" Another markdown plugin
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" Faster footnote generation
Plug 'vim-pandoc/vim-markdownfootnotes', { 'for': 'markdown' }

" Vim tabular plugin for manipulate tabular, required by markdown plugins
Plug 'godlygeek/tabular', {'on': 'Tabularize'}

" Markdown JSON header highlight plugin
Plug 'elzr/vim-json', { 'for': ['json', 'markdown'] }

" Markdown previewing (only for Mac and Windows)
if g:is_win || g:is_mac
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug'] }
endif

" emoji
" Plug 'https://gitlab.com/gi1242/vim-emoji-ab'
Plug 'fszymanski/deoplete-emoji', {'for': 'markdown'}

if g:is_mac
  Plug 'rhysd/vim-grammarous'
endif

Plug 'chrisbra/unicode.vim'
"}}

"{{ Text object plugins
" Additional powerful text object for vim, this plugin should be studied
" carefully to use its full power
Plug 'wellle/targets.vim'

" Plugin to manipulate characer pairs quickly
" Plug 'tpope/vim-surround'
Plug 'machakann/vim-sandwich'

" Add indent object for vim (useful for languages like Python)
Plug 'michaeljsmith/vim-indent-object'
"}}

"{{ Markdown Editing related plugins

" Markdown editing
" When we are editing Markdown files, it is nice to have some code snippets
" to improve efficiency. Fortunately, UltiSnips combined with vim-snippets
" provides a lot of useful snippets for Markdown files.
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Distraction-free writing
" When we are writing Markdown files, we may wish to focus on the task and
" temporarily disable the distraction elements in Neovim.
" The plugin goyo is designed specifically for this purpose.
Plug 'junegunn/goyo.vim'
" After installing this plugin, we can use Goyo command to toggle between
" the normal mode and distraction-free mode.

" I suggest installing limelight, which will dim all lines except
" the current line when turned on.
Plug 'junegunn/limelight.vim'
" Markdown syntax highlighting
" Code highlighting is also important, which helps us to see the structure
" of the source code more clearly. The first plugin we should install
" is vim-markdown.
"
" tabular plugin is used to format tables
Plug 'godlygeek/tabular'
" JSON front matter highlight plugin
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'
" Another good Markdown syntax plugin I recommend is vim-pandoc-syntax.
" It provides more syntax highlight and better conceal features.
Plug 'vim-pandoc/vim-pandoc-syntax'
" Markdown previewing
" There are several Markdown previewer for Neovim on GitHub. I have tried
" previm and markdown-preview.nvim, both of which have cross-platform
" support for Nvim (Windows, Linux and macOS are supported). After some
" trail, I think markdown-preview is superior in terms of speed,
" functionality provided and rendering result.
"
" if you don't have node and yarn, use pre build
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
"
"}}

"{{ LaTeX editting and previewing plugin
" Only use these plugin on Windows and Mac and when LaTeX is installed
if ( g:is_win || g:is_mac ) && executable('latex')
  " vimtex use autoload feature of Vim, so it is not necessary to use `for`
  " keyword of vim-plug to try to lazy-load it,
  " see https://github.com/junegunn/vim-plug/issues/785
  Plug 'lervag/vimtex'

  " Plug 'matze/vim-tex-fold', {'for': 'tex'}
  " Plug 'Konfekt/FastFold'
endif
"}}

"{{ Tmux related plugins
" Since tmux is only available on Linux and Mac, we only enable these plugins
" for Linux and Mac
" if executable('tmux')
"  " Let vim detect tmux focus event correctly, see
"  " https://github.com/neovim/neovim/issues/9486 and
"  " https://vi.stackexchange.com/q/18515/15292
  " Plug 'tmux-plugins/vim-tmux-focus-events'

"  " .tmux.conf syntax highlighting and setting check
  " Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
" endif
"}}

"{{ HTML related
Plug 'mattn/emmet-vim', { 'for': ['markdown', 'javascript', 'css'] }
" This plugin contributes to vim-polyglot language pack  <-- use with polyglot
" Plug 'othree/html5.vim'
"}}

"{{ Misc plugins
" Modern matchit implementation
Plug 'andymass/vim-matchup'

" Smoothie motions
Plug 'psliwka/vim-smoothie'

Plug 'tpope/vim-scriptease'

" Asynchronous command execution
Plug 'skywind3000/asyncrun.vim'
" Another asynchronous plugin
" Plug 'tpope/vim-dispatch'
Plug 'cespare/vim-toml'

" Edit text area in browser using nvim
if g:is_mac || g:is_win
  Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
endif

" Debugger plugin
if g:is_mac || g:is_linux
  Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
endif

" Session management plugin
Plug 'tpope/vim-obsession'

" Calculate statistics for visual selection
Plug 'wgurecky/vimSum'
if g:is_linux
  Plug 'ojroques/vim-oscyank'
endif

" foldable extensible 40-column cheat sheet
Plug 'lifepillar/vim-cheat40'
call plug#end()
"}}
"}

"{ Plugin settings
"{{ Vim-plug settings
" Use shortnames for common vim-plug command to reduce typing.
" To use these shortcut: first activate command line with `:`, then input the
" short alias, e.g., `pi`, then press <space>, the alias will be expanded
" to the full command automatically
call utils#Cabbrev('pi', 'PlugInstall')
call utils#Cabbrev('pud', 'PlugUpdate')
call utils#Cabbrev('pug', 'PlugUpgrade')
call utils#Cabbrev('ps', 'PlugStatus')
call utils#Cabbrev('pc', 'PlugClean')
"}}

"{{ Auto-completion related
"""""""""""""""""""""""""""" deoplete settings""""""""""""""""""""""""""
" Wheter to enable deoplete automatically after start nvim
let g:deoplete#enable_at_startup = 1

" Maximum candidate window width
call deoplete#custom#option('max_menu_width', 80)

" Minimum character length needed to activate auto-completion.
call deoplete#custom#option('min_pattern_length', 1)

" use fuzzy matcher
call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])

" Whether to disable completion for certain syntax
" call deoplete#custom#source('_', {
"     \ 'filetype': ['vim'],
"     \ 'disabled_syntaxes': ['String']
"     \ })
call deoplete#custom#source('_', {
  \ 'filetype': ['python'],
  \ 'disabled_syntaxes': ['Comment']
  \ })

" Ignore certain sources, because they only cause nosie most of the time
call deoplete#custom#option('ignore_sources', {
   \ '_': ['around', 'buffer']
   \ })

" Candidate list item number limit
call deoplete#custom#option('max_list', 15)

" The number of processes used for the deoplete parallel feature.
call deoplete#custom#option('num_processes', 8)

" The delay for completion after input, measured in milliseconds.
call deoplete#custom#option('auto_complete_delay', 100)

" lower case can also match upper case (upper case are hard to type!)
call deoplete#custom#option({'camel_case': v:true,})

"""""""""""""""""""""""""""" vim-lsp settings""""""""""""""""""""""""""
" whether to enable diagnostics for vim-lsp (we may want to use ALE for other
" plugins for that.
let g:lsp_diagnostics_enabled = 1

" show diagnostic signs
let g:lsp_diagnostics_signs_enabled = 1
let g:lsp_diagnostics_signs_error = {'text': '✗'}
let g:lsp_diagnostics_signs_warning = {'text': '!'}
let g:lsp_diagnostics_highlights_enabled = 0

" Do not use virtual text, they are far too obstrusive.
let g:lsp_diagnostics_virtual_text_enabled = 0
" whether to echo a diagnostic message on statusline at cursor position
let g:lsp_diagnostics_echo_cursor = 1
" Whether to show diagnostic in floating window
let g:lsp_diagnostics_float_cursor = 0
let g:lsp_diagnostics_float_delay = 100

let g:lsp_preview_max_width = 80
let g:lsp_work_done_progress_enabled = 1

" set up pyls for vim-lsp
if executable('pyls')
 " pip install python-language-server
  augroup pyls_setup
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'pyls',
          \ 'cmd': {server_info->['pyls']},
          \ 'allowlist': ['python'],
          \ 'workspace_config': {
          \    'pyls':
          \        {'configurationSources': ['flake8'],
          \         'plugins': {'flake8': {'enabled': v:true},
          \                     'pyflakes': {'enabled': v:false},
          \                     'pycodestyle': {'enabled': v:false},
          \                     'jedi_completion': {'fuzzy': v:true},
          \                    }
          \        }
          \ }})
  augroup END
endif

if executable('ccls')
  augroup ccls_setup
    autocmd!
    au User lsp_setup call lsp#register_server({
        \ 'name': 'ccls',
        \ 'cmd': {server_info->['ccls']},
        \ 'root_uri': {server_info->lsp#utils#path_to_uri(
        \   lsp#utils#find_nearest_parent_file_directory(
        \     lsp#utils#get_buffer_path(), ['.ccls', 'compile_commands.json', '.git/']))},
        \ 'initialization_options': {
        \   'highlight': { 'lsRanges' : v:true },
        \   'cache': {'directory': stdpath('cache') . '/ccls' },
        \ },
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
        \ })
  augroup END
endif

if executable('vim-language-server')
  augroup LspVim
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'vim-language-server',
        \ 'cmd': {server_info->['vim-language-server', '--stdio']},
        \ 'whitelist': ['vim'],
        \ 'initialization_options': {
        \   'vimruntime': $VIMRUNTIME,
        \   'runtimepath': &rtp,
        \ },
        \ 'suggest': {
        \ 'fromRuntimepath': v:true
        \ }})
  augroup END
endif

function! s:on_lsp_buffer_enabled() abort
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

"""""""""""""""""""""""""UltiSnips settings"""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use YouCompleteMe
let g:UltiSnipsExpandTrigger='<c-j>'

" Do not look for SnipMate snippets
let g:UltiSnipsEnableSnipMate = 0

" Shortcut to jump forward and backward in tabstop positions
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" Configuration for custom snippets directory, see
" https://jdhao.github.io/2019/04/17/neovim_snippet_s1/ for details.
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'my_snippets']
"}}


"{{ File Management related plugins
" We'll configure NERDTree for file exploring
" This is the default extra key bindings

" Use Ctrl-k Ctrl-k to open a sidebar with the list of files
map <C-k><C-k> :NERDTreeToggle<cr>
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
" Use Ctrl-P to open the fuzzy file opener
nnoremap <C-p> :Files<cr>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_buffers_jump = 1

" map <C-f> :Files<CR>
" map <leader>b :Buffers<CR>
" nnoremap <leader>g :Rg<CR>
" nnoremap <leader>t :Tags<CR>
" nnoremap <leader>m :Marks<CR>
" let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"
"-g '!{node_modules,.git}'

" Customize fzf colors to match your color scheme
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

" Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--inline-info']}), <bang>0)

" Make Ripgrep ONLY search file contents and not filenames
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --smart-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4.. -e'}, 'right:50%', '?'),
  \   <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   gzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

"}}

"{{ Language specific plugin
"""""""""""""""""""""""""" semshi settings """""""""""""""""""""""""""""""
" Do not highlight for all occurances of variable under cursor
let g:semshi#mark_selected_nodes=0

" Do not show error sign since linting plugin is specicialized for that
let g:semshi#error_sign=v:false

"""""""""""""""""""""""""" vlime settings """"""""""""""""""""""""""""""""
command! -nargs=0 StartVlime call jobstart(printf("sbcl --load %s/vlime/lisp/start-vlime.lisp", g:plug_home))

"}}

"{{ Search related
"""""""""""""""""""""""""""""vim-sneak settings"""""""""""""""""""""""
" Use sneak label mode
let g:sneak#label = 1

nmap f <Plug>Sneak_s
xmap f <Plug>Sneak_s
onoremap <silent> f :call sneak#wrap(v:operator, 2, 0, 1, 1)<CR>
nmap F <Plug>Sneak_S
xmap F <Plug>Sneak_S
onoremap <silent> F :call sneak#wrap(v:operator, 2, 1, 1, 1)<CR>

" Immediately after entering sneak mode, you can press f and F to go to next
" or previous match
let g:sneak#s_next = 1

"""""""""""""""""""""""""""""vim-anzu settings"""""""""""""""""""""""
nmap n <Plug>(anzu-n-with-echo)zzzv
nmap N <Plug>(anzu-N-with-echo)zzzv

" Maximum number of words to search
let g:anzu_search_limit = 500000

" Message to show for search pattern
let g:anzu_status_format = '/%p [%i/%l]'

"""""""""""""""""""""""""""""vim-asterisk settings"""""""""""""""""""""
nmap *  <Plug>(asterisk-z*)
nmap #  <Plug>(asterisk-z#)
xmap *  <Plug>(asterisk-z*)
xmap #  <Plug>(asterisk-z#)

"""""""""""""""""""""""""""""LeaderF settings"""""""""""""""""""""
" Do not use cache file
let g:Lf_UseCache = 0
" Refresh each time we call leaderf
let g:Lf_UseMemoryCache = 0

" Ignore certain files and directories when searching files
let g:Lf_WildIgnore = {
  \ 'dir': ['.git', '__pycache__', '.DS_Store'],
  \ 'file': ['*.exe', '*.dll', '*.so', '*.o', '*.pyc', '*.jpg', '*.png',
  \ '*.gif', '*.svg', '*.ico', '*.db', '*.tgz', '*.tar.gz', '*.gz',
  \ '*.zip', '*.bin', '*.pptx', '*.xlsx', '*.docx', '*.pdf', '*.tmp',
  \ '*.wmv', '*.mkv', '*.mp4', '*.rmvb', '*.ttf', '*.ttc', '*.otf']
  \}

" Do not show fancy icons for Linux server.
if g:is_linux
  let g:Lf_ShowDevIcons = 0
endif

" Only fuzzy-search files names
let g:Lf_DefaultMode = 'NameOnly'

" Popup window settings
let g:Lf_PopupWidth = 0.5
let g:Lf_PopupPosition = [0, &columns/4]

" Do not use version control tool to list files under a directory since
" submodules are not searched by default.
let g:Lf_UseVersionControlTool = 0

" Disable default mapping
let g:Lf_ShortcutF = ''
let g:Lf_ShortcutB = ''

" set up working directory for git repository
let g:Lf_WorkingDirectoryMode = 'a'

" Search files in popup window
nnoremap <silent> <leader>f :<C-U>Leaderf file --popup<CR>
" Search vim help files
nnoremap <silent> <leader>h :<C-U>Leaderf help --popup<CR>
" Search tags in current buffer
nnoremap <silent> <leader>t :<C-U>Leaderf bufTag --popup<CR>
"}}

"{{ URL related
""""""""""""""""""""""""""""open-browser.vim settings"""""""""""""""""""
if g:is_win || g:is_mac
  " Disable netrw's gx mapping.
  let g:netrw_nogx = 1

  " Use another mapping for the open URL method
  nmap ob <Plug>(openbrowser-smart-search)
  xmap ob <Plug>(openbrowser-smart-search)
endif
"}}

"{{ Navigation and tags
""""""""""""""""""""""""""" gutentags settings """"""""""""""""""""""""""""""
" The path to store tags files, instead of in the project root.
let g:gutentags_cache_dir = stdpath('cache') . '/ctags'
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_ctags_exclude = ['*.md', '*.html', '*.json', '*.toml', '*.css', '*.js',]

""""""""""""""""""""""""""" vista settings """"""""""""""""""""""""""""""""""
let g:vista#renderer#icons = {
      \ 'member': '',
      \ }

" Do not echo message on command line
let g:vista_echo_cursor = 0
" Stay in current window when vista window is opened
let g:vista_stay_on_open = 0

augroup vista_conf
  autocmd!
  " Double mouse click to go to a tag
  autocmd FileType vista* nnoremap <buffer> <silent>
        \ <2-LeftMouse> :<C-U>call vista#cursor#FoldOrJump()<CR>
augroup END

nnoremap <silent> <Space>t :<C-U>Vista!!<CR>

function! Comment()
  if (mode() == "n" )
    execute "Commentary"
  else
    execute "'<,'>Commentary"
  endif
 endfunction
vnoremap <silent> <space>/ :call Comment()
"}}

"{{ File editting
""""""""""""""""""""""""""""vim-titlecase settings"""""""""""""""""""""""
" Do not use the default mapping provided
let g:titlecase_map_keys = 0

nmap <leader>gt <Plug>Titlecase
xmap <leader>gt <Plug>Titlecase
nmap <leader>gT <Plug>TitlecaseLine

""""""""""""""""""""""""vim-auto-save settings"""""""""""""""""""""""
" Enable autosave on nvim startup
let g:auto_save = 1

" A list of events to trigger autosave
let g:auto_save_events = ['InsertLeave', 'TextChanged']

" Whether to show autosave status on command line
let g:auto_save_silent = 0

""""""""""""""""""""""""vim-mundo settings"""""""""""""""""""""""
let g:mundo_verbose_graph = 0
let g:mundo_width = 80

nnoremap <silent> <Space>u :MundoToggle<CR>

""""""""""""""""""""""""""""vim-yoink settings"""""""""""""""""""""""""
if g:is_win || g:is_mac
  " ctrl-n and ctrl-p will not work if you add the TextChanged event to vim-auto-save events.
  " nmap <c-n> <plug>(YoinkPostPasteSwapBack)
  " nmap <c-p> <plug>(YoinkPostPasteSwapForward)

  " The following p/P mappings are also needed for ctrl-n and ctrl-p to work
  " nmap p <plug>(YoinkPaste_p)
  " nmap P <plug>(YoinkPaste_P)

  " Cycle the yank stack with the following mappings
  nmap [y <plug>(YoinkRotateBack)
  nmap ]y <plug>(YoinkRotateForward)

  " Do not change the cursor position
  nmap y <plug>(YoinkYankPreserveCursorPosition)
  xmap y <plug>(YoinkYankPreserveCursorPosition)

  " Move cursor to end of paste after multiline paste
  let g:yoinkMoveCursorToEndOfPaste = 0

  " Record yanks in system clipboard
  let g:yoinkSyncSystemClipboardOnFocus = 1
endif

""""""""""""""""""""""""""""nvim-minipyank settings"""""""""""""""""""""""""
nmap p <Plug>(miniyank-autoput)
nmap P <Plug>(miniyank-autoPut)

""""""""""""""""""""""""""""vim-xkbswitch settings"""""""""""""""""""""""""
let g:XkbSwitchEnabled = 1
"}}

"{{ Linting and formating
"""""""""""""""""""""""""""""" ale settings """""""""""""""""""""""
" linters for different filetypes
let g:ale_linters = {
  \ 'vim': ['vint'],
  \ }

" Only run linters in the g:ale_linters dictionary
let g:ale_linters_explicit = 1

" Linter signs
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '!'

"""""""""""""""""""""""""""""" neoformat settings """""""""""""""""""""""
let g:neoformat_enabled_python = ['black', 'yapf']
let g:neoformat_cpp_clangformat = {
      \ 'exe': 'clang-format',
      \ 'args': ['--style="{IndentWidth: 4}"']
      \ }
let g:neoformat_c_clangformat = {
      \ 'exe': 'clang-format',
      \ 'args': ['--style="{IndentWidth: 4}"']
      \ }

let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']
"}}

"{{ Git-related
"""""""""""""""""""""""""vim-signify settings""""""""""""""""""""""""""""""
" The VCS to use
let g:signify_vcs_list = [ 'git' ]

" Change the sign for certain operations
let g:signify_sign_change = '~'

"""""""""""""""""""""""""vim-fugitive settings""""""""""""""""""""""""""""""
nnoremap <silent> <leader>gc :Git commit<CR>
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gpl :Git pull<CR>
" Note that to use bar literally, we need backslash it, see also `:h :bar`.
nnoremap <silent> <leader>gpu :15split \| term git push
"}}

"{{ Markdown writing
"""""""""""""""""""""""""plasticboy/vim-markdown settings"""""""""""""""""""
" Disable header folding
let g:vim_markdown_folding_disabled = 1

" Whether to use conceal feature in markdown
let g:vim_markdown_conceal = 1

" Disable math tex conceal and syntax highlight
let g:tex_conceal = ''
let g:vim_markdown_math = 0

" Support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

" Let the TOC window autofit so that it doesn't take too much space
let g:vim_markdown_toc_autofit = 1

"""""""""""""""""""""""""markdown-preview settings"""""""""""""""""""
" Only setting this for suitable platforms
if g:is_win || g:is_mac
  " Do not close the preview tab when switching to other buffers
  let g:mkdp_auto_close = 0

  " Shortcuts to start and stop markdown previewing
  nnoremap <silent> <M-m> :<C-U>MarkdownPreview<CR>
  nnoremap <silent> <M-S-m> :<C-U>MarkdownPreviewStop<CR>
endif

""""""""""""""""""""""""vim-grammarous settings""""""""""""""""""""""""""""""
if g:is_mac
  let g:grammarous#languagetool_cmd = 'languagetool'
  let g:grammarous#disabled_rules = {
      \ '*' : ['WHITESPACE_RULE', 'EN_QUOTES', 'ARROWS', 'SENTENCE_WHITESPACE',
      \        'WORD_CONTAINS_UNDERSCORE', 'COMMA_PARENTHESIS_WHITESPACE',
      \        'EN_UNPAIRED_BRACKETS', 'UPPERCASE_SENTENCE_START',
      \        'ENGLISH_WORD_REPEAT_BEGINNING_RULE', 'DASH_RULE', 'PLUS_MINUS',
      \        'PUNCTUATION_PARAGRAPH_END', 'MULTIPLICATION_SIGN', 'PRP_CHECKOUT',
      \        'CAN_CHECKOUT', 'SOME_OF_THE', 'DOUBLE_PUNCTUATION', 'HELL',
      \        'CURRENCY', 'POSSESSIVE_APOSTROPHE', 'ENGLISH_WORD_REPEAT_RULE',
      \        'NON_STANDARD_WORD', 'AU', 'DATE_NEW_YEAR'],
      \ }

  augroup grammarous_map
    autocmd!
    autocmd FileType markdown nmap <buffer> <leader>x <Plug>(grammarous-close-info-window)
    autocmd FileType markdown nmap <buffer> <c-n> <Plug>(grammarous-move-to-next-error)
    autocmd FileType markdown nmap <buffer> <c-p> <Plug>(grammarous-move-to-previous-error)
  augroup END
endif

""""""""""""""""""""""""unicode.vim settings""""""""""""""""""""""""""""""
nmap ga <Plug>(UnicodeGA)

""""""""""""""""""""""""deoplete-emoji settings""""""""""""""""""""""""""""
call deoplete#custom#source('emoji', 'converters', ['converter_emoji'])
"}}

"{{ text objects
""""""""""""""""""""""""""""vim-sandwich settings"""""""""""""""""""""""""""""
" Map s to nop since s in used by vim-sandwich. Use cl instead of s.
nmap s <Nop>
omap s <Nop>
"}}

""{{ LaTeX editting
"""""""""""""""""""""""""""""vimtex settings"""""""""""""""""""""""""""""
"if ( g:is_win || g:is_mac ) && executable('latex')
"  function! SetServerName() abort
"    if has('win32')
"      let nvim_server_file = $TEMP . '/curnvimserver.txt'
"    else
"      let nvim_server_file = '/tmp/curnvimserver.txt'
"    endif
"    let cmd = printf('echo %s > %s', v:servername, nvim_server_file)
"    call system(cmd)
"  endfunction

"  augroup vimtex_common
"    autocmd!
"    autocmd FileType tex nmap <buffer> <F9> <plug>(vimtex-compile)
"    autocmd FileType tex call SetServerName()
"  augroup END

"  " Deoplete configurations for autocompletion to work
"  call deoplete#custom#var('omni', 'input_patterns', {
"        \ 'tex': g:vimtex#re#deoplete
"        \ })

"  let g:vimtex_compiler_latexmk = {
"        \ 'build_dir' : 'build',
"        \ }

"  " TOC settings
"  let g:vimtex_toc_config = {
"        \ 'name' : 'TOC',
"        \ 'layers' : ['content', 'todo', 'include'],
"        \ 'resize' : 1,
"        \ 'split_width' : 30,
"        \ 'todo_sorted' : 0,
"        \ 'show_help' : 1,
"        \ 'show_numbers' : 1,
"        \ 'mode' : 2,
"        \ }

"  " Viewer settings for different platforms
"  if g:is_win
"    let g:vimtex_view_general_viewer = 'SumatraPDF'
"    let g:vimtex_view_general_options_latexmk = '-reuse-instance'
"    let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
"  endif

"  if g:is_mac
"    " let g:vimtex_view_method = "skim"
"    let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
"    let g:vimtex_view_general_options = '-r @line @pdf @tex'

"    augroup vimtex_mac
"      autocmd!
"      autocmd User VimtexEventCompileSuccess call UpdateSkim()
"    augroup END

"    " The following code is adapted from https://gist.github.com/skulumani/7ea00478c63193a832a6d3f2e661a536.
"    function! UpdateSkim() abort
"      let l:out = b:vimtex.out()
"      let l:src_file_path = expand('%:p')
"      let l:cmd = [g:vimtex_view_general_viewer, '-r']

"      if !empty(system('pgrep Skim'))
"        call extend(l:cmd, ['-g'])
"      endif

"      call jobstart(l:cmd + [line('.'), l:out, l:src_file_path])
"    endfunction
"  endif
"endif
""}}


"{{ Markdown Editing related plugins
" Markdown editing
" When we are editing Markdown files, it is nice to have some code snippets to improve efficiency. Fortunately, UltiSnips combined with vim-snippets1 provides a lot of useful snippets for Markdown files.
" We need to set up UltiSnips to use it. The following is an example setting:
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"  " use <Tab> to trigger autocompletion
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" In the above setting, we use Tab to trigger snippet expansion, which means that after entering the snippet keyword for a particular snippet, using <Tab> will expand the keyword to the full snippet template. If you have used Tab for other mappings, you can set other snippet trigger, e.g., Ctrl + J:
let g:UltiSnipsExpandTrigger="<C-J>"

" For example, if we type link and then press <Tab>, it will be expanded to the following text:
" [Text](http://www.url.com)
" Your cursor will be placed at Text, with Text being in selection mode and waiting for you to enter the real link text. The setting UltiSnipsJumpForwardTrigger and UltiSnipsJumpBackTrigger set up the shortcut key to go to next and previous text area of a snippet, making the snippet editing more convenient. Take the above inline link snippet for an example. Suppose we want to add an inline link to Neovim official website (the address is https://neovim.io/), we can follow the steps below:
" Enter link and press <Tab> to get the link template.
" Start typing Neovim and Text will be replaced by Neovim.
" Press <Ctrl-F>. www.url.com will be selected.
" Start typing https://neovim.io/.
" There are many more snippets you can use. Some of the commonly used snippet keywords are listed below:
" Header:
" Level 1: sec
" Level 2: ssec
" Level 3: sssec
" Level 4: par
" Level 5: spar

" Links:
" Inline link: link
" Reference link: refl
" Image link: img

" Code:
" Code block: cbl
" Inline code: ilc
" Text rendering:
" Italic text: *
" Bold text: **
" Italic and bold text: ***

" General:
" date: date
" time: time
" date and exact time: datetime
" date in ISO format: diso
" Often times, you will find you want to more snippets to cover your use cases. For example, I have set up a snippet meta which can generate the Markdown front matter fore me, see here for more details.
"
" For how to set up Ultisnips and writing your own snippets, see this post.
" https://jdhao.github.io/2019/04/17/neovim_snippet_s1/

" Distraction-free writing
" After install, we can use Limelight to activate it. To deactivate, use Limelight!.
" We can also integrate goyo and limelight together with the following setting:
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" when you turn on/off goyo, limelight will also be turn on/off.

" Markdown syntax highlighting
" Vim-markdown provides a lot of functionalities such as folding, conceal etc. Here, we mainly use its syntax highlighting feature. Below are some settings for vim-markdown:
" disable header folding
let g:vim_markdown_folding_disabled = 1
" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0
" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1
" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

" This plugin also provides a few shortcuts and commands:
" Shortcut:
" ]]: go to next header
" [[: go to previous header
" Command:
"   Toc: create a vertical window of table of contents
"   TableFormat: format the table under current cursor
" For more settings about these plugins, please consult their documentations.

" Another good Markdown syntax plugin I recommend is vim-pandoc-syntax.
" It provides more syntax highlight and better conceal features.

" It is designed to work with vim-pandoc. To use it as a standalone plugin,
" we should add the following settings in our Neovim configuration file:
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

" Markdown previewing
" do not close the preview tab when switching to other buffers
let g:mkdp_auto_close = 0
" To start previewing a markdown file, use MarkdowPreview command.
" Your default browser will be opened automatically.
" You can also add a custom key mapping for this command:
nnoremap <M-m> :MarkdownPreview<CR>
" For other custom settings, see its documentation.
"    https://github.com/iamcco/markdown-preview.nvim#install--usage
"}}





"{{ HTML(5) settings
" Configure
" Disable event-handler attributes support:
" let g:html5_event_handler_attributes_complete = 0
" Disable RDFa attributes support:
" let g:html5_rdfa_attributes_complete = 0
" Disable microdata attributes support:
" let g:html5_microdata_attributes_complete = 0
" Disable WAI-ARIA attribute support:
" let g:html5_aria_attributes_complete = 0

""}}

"{{ UI: Status line, look
"""""""""""""""""""""""""""vim-airline setting""""""""""""""""""""""""""""""
" Set airline theme to a random one if it exists
let s:candidate_airlinetheme = ['ayu_mirage', 'lucius', 'ayu_dark', 'base16_bright',
      \ 'base16_adwaita', 'jellybeans', 'luna', 'raven', 'term', 'base16_summerfruit']
let s:idx = utils#RandInt(0, len(s:candidate_airlinetheme)-1)
let s:theme = s:candidate_airlinetheme[s:idx]

if utils#HasAirlinetheme(s:theme)
  let g:airline_theme=s:theme
endif

" Tabline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Show buffer number for easier switching between buffer,
" see https://github.com/vim-airline/vim-airline/issues/1149
let g:airline#extensions#tabline#buffer_nr_show = 1

" Buffer number display format
let g:airline#extensions#tabline#buffer_nr_format = '%s. '

" Whether to show function or other tags on status line
let g:airline#extensions#vista#enabled = 1
let g:airline#extensions#gutentags#enabled = 1

" Do not show search index in statusline since it is shown on command line
let g:airline#extensions#anzu#enabled = 0

" Enable vim-airline extension for vim-lsp
let g:airline#extensions#lsp#enabled = 1

" Skip empty sections if there are nothing to show,
" extracted from https://vi.stackexchange.com/a/9637/15292
let g:airline_skip_empty_sections = 1

" Whether to use powerline symbols, see https://vi.stackexchange.com/q/3359/15292
let g:airline_powerline_fonts = 0

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'

" Only show git hunks which are non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" Speed up airline
let g:airline_highlighting_cache = 1

" The key in the following shortcode are the layout when we use a specific
" input method mode. On my macOS, 0 means that we are trying to input Chinese,
" and 1 means we are using English mode.
" See also https://github.com/vim-airline/vim-airline/blob/master/autoload/airline/extensions/xkblayout.vim#L11
let g:airline#extensions#xkblayout#short_codes = {'0': 'CN', '1': 'US'}

""""""""""""""""""""""""""""vim-startify settings""""""""""""""""""""""""""""
" Do not change working directory when opening files.
let g:startify_change_to_dir = 0
let g:startify_fortune_use_unicode = 1

"}}

"{{ Misc plugin setting
""""""""""""""""""""""""""""vim-matchup settings"""""""""""""""""""""""""""""
" Improve performance
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_timeout = 100
let g:matchup_matchparen_insert_timeout = 30

" Enhanced matching with matchup plugin
let g:matchup_override_vimtex = 1

" Whether to enable matching inside comment or string
let g:matchup_delim_noskips = 0

" Show offscreen match pair in popup window
let g:matchup_matchparen_offscreen = {'method': 'popup'}

" Change highlight color of matching bracket for better visual effects
augroup matchup_matchparen_highlight
  autocmd!
  autocmd ColorScheme * highlight MatchParen cterm=underline gui=underline
augroup END

" Show matching keyword as underlined text to reduce color clutter
augroup matchup_matchword_highlight
  autocmd!
  autocmd ColorScheme * hi MatchWord cterm=underline gui=underline
augroup END

"""""""""""""""""""""""""" asyncrun.vim settings """"""""""""""""""""""""""
" Automatically open quickfix window of 6 line tall after asyncrun starts
let g:asyncrun_open = 6
if g:is_win
  " Command output encoding for Windows
  let g:asyncrun_encs = 'gbk'
endif

""""""""""""""""""""""""""""""firenvim settings""""""""""""""""""""""""""""""
if exists('g:started_by_firenvim') && g:started_by_firenvim
  if g:is_mac
    set guifont=Iosevka\ Nerd\ Font:h18
  endif
  " general options
  set laststatus=0 nonumber noruler noshowcmd

  " general config for firenvim
  let g:firenvim_config = {
      \ 'globalSettings': {
          \ 'alt': 'all',
      \  },
      \ 'localSettings': {
          \ '.*': {
              \ 'cmdline': 'neovim',
              \ 'priority': 0,
              \ 'selector': 'textarea',
              \ 'takeover': 'never',
          \ },
      \ }
  \ }

  augroup firenvim
    autocmd!
    autocmd BufEnter *.txt setlocal filetype=markdown
  augroup END
endif

""""""""""""""""""""""""""""""nvim-gdb settings""""""""""""""""""""""""""""""
nnoremap <leader>dp :<C-U>GdbStartPDB python -m pdb %<CR>
"}}
"}
