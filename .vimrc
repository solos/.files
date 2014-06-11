language messages zh_CN.utf-8

let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936 
"非Vi一致性模式
set nocompatible
set fileformat=unix

set mouse=v

"gVIM
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"去除gVim中的Toolbar
"set guioptions-=T
set guifont=文泉驿等宽微米黑\ 16

set writebackup 
set nobackup
set noautoindent
"vimim 输入法设置
"let g:vimim_static_input_style=1

filetype on

autocmd BufRead *.py	set smarttab
autocmd BufRead *.py	set expandtab
autocmd BufRead *.py	set tabstop=4

set shiftwidth=4
set softtabstop=4

set tabstop=4
set expandtab

"set smartindent
"set cindent
set number
set showmatch
set incsearch
set hlsearch
set nocp
"let g:neocomplcache_enable_at_startup = 1
syntax on
syntax enable

"在插入模式中使用Ctrl+v粘贴全局剪贴板内容
inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>
"在Visual模式中使用Ctrl+c复制内容到全局剪贴板
vnoremap <C-c> "+y
"在Visual模式中使用Ctrl+x剪切内容到全局剪贴板
vnoremap <C-x> "+x

"在插入模式中使用Shift+v粘贴缓冲区内容
inoremap <S-v> <esc>:set paste<cr>mui<C-R>*<esc>mv'uV'v=:set nopaste<cr>
"在Visual模式中使用Shift+c复制内容到缓冲区
vnoremap <S-c> "*y
"在Visual模式中使用Shift+x剪切内容到缓冲区
vnoremap <S-x> "*x

set cscopequickfix=s-,c-,d-,i-,t-,e-

filetype plugin on
map <F7> :NERDTreeToggle<CR>
imap <F7> <ESC>:NERDTreeToggle<CR>

let python_no_builtin_highlight = 1 
let python_no_doctest_code_highlight = 1 
let python_no_doctest_highlight = 1 
let python_no_exception_highlight = 1 
let python_no_number_highlight = 1 
let python_space_error_highlight = 1

"let g:solarized_termcolors=256
set background=dark
colorscheme solarized

au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview

execute pathogen#infect()


let g:input_toggle = 1
function! Fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction

function! Fcitx2zh()
   let s:input_status = system("fcitx-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx-remote -o")
      let g:input_toggle = 0
   endif
endfunction

set timeoutlen=150
autocmd InsertLeave * call Fcitx2en()
"autocmd InsertEnter * call Fcitx2zh()

set rtp+=$GOROOT/misc/vim
filetype plugin on
