mkdir cleantf2
move cfg cleantf2\
move materials cleantf2\
move models cleantf2\
move scripts cleantf2\
copy dev\ref\vpk.txt cleantf2\readme.txt
..\..\..\bin\vpk.exe -M cleantf2
del cleantf2\readme.txt
move cleantf2\cfg .\
move cleantf2\materials .\
move cleantf2\models .\
move cleantf2\scripts .\
rmdir cleantf2
pause