" script um Daten aus Datei auszulesen und als 
" latex table zu formatieren
" Hans-Peter Meiser
" 2.9.2011
"
" es fehlt noch:
" - relativer Pfad der Datei
" - Dateiname als Parameter
" - Formatierung (==)
"
echo "hallo"
normal i _start__end_
normal k

:r data.dat
normal gg

"/_start_
"normal V
"/_end_

" normal gv
:/_start_/;/_end_/s/\>\s*\</ \& /g
" :'<,'>s/\>\s*\</ \& /g

"/_start_
"normal V
"/_end_
"normal gv
:/_start_/;/_end_/s/$/ \\\\ \\hline/
:/_start_/;/_end_/g/^# /d
:/_start_/;/_end_/s/## //

normal gv ==
g/_start_/d
g/_end_/d
