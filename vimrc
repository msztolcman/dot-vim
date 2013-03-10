" ##############################################################################
" sets
" ##############################################################################

" disable vi mode compatibility
set nocompatible

" start pathogen - our bundles are in ~/.vimrc/bundle
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" number of spaces that a <Tab> in the file counts for
set tabstop=4
" number of spaces to use for each step of (auto)indent
set shiftwidth=4
" round indent to multiple of 'shiftwidth'
set shiftround
" use the appropriate number of spaces to insert a <Tab>
set expandtab
"traktuj te poczatkowe spacje jak taby
set smarttab

"jak ma dzialac backspace
set backspace=indent,eol,start
"ile polecen ma trzymac w historii
set history=1024
"ile poziomow undo
set undolevels=65536
"nie bedzie beepal tylko migal przy bledzie
set visualbell
"format konca linii
set fileformat=unix
"numerowanie wierszy
set number
"kolumna z numerami wierszy ma miec minimum 3 znaki
set numberwidth=5
"nie bedzie lamal linii w srodku wyrazow
set linebreak
"zawijaj wiersze
set wrap
"zawsze wyswietli linie statusu
set laststatus=2
"wyswietli aktualna komende
set showcmd
"wyswietli aktualna pozycje kursora
set ruler
"pokaze tryb pracy
set showmode
"podswietl wyniki wyszukiwania
set hlsearch
"stopniowa pokazuje wyniki wyszkuwania
set incsearch
"pozwala kursorowi przechodzic poprzez koneic linii pietro wyzej
set whichwrap=b,s,<,>,[,],~
"wylacza tworzenie kopii zapasowych plików
set nobackup
"ciemny schemat kolorow
set background=dark
"poczatek linii zaczyna sie w miejscu pierwszego nie-bialego znaku
set startofline
"vim zmienia aktualny katalog na ten, w ktorym znajduje sie obecnie edytowany plik
" set autochdir
"wyszukiwanie bez wzgledu na wielkosc liter
set ignorecase
"zignoruje ignorecase jesli w wyszukiwanym tekscie znajduje sie wielkie litery
set smartcase
"domyslnie nie pokazuj znakow konca linii i tabow
set nolist
"ale jesli, to w okreslony sposob
set lcs=eol:$,tab:‡›,trail:•,nbsp:.
" When splitting, put new windows to the right (vertical) or below (horizontal)
set splitbelow splitright
"zeby nie zwijal domyslnie foldow
set foldmethod=manual
" kolumna z liniami foldow z lewej
" set foldcolumn=8
" limit zaglebien foldow
set foldnestmax=8
" rozwijamy wszystkie foldy domyslnie
set foldlevelstart=100
" nmap <F9> set foldcolumn=0<CR>
" nmap <S-F7> set foldcolumn=8<CR>
" foldy nie maja ignorowac haszy
"set foldignore=''
"musi byc tyle zmienionych linii, zeby pokazywal info o zmienionym pliku (0 dla zawsze)
set report=0
"w trybie zaznaczenia blokowego kursor mozna wstawic w dowolnym miejscu
set virtualedit=block
"nawiasy
"wpisujac ktorys z nawaisow zdefiniowanych w matchpairs, pokazuje gdzie jest jego konczacy sie nawias
set showmatch
"jak dlugo ma to pokazywac
set matchtime=5
"jakie znaki tworza pary
set matchpairs=(:),{:},[:],<:>
" don't insert 2 spaces after punctuation
set nojoinspaces
"ustawiamy wyglad linii statusu
set statusline =%(%r%h%w\ %)                        " file info
set statusline+=%m%f%Y\ \[%ob\]\ \[%{&ff}\]         " file size, format
set statusline+=%=                                  " align to right
" set statusline+=[%{SyntasticStatuslineFlag()}]\     " syntastic
set statusline+=%{fugitive#statusline()}            " fugitive
set statusline+=\ \ \ \                             " spaces
set statusline+=A:\ %b\                             " value in ASCII code
set statusline+=H:\ %B\ \ \ \ \ \ \                 " value in hex
set statusline+=%c%V,%l(%L)\ (%p%%)
"klawisz którym przełączamy siê miêdzy trybem paste a nopaste
set pastetoggle=<F10>
"zachowanie sie klawiszy ALT - prawy daje pliterki, lewy otwiera menu
set winaltkeys=yes
" pasek z tabami zawsze widoczny
set showtabline=2
" podswietlenie wiersza w ktorym jest kursor - strasznie wolne :(
set nocursorline
" podswietlenie kolumny
set nocursorcolumn
" w trybie komend pokazuje liste opcji po wcisnieciu tabulatora
set wildmenu
" ignore: VCS
set wildignore=.svn,CVS,.git,.hg
" ignore: images
set wildignore+=*.jpg,*.jpeg,*.gif,*.bmp,*.png,*.xpm
" ignore: compiled
set wildignore+=*.o,*.a,*.class,*.so,*.obj,*.la
" ignore: vim
set wildignore+=*.sw?
" ignore: python, perl
set wildignore+=*.pyc,*.pyo,*.pmc
" OSX bullshit
set wildignore+=*.DS_Store
" jeśli zawartość paragrafu jest zbyt długa, pokaż go (zamiast @)
set display+=lastline
" rozrozniamy takie kodowania:
set fileencodings="utf8,latin2,default,latin1"
" activate mouse in all modes
set mouse=a
" hide mouse pointer when write
set mousehide
" prawy przycisk myszy rozszerza zaznaczenie
set mousemodel=extend
" pozwalamy na otworzenie max tabpagemax zakladek naraz z linii komend
set tabpagemax=100
" don't always keep windows at equal size
set noequalalways
" show how many number of lines was changed
set report=0
"zaznaczanie tekstu
"caly zestaw rzeczy, zeby zaznaczanie dzialalo jak powinno...
set selection=inclusive
"zaczynamy wciskajac v lub V, pozniej kursorami
set selectmode=key
"zaznaczamy dalej, na koniec y(copy), d(cut).  p(paste) wkleja
set keymodel=startsel
"ustawienia dotyczace viminfo
set viminfo='1000,f1,\"500,:256,/128
"zaokraglamy wciecia do wielokrotnosci shiftwidth
set shiftround
"showbreak chcemy w kolumnie z numerami wierszy
set cpoptions+=n
"znak wskazujacy na kontynuacje linii
set showbreak=\ \ \ ¬\ "
" jesli sprawdzamy pisownie, to uzywamy polskiego
set spelllang=pl
set nospell
" chcemy zapisywac pliki tymczasowe/backupy w jednym miejscu
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
" jako grep uzywamy programu:
set grepprg="egrep -in"
" wyladuj bufor jesli jest zamykana zakladka
set nohidden
set switchbuf=usetab,newtab
set modeline
set modelines=10
" formatting with par
set formatprg=par\ -T4\ -w140
" default comment style
set commentstring=#\ %s
" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo,hor
" Syntax coloring lines that are too long just slows down the world
set synmaxcol=400

if has ('persistent_undo')
    " persistent undo
    set undofile
    set undodir=~/.vim/undo
endif

if exists ('&cryptmethod')
    " jesli szyfrujemy, to dobra metoda
    set cryptmethod=blowfish
endif

" proba ustawienia fonta:
if has('gui_running')
    if has('gui_gtk2')
        set guifont=DejaVu\ Sans\ Mono\ 8
    elseif has("gui_macvim")
        set guifont=DejaVu\ Sans\ Mono:h11
    endif
endif

" dla windows: ulatwia kopiowanie do innych programow
if has ("Win32")
    set clipboard=unnamed
endif

" Text editors on Mac OS X lets the user hold down shift+movement key to extend
" the selection.  Also, pressing a printable key whilst selecting replaces the
" current selection with that character.
" baaardzo niewygodne, powoduje ze po wcisnieciu v, i strzalki w lewo/prawo,
" wychodzimy z trybu zaznaczania (visual)...
" if has ("gui_macvim")
"     let macvim_hig_shift_movement = 0
" endif

" ##############################################################################
" inne ustawienia
" ##############################################################################

"~/.vim/doc jako dodatkowy katalog z dokumentacją
if isdirectory ($HOME . '/.vim/doc')
    helptags ~/.vim/doc
endif

syntax enable
" Slower but better syncing -- hopefully no more dumb broken syntax
syntax sync fromstart

"schemat kolorow
colorscheme Tomorrow-Night

"podswietlanie skladni
match Todo /@todo/

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

"rozpoznawanie typu pliku
filetype plugin indent on

if !exists (":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif



" ##############################################################################
" helper functions
" ##############################################################################

" wyszukiwanie funkcji w pliku
function! FindSubs()
    if exists ("g:find_subs__window_opened") && g:find_subs__window_opened
        let g:find_subs__window_opened=0
        lclose
        return
    else
        let g:find_subs__window_opened=1
    endif

    if &ft == 'vim'
        lvimgrep /\(end\)\@<!fun\(ction\|\>\)!\?/j %
    elseif &ft == 'java' || &ft == 'php' || &ft == 'html' || &ft == 'js'
        lvimgrep /\<function[\t ]\+\w\+[\t ]*(/j %
    elseif &ft == 'python' || &ft == 'ruby'
        lvimgrep /^[\t ]*def[\t ]\+\w\+[\t ]*(.*)[\t ]*:/j %
    elseif &ft == 'perl'
        lvimgrep /^[\t ]*sub[\t ]\+\w\+/ %
    elseif &ft == 'lua'
        lvimgrep /^\([\t ]*function[\t ]\+\w\+[\t ]*(\|.*\w\+[\t ]*=[\t ]*function[\t ]*(\)/j %
    else
        return
    endif

    lopen
endfunction

"<home> toggles between start of line and start of text
function! Home ()
    let curcol = wincol()
    normal ^
    let newcol = wincol()
    if newcol == curcol
        normal 0
    endif
endfunction

" sprawdzanie czy dane element jest w podanej tablicy
function! InArray (value, array)
    return count (a:array, a:value) > 0
endfunction

" replace CamelCase name into 'underscored'
function! NameCaseCamelToUnderscore ()
    " save current z register content into variable
    let l:old_reg_z = getreg ('z')

    exec ':normal vawh"zx\<esc>'
    let @z = substitute (@z, '\(\u\)', '_\l\1', 'g')
    let @z = substitute (@z, '^_', '', '')
    exec ':normal "zP'

    " restore old z register content
    call setreg ('z', l:old_reg_z)
    echo
endfunction

" replace 'underscored' name to CamelCase
function! NameCaseUnderscoreToCamel ()
    " save current z register content into variable
    let l:old_reg_z = getreg ('z')

    exec ':normal vawh"zx\<esc>'
    let @z = substitute (@z, '\(_\|\<\)\(\l\)', '\u\2', 'g')
    exec ':normal "zP'

    " restore old z register content
    call setreg ('z', l:old_reg_z)
    echo
endfunction

" funkcja ustawia kolor za 140 kolumna, jesli edytowany plik ma typ zawarty w
" ponizszej zmiennej
let s:prgm_filetypes = ['perl', 'php', 'python', 'javascript', 'vim', 'cpp', 'c', 'java', 'cs', 'ruby']
highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
function! SetOverLength()
    if !&bin && &ft != '' && InArray (tolower (&ft), s:prgm_filetypes)
        if v:version >= 703
            se colorcolumn=141
        else
            match OverLength '\%141v.*'
        endif
    else
        if v:version >= 703
            se colorcolumn=
        else
            match None '\%141v.*'
        endif
    endif
endfunction

" funkcja do tworzenia folderow - uzywane aby utworzyc np folder backup czy
" tempy jesli ich jeszcze nie ma
function! SafeCreateDir (dirpath)
    if !exists("*mkdir")
        echo "mkdir function does not exists, exiting"
        return
    endif

    let l:item = ''
    for l:item in split (a:dirpath, ',')
        if isdirectory (l:item)
            return
        elseif mkdir (l:item, "p", 0700)
            echo "Directory " . l:item . " created"
            return
        endif
    endfor

    echo "Cannot create directory" + dirpath
endfunction

" usuwanie koncowych bialych znakow przy zapisie
function! StripSpaces(...)
    if !a:0 || !a:1 || (!&bin && &ft != '' && InArray (tolower (&ft), s:prgm_filetypes))
        let l:old_line = line('.')
        let l:old_col  = col ('.')
        let l:old_search = @/

        %s/\s\+$//e
"         call histdel("/", -1)
        let @/ = l:old_search
        silent noh
        call cursor (l:old_line, l:old_col)
    endif
endfunction

"pozwala na zwijanie i rozwijanie foldow jednym klawiszem (podmapowana ponizej spacja)
function! ToggleFold()
    if foldlevel('.') == 0
        normal! l
    else
        if foldclosed('.') < 0
            . foldclose
        else
            . foldopen
        endif
    endif
    " Clear status line
    echo
endfunction

" przelacza napis pod kursorem z wersji camel case -> z podkreslnikami i
" odwrotnie
function! ToggleNameCase ()
    let l:name = expand ('<cword>')
    if match (l:name, '_') > -1
        call NameCaseUnderscoreToCamel ()
    else
        call NameCaseCamelToUnderscore ()
    endif
endfunction

" pozwala na przelaczanie podanej jako argument opcji
function! ToggleOption (option)
    execute 'set ' . a:option . '!'
    execute 'echo "' . a:option . ':" strpart("offon",3*&' . a:option .  ',3)'
endfunction

" przelacza numerowanie linii z abs na relatywne i odwrotnie
function! ToggleRelativeAbsoluteNumber()
    if &number
        set relativenumber
    else
        set number
    endif
endfunction

" przelacza wartosc pod kursorem z jednej wartosci bool na druga
function! s:ToggleYesNo()
    let l:w=expand("<cword>")
    let l:bools = {
        \ "yes": "no",
        \ "no": "yes",
        \ "on": "off",
        \ "off": "on",
        \ "manual": "auto",
        \ "auto": "manual",
        \ "1": "0",
        \ "0": "1",
        \ "enabled": "disabled",
        \ "disabled": "enabled",
        \ "true": "false",
        \ "false": "true",
        \ "True": "False",
        \ "False": "True",
    \ }

    if has_key (l:bools, l:w)
        exec "normal! \"_ciw\<C-R>=l:bools[l:w]\<CR>\<Esc>b"
    endif
endfunction



" ##############################################################################
" autokomendy
" ##############################################################################

" inny/nowy bufor zawsze w trybie normal
au BufNew,BufEnter * stopinsert

" rozpoznajemy mako
au BufNewFile,BufRead *.mako set ft=mako
" szablony jako html
au BufNewFile,BufRead *.tpl  set filetype=tpl syntax=html
" json jako javascript
au BufNewFile,BufRead *.json set filetype=json syntax=javascript
" nginx
au BufRead,BufNewFile /etc/nginx/* setlocal ft=nginx

"pliki szablonow przy nowo tworzonych plikach
autocmd BufNewFile * sil! exe "read ~/.vim/templates/"
   \ . expand("<afile>:e") | 1d |
   \ sil! exe "source ~/.vim/templates/".expand("<afile>:e").".vim"
autocmd BufNewFile index.html sil! read ~/.vim/templates/index.html | 1d
autocmd BufNewFile index.tpl sil! read ~/.vim/templates/index.html | 1d

"kazdy plik otwiera sie w miejscu jego ostatniej edycji, poza commitami svn
au BufReadPost * if &filetype !~ 'commit\c' && &filetype != "SVN" && line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" wszystko co poza 140 kolumna podswietlamy jak blad
autocmd BufReadPost,BufWrite * call SetOverLength()

autocmd BufWrite * call StripSpaces(1)

" better omnicomplete
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd Filetype * if &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif

au FileType perl set makeprg=perl5.12\ -c\ %\ $*
au FileType php set makeprg=php\ -f\ %\ $*
au FileType ruby set makeprg=ruby\ %s\ $*
au FileType python set makeprg=python2.7\ -tt\ %s\ $*
" au FileType perl,php set errorformat=%f:%l:%m



" ##############################################################################
" mapowanie klawiszy
" ##############################################################################

" map <leader> key from default \ (backslash) to , (comma)
let mapleader = ','

" uzywac zamiast 'y' (yank) do przenosznia czesci tekstu z jednego pliku do
" drugiego (yank pozwala na max 50 linii, i nie pozwala robic tego na zywo,
" przy edytowanych obydwoch plikach jednoczesnie w dwoch roznych instancjach
" vima)
if has("unix")
    nmap <leader>r   :r $HOME/.vimxfer<CR>
    nmap <leader>w   :'a,.w! $HOME/.vimxfer<CR>
    vmap <leader>r   c<esc>:r $HOME/.vimxfer<CR>
    vmap <leader>w   :w! $HOME/.vimxfer<CR>
elseif has("Win32")
    nmap <leader>r   :r ~/.vimxfer<CR>
    nmap <leader>w   :'a,.w! ~/.vimxfer<CR>
    vmap <leader>r   c<esc>:r ~/.vimxfer<cr>
    vmap <leader>w   :w! ~/.vimxfer<CR>
endif

" save file with <c-s>
if !has ('mac')
    map <C-s> :up<cr>
    imap <C-s> <Esc>:up<cr>a
endif

" ,fd switch current working directory to parent of currently edited file
nmap <leader>fd :silent! cd %:p:h<cr><Leader>pwd

" ,l przelacza tryb numeracji linii
nnoremap <silent> <leader>l :call ToggleRelativeAbsoluteNumber()<CR>

" ,n remove search highlinth
nmap <silent> <leader>n :silent noh<CR>

" ,pwd prints current working directory
nmap <leader>pwd :echo getcwd ()<cr>

" ,t zmienia boola (rozne postacie) na przeciwnego
nnoremap <leader>t :call <SID>ToggleYesNo()<CR>

" f7 run TaskList plugin
map <f7> <Plug>TaskList

" ,g calls registers list (tpope/tregisters)
map <leader>g :TRegisters<CR>

" use <leader>y to copy to system clipboard
nmap <leader>y "*y
nmap <leader>yy "*yy

" toggle spellchecking
nmap <silent> <leader>S :set spell!<cr>

" Start substitution with word under cursor
nmap <leader>z :%s/\<<c-r><c-w>\>/
vmap <leader>z :<c-u>%s/\<<c-r>*\>/

" search for vcs markers
nmap <leader>vcs /\(<<<<\\|====\\|>>>>\)<cr>

"zawiniete linie - przechodzenie miedzy wierszami
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" ctrl+down/up przesuwa kursor w dol/gore wraz ze scrollowaniem
map <silent> <S-Down> 1<C-d>:set scroll=0<CR>
map <silent> <S-Up> 1<C-U>:set scroll=0<CR>
imap <silent> <S-Down> <Esc>1<C-d>:set scroll=0<CR>I
imap <silent> <S-Up> <Esc>1<C-U>:set scroll=0<CR>I

" ctrl+shift+up|down zamienia miejscami dwie linie
nmap <C-S-Down> :<C-u>move .+1<CR>
nmap <C-S-Up> :<C-u>move .-2<CR>
imap <C-S-Down> <C-o>:<C-u>move .+1<CR>
imap <C-S-Up> <C-o>:<C-u>move .-2<CR>
vmap <C-S-Down> :move '>+1<CR>gv
vmap <C-S-Up> :move '<-2<CR>gv


" f1 - przelacza zawijanie linii
map <F1> :call ToggleOption('wrap')<cr>
" c-f1 - przelacza wyswietlanie znakow koncow linii/tabow etc
nmap <c-f1> :call ToggleOption ('list')<cr>
imap <c-f1> :call ToggleOption ('list')<cr>a

" ,ff - fuzzyfinder (FufFile)
nmap <Leader>ff :FufFile<cr>
" ,fl - fuzzyfinder (FufLine)
nmap <leader>fl :FufLine<cr>

" wyszukiwanie funkcji
map <silent> <F5> :call FindSubs()<CR>
" ctrl-f5 powoduje wyswietlenie listy ze znalezionymi wystapieniami szukanego slowa
map <c-f5> [I:let nr = input("Which one: ") <Bar>exe "normal " . nr ."[\t"<cr>
"przeladuj ustawienia klawiszem F6
map <F6> :so $MYVIMRC<cr>
" ctrl-f6 niech wczyta biezacy plik
map <c-F6> :so %<cr>
" camel case -> underscore i odwrotnie
nmap <f8> :call ToggleNameCase ()<cr>
" GUndo
nnoremap <f9> :GundoToggle<cr>

" latwiejsza praca z wcieciami
nnoremap > >>
nnoremap < <<
vmap > >gv
vmap < <gv

"zapewniamy sobie przesuwanie zahaszowanych linijek przy tabowaniu
inoremap # X#

" Make p in Visual mode replace the selected text with the "" register.
" vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" latwiejszy folding
noremap <space> :call ToggleFold()<CR>
vmap <space> zf<CR>

" home przenosi do pierwszej kolumny nie bedacej bialym znakiem
imap <khome> <home>
nmap <khome> <home>
inoremap <silent> <home> <C-O>:call Home()<CR>
nnoremap <silent> <home> :call Home()<CR>

" po ctrl+[np] enter nie wstawi znaku nowej linii, tylko zaznaczony tekst
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"Shift-tab to insert a hard tab
imap <silent> <S-tab> <C-v><tab>

"w trybie edycji wstawia <br /> po wcisnieciu CTRL+ENTER
imap <C-CR> <br />

" mapujemy komendy dla mydevplugins
map <silent> <F3> :TComment!<CR>
map <silent> <F2> :TComment<CR>

" run quickrun plugin with ,p
map <Leader>p <Plug>(quickrun)

" switch ` and ':
" ' jumps to the beginning of the line where is a mark
" ` jumps to the exact location of a mark
" jumping to the exact location is more useful
noremap ' `
noremap ` '

" reformat
nnoremap <leader>q gqip

" tabularize plugin
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>

" Remap :W to :w
command! W w

" przeladowanie snippetow
nmap <silent> ,rs :call ReloadAllSnippets ()<CR>

" easy play with windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" mappings for splitjoin plugin (https://github.com/AndrewRadev/splitjoin.vim.git)
nmap <Leader>j :SplitjoinJoin<cr>
nmap <Leader>s :SplitjoinSplit<cr>

" ##############################################################################
" pozostale
" ##############################################################################

" nie mrygający kursor
let &guicursor = &guicursor . ",a:blinkon0"

" upewniamy sie ze istnieja potrzebne nam foldery
call SafeCreateDir (&backupdir)
call SafeCreateDir (&directory)
if has ('persistent_undo')
    call SafeCreateDir (&undodir)
endif

" konfiguracja plugina gundo
let g:gundo_preview_bottom = 1

" solarized colors
let g:solarized_termcolors=256
let g:solarized_contrast="high"

let snippets_dir=$HOME.'/.vim/snippets'

" SmartusLine configuration
let g:smartusline_string_to_highlight = '%f%Y [%ob] [%{&ff}]'
if &t_Co < 255
    let g:smartusline_hi_insert = 'guibg=orange guifg=black ctermbg=cyan ctermfg=black'
endif

" quickrun config
let g:quickrun_no_default_key_mappings = 1
let g:quickrun_config = {
\   '_': {
\       'split': '',
\       'into': 1,
\   }
\}

" LargeFile definition
let g:LargeFile = 6

" tComment configuration
let g:tcommentBlankLines = 1
let g:tcommentOptions = {'col': 1}
let g:tcommentLineC = {
    \ 'commentstring': '// %s',
    \}

" pydoc config
let g:pydoc_perform_mappings = 0
let g:pydoc_highlight = 1
let g:pydoc_open_cmd = 'split'

" pep8
let g:pep8_map='<leader>k'

" gist
let g:gist_clip_command = 'pbcopy'

" showmarks
let g:showmarks_include = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.`' + "'"

" vim-gitgutter
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 0

runtime! macros/matchit.vim

if filereadable ($HOME.'/.vimrc.local')
    source $HOME/.vimrc.local
endif

