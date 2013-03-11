noremap <buffer> <LocalLeader>c oprint('<pre>');<CR>print_r();<CR>print('</pre>');
noremap <buffer> <LocalLeader>t a '<td>'..'</td>';
inoremap <buffer> <C-P> <Esc>:call PhpDocSingle()<CR>i
nnoremap <buffer> <C-P> :call PhpDocSingle()<CR>
vnoremap <buffer> <C-P> :call PhpDocRange()<CR>
let g:pdv_cfg_Uses = 1
