@echo off
set title=Cold Golemn
set type=Iron Monster
set points=4
set gold=2
set rules=On win: roll a die. If below a 4, fight Cold Golem again.
set flavour=\"A tiny chip of his blue crystal irises\" (Beggars 5.3)

echo title: "%title%"
echo type: "%type%"
echo points: "%points%"
echo gold: "%gold%"
echo rules: "%rules%"
echo flavour: "%flavour%"
echo.

echo scale card
magick.exe convert -resize 2518% content.png card.png

echo position on blank
magick.exe composite -geometry +774+208 card.png card_blank.png card.png

echo add overlay
magick.exe composite icon_card_front.png card.png card.png 

echo add dots
magick.exe composite -geometry +824+1898 dots.png card.png card.png

echo draw title
magick.exe convert -pointsize 128 -font "Lucida-Sans-Unicode" label:"%title%" title.png

echo make title transparent
magick.exe convert title.png -transparent white title.png

echo add title
magick.exe composite -geometry +871+236 title.png card.png card.png


echo draw type
magick.exe convert -pointsize 128 -font "Lucida-Sans-Unicode" label:"%type%" type.png

echo make type transparent
magick.exe convert type.png -transparent white type.png

echo add type
magick.exe composite -geometry +996+2294 type.png card.png card.png


echo draw rules
magick.exe convert -pointsize 128 -font "Lucida-Sans-Unicode" -size 2248 caption:"%rules%" rules.png

echo make rules transparent
magick.exe convert rules.png -transparent white rules.png

echo add rules
magick.exe composite -geometry +926+2604 rules.png card.png card.png


echo draw flavour
magick.exe convert -pointsize 110 -font "Lucida-Sans-Unicode" -size 1956 caption:"%flavour%" flavour.png

echo make flavour transparent
magick.exe convert flavour.png -transparent white flavour.png

echo add flavour
magick.exe composite -geometry +1060+3180 flavour.png card.png card.png


echo draw gold
magick.exe convert -pointsize 260 -font "Lucida-Sans-Unicode" label:"%gold%" gold.png

echo make gold transparent
magick.exe convert gold.png -transparent white gold.png

echo add gold
magick.exe composite -geometry +3100+1820 gold.png card.png card.png


echo draw points
magick.exe convert -pointsize 320 -font "Lucida-Sans-Unicode" label:"%points%" points.png

echo make points transparent
magick.exe convert points.png -transparent white points.png

echo add points
magick.exe composite -geometry +3011+130 points.png card.png card.png

echo cleaning up....
del /Q title.png
del /Q rules.png
del /Q type.png
del /Q flavour.png
del /Q gold.png
del /Q points.png