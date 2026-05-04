# Hasznos Linux parancsok
## Altalanos - Billentyu kombinaciok
* Ctrl+C - Folyamat befejezese
* Ctrl+Z - Hatterbe kuldes (fg visszahozza)
* Ctrl+R - Elozo parancsok kozott keres
* Ctrl+D - Bevitel vege
* Ctrl+L - Kepernyo torles
* Ctrl+Ins - Copy
* Shift+Ins - Paste
* Shift+Del - Cut
* password - Jelszo megvaltoztatsa
* man / help - Parancsok leirasa
* export LANG=en_US.UTF-8 - Nyelv atallitasa angolra, definiciokat mutatja uresen
* ip a - IP cim, MAC cim stb...
## File kezeles / Konyvtar muveletek
* ls - Konyvtar tartalom listazasa, kapcsolok:
  * -l - hosszu forma
  * -R - rekurziv
  * -r - forditott sorrend
  * -h - meret mert.egys.
  * -a - rejtett is
  * -1 - egy oszlop
* cd - Konyvtar valtas, pl: `cd /usr/tmp/ ` vagy `cd sajat/logs/ `
* pwd - Hol allok a konyvtar strukturaban?
* mkdir - Konyvtar letrehozasa
* rmdir - Konyvtar torlese (csak ures ktr)
* rm - File torlese
* cp - File masolasa
* mv - File athelyezese / atnevezese
* touch - File letrehozasa
* chmod - (u/g/o/a)+/-(r/w/x/s) vagy binaris formaban: 640 pl: ```chmod u+x ZH.sh``` vagy ```chmod 740 ZH.sh```
* chown - file / konyvtar tulajdonos megvaltozatasa
* chgrp - file / konyvtar csoport megvaltoztatasa
* basename - filenevet adja vissza
* dirname - konyvtarnevet adja vissza
* mktemp -p - konyvtar ideiglenes file-oknak
* PATH eleres...
* find 
  * -type f/d file vagy konyvtar
  * -name nev - case sensitive
  * -iname - nem case sensitive
  * -exec - minden talalatra lefuttatja az utana allo parancsot
  * pl: ```find /home/user -type f -iname "*.txt" -exec ls -lh {} \;```
* sh -c parancs vagy parancslista atadasa futtatasra a shell-nek
* which - futtathato file helyet adja vissza
## Szoveges parancsok
* head -n 5 - elso ot sorat adja vissza filenak
* tail -n 5 - utolso 5 sorat adja vissza filenak
* cat - tartalom kiiratasa, kapcsolo: -n - beszámozza a sorokat
* grep - karakter sor / minta egyezest keres és ad vissza
  * -E / egrep - extended mode - regexhez
  * -v - azokat adja vissza amiben nem szerepel a minta
  * -e - minta megadas
  * -f - egesz file megadasa mintakent
  * -q - nincs kiiras (csendes)
  * -x - csak teljes sor egyezest ad vissza
* cut - karakter sorozatbol ad vissza reszeket
  * -b 2-4 : 2-4 karaktert adja vissza
  * -d "," : delimiter, reszekre bontja
  * -f : hanyadik reszt adja vissza a szetvagott szovegbol
* sed 's/MIT/MIRE/' karakter sorozatban cserel
* read beolvasas
* echo kiiras, kapcsolo: -n - nincs sortores
* sort - rendezes
  * -k 5 : melyik mezo alapjan rendezzen
  * -n : numerikus rendezes
  * -u : azonos sorokbol egyet hagy meg
  * -r : forditott sorrend
* uniq - listaban azonosak kozul egyet hagy meg (mint ```sort -u```)
* wc szovegben szamlal
  * -l : sorokat
  * -w : szavakat
  * -c : karaktereket
## Regularis kifejezesekhez {}
* Horgonyok: ```^``` eleje, ```$``` vege
* ```?``` egy barmilyen karakter
* ```*``` barmennyi barmilyen karakter
* ```[a-zA-Z0-9_]``` halmaz
* ```[^a-zA-Z0-9_]``` negalt halmaz
* ```+``` legalabb egy karakter
* ```{5}``` pontosan annyi karakter (szorzo)
* ```ne``` nem egyenlo 
* ```eq``` egyenlo
* ```lt``` kisebb mint
* ```gt``` nagyobb mint
* ```le``` kisebb, egyenlo
* ```ge``` nagyobb egyenlo
## Script / Program
### Iteracio
```
for VALTOZO in ERTEKEK...
do
  CIKLUSMAG
done
```
```
while FELTETEL
do 
  CIKLUSMAG
done
```
### Szelekcio
```
if FELTETEL
then 
  IGAZ AG
else 
  HAMIS AG
fi
```
# Folyamatokhoz kapcsolodo parancsok
* top - folyamat figyelo
* ps - folyamatok adatai
  * -a : minden user folyamatai
  * -u : reszletes info
  * -x : hatter folyamatokat is
  * -f : fa strukturaban
  * -ww : nem vagja le a hosszu sorokat
* watch - folyamatos futtatasa egy folyamatnak
* kill PID - az adott PID processzt lelovi
* killall NEV - az adott NEV processzt lelovi (kill -9...)
* jobs - futo job lista
* fg - eloterbe hozza a hatterbe kuldott processzt (Ctrl+Z)
* reset - alaphelyzetbe allitja a konzolt
* tr - megfeleltet egymasnak ket halmaz elemeit
# Egyeb parancsok / programok
* env - kornyezeti valtozokat kezeli
* awk '{print $1}' - elso parameter kiirasa
* seq 1 10 - 1-tol 10-ig listaz
* source - script vagy file futtatasa u.a. mint ```.```
* wget URL - letolti az URL-t
* xargs - kapott listat argumentumokka alakit es atadja az ot koveto parancsnak
* | - parancsok osszekotese
* [ - teszt parancs
    * -e - file letezik?
    * -f - file letezik es sima file?
    * -x - futtathato file?
    * -d - konyvtar?
    * -n - string nem ures?
    * -z - string ures?
* $? - elozo parancs sikeres volt akkor 0 hiba eseten mas szam
* $# - parameterek / argumentumok szama
* $() - backtick helyett, parancs helyettesites, egyben adja at a ()-ben szereploket
* $0 - script neve
* $1 - elso parameter
* "szoveg" 'szoveg' `valami`
* expr - aritmetikai és sztring muveletek pl: ```expr 3 \* 5``` vagy ```expr length "szoveg"```
* mcedit -b - szovegszerkeszto (-b fekete screen)
* &RANDOM - random szam
* bc -l - szamolo "gep"
* time - datum megadasra
* sleep SEC - var SEC masodpercet
* shift - lepteti a parameterek poziciojat $1 -> torles, $2 -> $1, $3 -> $2 ...

