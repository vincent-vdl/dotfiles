execute pathogen#infect()

syntax on

set cursorline
set clipboard=unnamed
set background=dark
set autoread
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set cc=100
set ruler
set mouse=a
set backspace=indent,eol,start
set foldmethod=indent

filetype plugin indent on

let perl_sub_signatures = 1

let g:dracula_italic = 0
let g:enable_italic_font = 0
let g:hybrid_transparent_background = 0

set termguicolors
colorscheme OceanicNext

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" vim-rest-console
let g:vrc_curl_opts = {
  \ '-sS': '',
  \ '--connect-timeout': 10,
  \ '-i': '',
  \ '--max-time': 60,
  \ '-k': '',
\}
let b:vrc_output_buffer_name = '__VRC_OUTPUT__'
let b:vrc_response_default_content_type = 'application/json'

" vim-fugitive
set diffopt+=vertical
let g:fugitive_summary_format = "%ad | %an\t%s"

function! ToggleSpellLang()
    if &spelllang =~# 'en'
        :set spelllang=fr
    else
        :set spelllang=en
    endif
endfunction

"function! WebPreferences()
"    set shiftwidth=2
"    set tabstop=2
"endfunction

function CenterPane()
    lefta vnew
    wincmd w
    exec 'vertical resize '. string(&columns * 0.75)
endfunction

" LaTeX
let g:tex_flavor='latex'

let mapleader =  ','
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>t :CtrlPTag<CR>

"nnoremap <F7> :setlocal spell!<CR>
"nnoremap <F8> :call ToggleSpellLang()<CR>
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

inoremap <F6> <C-R>=strftime("---%d/%m/%y %H:%M---")<CR>
nnoremap <C-n> :NERDTreeToggle<CR>

" let g:cobol_syntax_checker_cobc_compiler_option = '-free'
"hi CursorLine  cterm=NONE ctermbg=Black

autocmd BufNewFile,BufRead *.md  setlocal nu! tw=80 wrapmargin=2 cc=81
autocmd BufNewFile,BufRead *.txt setlocal nu! tw=80 wrapmargin=2 cc=81
"autocmd BufNewFile,BufRead *.js,*.html,*.erb,*.css,*.scss  call WebPreferences()
"autocmd BufWritePost *.js AsyncRun -post=checktime ./be/node_modules/.bin/eslint --fix %
"autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" UltiSnip
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetDirectories=["usersnips"]
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

let g:asyncrun_open = 8

" CtrlP
call ctrlp_bdelete#init()
set wildignore+=*/.git,*/node_modules/*
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|.tar|.gz)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }
let g:ctrlp_cmd='CtrlP .'

" ripgrep
if executable('rg')
    let g:ctrlp_user_command = 'rg %s --files --hidden --glob ""'
endif

" CtrlSF
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_default_root = 'project'

" vim-gitgutter
set signcolumn=yes

" Indent
let g:indentLine_char = '|'
let g:indentLine_color_term = 236

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1

"ALE
let g:ale_fixers = {
  \ 'javascript': ['eslint'],
  \ 'css': ['stylelint'],
  \ 'scss': ['stylelint'],
  \ 'python': ['autopep8'],
  \ }

let g:ale_python_autopep8_options = '--aggressive --aggressive'

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
nnoremap <silent> <leader>aj :ALENext<CR>
nnoremap <silent> <leader>ak :ALEPrevious<CR>
nnoremap <silent> <leader>a<Space> :ALEFix<CR>

highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
