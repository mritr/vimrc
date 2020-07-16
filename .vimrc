nnoremap <silent> M :%s/\r//g<CR>
nnoremap <C-Tab> :bnext<CR>
nnoremap <C-A> :qa<CR>
nnoremap <C-H> :%!xxd<CR>
" map M :%s/\r//g
map C :%s/   //g

filetype plugin on
:set nocompatible
:set viminfo='20,\"5000
:set history=100
:set ruler
:set number
:colorscheme fruity
:set ic
:set tabstop=2
:set expandtab
:set shiftwidth=2
:set autoindent
:set smartindent
:set ignorecase
:filetype on
:set vb t_vb=".
:set incsearch
:set showmatch
:syntax on
:let php_folding = 1
:let php_baselib = 1
:let php_sql_query = 1
:let php_htmlInStrings = 1

:highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
:match OverLength '\%81v.*'
:autocmd FileType make set noexpandtab

" Insert <Tab> or complete identifier
" if the cursor after a keyword character
function MyTabOrComplete()
  let col = col('.')-1
  if !col || getline('.')[col-1] !~ '\k'
    return "\<tab>"
  else
    return "\<C-N>"
  endif
endfunction

inoremap <Tab> <C-R>=MyTabOrComplete()<CR>

if has("autocmd")
	" Drupal *.module files.
   augroup module
     autocmd BufRead *.module set filetype=php
   augroup END

   augroup validate
     autocmd BufRead *.validate set filetype=php
   augroup END
endif

" Return to previous state after exiting.
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif
