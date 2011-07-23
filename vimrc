" ##############################################################################
" sety
" ##############################################################################

"brak zgodnosci z VI
set nocompatible

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"dlugosc tabulatora
set tabstop=4
"dlugosc wciec przy autoindent
set shiftwidth=4
"lub wielokrotnosc
set shiftround
"zamieniaj taby na spacje...
set expandtab
"traktuj te poczatkowe spacje jak taby
" set softtabstop=4
set smarttab
"automatyczne wciecia kodu
" set autoindent
"inteligentniejsze niz cindent
" set smartindent
"zeby kolejne wciecia byly takie same
" set copyindent
"jesli wciecie poprzednie bylo spacje, to nastepne tez ma byc spacja
" set preserveindent
"wciecia tak jak w kodzie c-podobnym
"set cindent

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
"nowe okno otwiera sie pod starym
set splitbelow
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
set statusline=%(%r%h%w\ %)%m%f%Y\ \[%ob\]\ \[%{&ff}\]%=%{fugitive#statusline()}\ \ \ \ A:\ %b\ H:\ %B\ \ \ \ \ \ \ %c%V,%l(%L)\ (%p%%)\
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
set wildignore=.svn,CVS,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.git
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
set modeline
set modelines=10
" formatting with par
set formatprg=par\ -T4\ -w140

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
        :set guifont=DejaVu\ Sans\ Mono\ 8
    elseif has("gui_macvim")
        :set guifont=DejaVu\ Sans\ Mono:h11
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

"schemat kolorow
if has('gui_running')
    colorscheme solarized
else
    color evening
endif

"podswietlanie skladni
match Todo /@todo/

"rozpoznawanie typu pliku
filetype plugin indent on

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif



" ##############################################################################
" funkcje pomocnicze
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

" zamiana nazwy pod kursorem z camelcase na wersje z podkreslnikami
function! NameCaseCamelToUnderscore ()
    " zapamietujemy obecna zawartosc rejestru
    let l:old_reg_z = getreg ('z')

    exec ':normal vawh"zx\<esc>'
    let @z = substitute (@z, '\(\u\)', '_\l\1', 'g')
    let @z = substitute (@z, '^_', '', '')
    exec ':normal "zP'

    " przywracamy stara zawartosc rejestru
    call setreg ('z', l:old_reg_z)
    echo
endfunction

" zamiana nazwy pod kursorem z podkreslnikowej na camelcase
function! NameCaseUnderscoreToCamel ()
    " zapamietujemy obecna zawartosc rejestru
    let l:old_reg_z = getreg ('z')

    exec ':normal vawh"zx\<esc>'
    let @z = substitute (@z, '\(_\|\<\)\(\l\)', '\u\2', 'g')
    exec ':normal "zP'

    " przywracamy stara zawartosc rejestru
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
autocmd Filetype * if &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif

au FileType perl set makeprg=perl5.10\ -c\ %\ $*
au FileType php set makeprg=php\ -f\ %\ $*
au FileType ruby set makeprg=ruby\ %s\ $*
au FileType python set makeprg=python2.6\ -tt\ %s\ $*
" au FileType perl,php set errorformat=%f:%l:%m



" ##############################################################################
" mapowanie klawiszy
" ##############################################################################

" klawisz 'leader' ustawiamy na , zamiast normalnego \
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

" zapisz plik poprzez CTRL+S
if !has ('mac')
    map <C-s> :up<cr>
    imap <C-s> <Esc>:up<cr>a
endif

" ,fd zmienia cwd na ten z biezacego pliku
nmap <leader>fd :silent! cd %:p:h<cr><Leader>pwd

" ,l przelacza tryb numeracji linii
nnoremap <leader>l :call ToggleRelativeAbsoluteNumber()<CR>

" ,n usuwa podswietlenie wyszukiwania
nmap <silent> <leader>n :silent noh<CR>

" ,pwd wyswietla na dole biezacy katalog
nmap <leader>pwd :echo getcwd ()<cr>

" ,t zmienia boola (rozne postacie) na przeciwnego
nnoremap <leader>t :call <SID>ToggleYesNo()<CR>

" f7 run TaskList plugin
map <f7> <Plug>TaskList

" yank z liderem powoduje kopiowanie do systemowego schowka
nmap <leader>y "*y
nmap <leader>yy "*yy

" toggle spellchecking
nmap <silent> <leader>s :set spell!<cr>

" Start substitution with word under cursor
nmap <leader>z :%s/\<<c-r><c-w>\>/
vmap <leader>z :<c-u>%s/\<<c-r>*\>/


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


" f1 - przelacza wyswietlanie znakow koncow linii/tabow etc
nmap <f1> :call ToggleOption ('list')<cr>
imap <f1> :call ToggleOption ('list')<cr>a
if has ('mac')
    nmap <d-f1> :call ToggleOption ('list')<cr>
    imap <d-f1> :call ToggleOption ('list')<cr>a
else
    nmap <c-f1> :call ToggleOption ('list')<cr>
    imap <c-f1> :call ToggleOption ('list')<cr>a
end

" f4 - fuzzyfinder (FufFile)
nmap <f4> :FufFile<cr>
" ,j - fuzzyfinder (FufLine
nmap <leader>j :FufLine<cr>

" wyszukiwanie funkcji
map <silent> <F5> :call FindSubs()<CR>
" cmd-f5 powoduje wyswietlenie listy ze znalezionymi wystapieniami szukanego slowa
map <D-f5> [I:let nr = input("Which one: ") <Bar>exe "normal " . nr ."[\t"<cr>
"przeladuj ustawienia klawiszem F6
map <F6> :so $MYVIMRC<cr>
" cmd-f6 niech wczyta biezacy plik
map <D-F6> :so %<cr>
" camel case -> underscore i odwrotnie
nmap <f8> :call ToggleNameCase ()<cr>
" GUndo
nnoremap <f9> :GundoToggle<cr>
" cmd-f9 - przelacza zawijanie linii
map <D-F9> :call ToggleOption('wrap')<cr>

" latwiejsza praca z wcieciami
nnoremap > >>
nnoremap < <<
vmap > >gv
vmap < <gv

" latwiejsze przechodzenie na koniec/poczatek linii
" noremap <C-a> ^
" noremap <C-e> $

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

"dopelnianie z iab'ow za pomoca ctrl+l
imap <c-l> <c-]>

" omnicompletion pod ctrl+spacja
map <c-space> 

"Shift-tab to insert a hard tab
imap <silent> <S-tab> <C-v><tab>

"w trybie edycji wstawia <br /> po wcisnieciu CTRL+ENTER
imap <C-CR> <br />

" mapujemy komendy dla mydevplugins
map <silent> <F3> :call MDP_Commentify_Comment()<CR>
map <silent> <S-F3> :call MDP_Commentify_UnComment()<CR>
map <silent> <F2> :call MDP_Commentify_Switch()<CR>
" map <Leader>p :call MDP_Execute ()<cr>
map <Leader>p <Plug>(quickrun)

" switch ` and ':
" ' jumps to the beginning of the line where is a mark
" ` jumps to the exact location of a mark
" jumping to the exact location is more useful
noremap ' `
noremap ` '

" reformat
nnoremap <leader>q gqip

" Remap :W to :w
command! W w

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

" konfiguracja vimviki
let g:vimwiki_list = [
    \ {'path': $HOME.'/Dropbox/system/.vimwiki_priv/', 'path_html': $HOME.'/Dropbox/system/.vimwiki_priv/html', 'ext': '.vimwiki', 'maxhi': '0'},
    \ {'path': $HOME.'/Dropbox/system/.vimwiki_home/', 'path_html': $HOME.'/Dropbox/system/.vimwiki_home/html', 'ext': '.vimwiki', 'maxhi': '0'},
    \ {'path': $HOME.'/Dropbox/system/.vimwiki_36monkeys/', 'path_html': $HOME.'/Dropbox/system/.vimwiki_36monkeys/html', 'ext': '.vimwiki', 'maxhi': '0'}
    \]
let g:vimwiki_use_mouse = 1

" konfiguracja plugina gundo
let g:gundo_preview_bottom = 1

" solarized colors
let g:solarized_termcolors=256

let snippets_dir=$HOME.'/.vim/snippets'

" quickrun config
let g:quickrun_no_default_key_mappings = 1
let g:quickrun_config = {
\   '_': {
\       'split': '',
\       'into': 1,
\   }
\}

runtime! macros/matchit.vim

if filereadable ($HOME.'/.vimrc.local')
    source $HOME/.vimrc.local
endif

