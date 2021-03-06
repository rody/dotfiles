" Install Vim Plug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
  " Make sure you use single quotes

  " UI {{{
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree'

  " Diff {{{
  Plug 'chrisbra/vim-diff-enhanced'

  " Linting / Formating {{{
  Plug 'w0rp/ale'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'junegunn/vim-easy-align'

  " Autocomplete {{{
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'fszymanski/deoplete-emoji'
  Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }

  " Distraction-free
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'

  " splitjoin
  " Plug 'AndrewRadev/splitjoin.vim'

  " Display function signature in the command line after completion
  Plug 'Shougo/echodoc.vim'

  " Snippets {{{
  " Plug 'Shougo/neosnippet'
  " Plug 'Shougo/neosnippet-snippets'

  " Git {{{
  Plug 'tpope/vim-fugitive'

  " Helpers
  Plug 'tpope/vim-surround'


  " Javascript {{{
  if executable('npm')
    Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern'}
    Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  endif

  " Typescript
  Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }

  " HTML {{{
  Plug 'mattn/emmet-vim'

  " CSS {{{
  " Plug 'othree/csscomplete.vim'
  Plug 'hail2u/vim-css3-syntax'
  Plug 'ap/vim-css-color'

  " Golang {{{
  if executable('go')
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
    Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.local/share/nvim/plugged/gocode/nvim/symlink.sh' }
    Plug 'zchee/deoplete-go', { 'do': 'make'}
    Plug 'sebdah/vim-delve'
  endif

  " Rust {{{
  if executable('rustc')
    Plug 'rust-lang/rust.vim'
    Plug 'sebastianmarkow/deoplete-rust'
  endif

  " Python
  Plug 'zchee/deoplete-jedi'

  " JSON {{{
  Plug 'elzr/vim-json'

  " Concourse Pipeline {{{
  Plug 'luan/vim-concourse'

  " A solid language pack for Vim
  Plug 'sheerun/vim-polyglot'

  " Colorschemes {{{
  Plug 'mhartington/oceanic-next'

  " Apex syntax
  Plug 'ejholmes/vim-forcedotcom'

  " AntlR {{{
  " Plug 'jrozner/vim-antlr'

  " Comments
  Plug 'scrooloose/nerdcommenter'

  " Processing
  Plug 'sophacles/vim-processing'

" Initialize plugin system
call plug#end()

filetype indent plugin on
syntax on

source ~/.config/nvim/config/plugins/language-client.vim
source ~/.config/nvim/config/plugins/deoplete.vim
source ~/.config/nvim/config/plugins/tern_for_vim.vim
source ~/.config/nvim/config/plugins/ale.vim
source ~/.config/nvim/config/plugins/neosnippet.vim
source ~/.config/nvim/config/plugins/html5.vim
source ~/.config/nvim/config/plugins/vim-jsx.vim
source ~/.config/nvim/config/plugins/nerdtree.vim
source ~/.config/nvim/config/plugins/fzf.vim
source ~/.config/nvim/config/plugins/vim-diff-enhanced.vim
source ~/.config/nvim/config/plugins/vim-go.vim
source ~/.config/nvim/config/plugins/vim-polyglot.vim
source ~/.config/nvim/config/plugins/oceanic-next.vim
source ~/.config/nvim/config/plugins/goyo.vim
source ~/.config/nvim/config/plugins/limelight.vim
source ~/.config/nvim/config/plugins/vim-delve.vim
