" Configuration for Vundle
set nocompatible    " be iMproved, required
filetype off        " required
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
"Plugin list
"-------------------------
" Vundle
Plugin 'gmarik/Vundle.vim'

" Solarized
Plugin 'altercation/vim-colors-solarized'

" Syntastic
Plugin 'scrooloose/syntastic'

" Nerdtree
Plugin 'scrooloose/nerdtree'

" NerdCommenter
Plugin 'scrooloose/nerdcommenter'

" Supertab
Plugin 'ervandew/supertab'

" CtrlP
Plugin 'kien/ctrlp.vim'

"-------------------------
call vundle#end()
filetype plugin indent on
" end of configuration for Vundle


" Configuration file for vim
set modelines=0		" CVE-2007-2438

set lines=32
set columns=80

" 调整ctrl＋p的补全模式
set completeopt=menu,longest,preview
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

syn on                      "语法支持

"common conf {{             通用配置
set ai                      "自动缩进
set bs=2                    "在insert模式下用退格键删除
set showmatch               "代码匹配
set laststatus=2            "总是显示状态行
set expandtab               "以下三个配置配合使用，设置tab和缩进空格数
set shiftwidth=4
set tabstop=4
set cursorline              "为光标所在行加下划线
set number                  "显示行号
set autoread                "文件在Vim之外修改过，自动重新读入
set et                      "编辑时将tab替换为空格
set smarttab                "按一次退格键删除4个空格

set ignorecase              "检索时忽略大小写
set encoding=utf-8
set fileencodings=uft-8     "使用utf-8或gbk打开文件
set hls                     "检索时高亮显示匹配项
set helplang=cn             "帮助系统设置为中文
set foldmethod=syntax       "代码折叠
"}}

"conf for tabs, 为标签页进行的配置，通过ctrl h/l切换标签等
let mapleader = "\<space>"
nnoremap <C-l> gt
nnoremap <C-h> gT
nnoremap <leader>t : tabe<CR>

"conf for plugins {{ 插件相关的配置
"状态栏的配置 
"powerline{
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
let g:Powerline_symbols = 'fancy'
"}
"}}

filetype plugin on

"用Syntastic检查语法错误，调用Python的pep8和pylint
let g:syntastic_check_on_open = 1
let g:syntastic_python_checkers = ['pep8', 'pylint']

"设定字体
set guifont=Monaco:h16

"将<leader>+2映射为nerdtree的快捷键
map <leader>2 :NERDTreeToggle<CR>

"将<leader>+9映射为exec python的快捷键
autocmd FileType python nnoremap <buffer> <leader>9 :exec '!python' shellescape(@%, 1)<CR>

let g:C_UseTool_cmake = 'yes'
let g:C_UseTool_doxygen = 'yes'

let g:ctrlp_map = '<c-p>'
let g:ctrl_cmd = 'CtrlP'

syntax enable
set background=light
colorscheme solarized

" Set indentation for Python
autocmd FileType python setlocal foldmethod=indent

" Allow saving of files as sudo when I forget to start vim using sudo.
cmap w!! w !sudo tee %

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup
