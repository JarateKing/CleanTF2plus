..\magick.exe convert %1 -resize 1x1 -resize 1000x1000 %1.tmp
..\magick.exe composite %1.tmp %1 %1.new
del %1.tmp