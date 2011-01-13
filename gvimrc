" domyslny rozmiar okna
se lines=62
se columns=196
"ustawienia guiowe
set guioptions=bcegimrL
" taby - numer taba, czy zmodyfikowany, nazwa pliku (bez ścieżki)
set guitablabel=%N.\ %m%t

if has ("gui_macvim")
    " w fullscreenie chcemy domyslnie wykorzystac tyle miejsca ile sie da
    se fuoptions=maxvert,maxhorz
endif
