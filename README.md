# Bevezetés

## Követelmények

 * A gyakorlatok látogatása ajánlott
 * 2 db ZH (7. hét és 13. hét), a 14. héten pótlási lehetőséggel
 * A jól teljesítők (elmélet + gyakorlat) megajánlott jegyben részesülhetnek

## A dokumentum használata

Ez egy MarkDown formátumú dokumentum, ami jelen formájában
egyben tartalmazza a gyakorlat tanagyagát. NEM tankönyv, csak VÁZLAT.
Tartalma fejezetekre van osztva a témakörök szerint, a szövege
könnyen kereshető.

Maga a fájl egy egyszerű (ASCII) szöveg, amit weben például GitHub,
Androidon például a Markor nevű program tud formázottan megjeleníteni.

## Miről fogunk tanulni?

 * A Linux (/Unix) rendszerek *parancssorának* használatáról
 * Az egyik leggyakoribb parancsértelmező (a Bash) használatáról
 * Fontosabb parancsok
 * „Egysoros programok”
 * Shell scriptek (héjprogramok)

## Miért van szükségünk erre a tudásra?

Azon kívül, hogy ZH-t írunk belőle...

 * A Linuxot nagyon jól lehet szoftverfejlesztésre használni.
Sok cégnél használják, de egyébként is az előnyünkre válhat.
 * Linux (/Unix) szerverek.
 * Beágyazott Linux (ipari robotok, Raspberry Pi

## Honnan szerezzünk parancssort?

 * Telepítsünk a saját gépünkre Linuxot
 * Telepítsünk virtuális gépre Linuxot (ha kevésbé vagyunk bátrak)
 * Használunk Live rendszert (USB pendrive-ról bootolható rendszert)
 * Windows Subsystem for Linux (WSL), Windows 10-től elérhető
 * Android: Termux

# Az első lépések

## Bejelentkezés

Helyi rendszerre: Felhasználónév és jelszó beírása

Távoli rendszerre: SSH kapcsolaton keresztül (pl. Putty programmal)
 * IP cím
 * Port (SSH alapértelmezett port: 22)
 * felhasználónév
 * jelszó

A laboron használt számítógépen a felhasználónév a Neptun kód (csupa kisbetűvel),
a jelszó: 123

## Parancsok beírása

Ahova a parancsokat be tudjuk írni: Prompt. Az éppen bevitt parancsban
a szokásos módon tudjuk a nyíl billentyűkkel mozogni. Az enter billentyűvel
adjuk ki a parancsot.

Hasznos billentyűkombinációk:
 * *Ctrl-C* lelövi az aktuálisan futó programot, törli a bevitel alatt álló
 parancsot.
 * Ctrl-L törli a képernyőt, kivéve az éppen szerkesztés alatt álló sort. Ez a legfelső sorba kerül.
 * Ctrl-R keres az előzőleg bevitt parancsok között.
 * Ctrl-D bevitel vége, vagy kilépés.

## Jelszó megváltoztatása

```bash
password
```

Kéri a régi jelszót és az újat kétszer.

## Mozgás a fájlrendszeren

```bash
cd KÖNYVTÁR
```

Relatív és abszolút útvonalak megadása lehetséges. A gyökérkönyvtár
a / (perjel), az elválasztójel is / (perjel).

```bash
cd /
cd /home/abc123
cd ..
cd ../home
```

A *cd* parancs paraméterek nélkül kiadva a home könyvtárba lép.

```bash
cd -
```

Oda lép, ahol előzőleg álltunk.

### Hol állok most?

Erre válaszol a
```bash
pwd
```
parancs. Az aktuális könyvtárt a prompt is jelzi.

### Home könyvtár

Belépéskor minden felhasználó a saját home könyvtárában áll. Ennek útvonala
általában
```bash
/home/felhasznalonev
```
Röviden:
```bash
~
```

### Könyvtárak tartalmának listázása

Az *ls* paranccsal és kapcsolókkal történik.

```bash
ls
```

A nem rejtett bejegyzéseket betűrendben listázza, ha elég széles a terminál,
akkor több oszlopban.

```bash
ls -a
```

A rejtett (.-tal kezdődő) bejegyzéseket is listázza.


```bash
ls -1
```

Egy oszlopban listáz.


```bash
ls -l
```

Hosszú formában listáz:

```
total 1688
-rw-r--r-- 1 root root      44 Aug  8 22:22 adjtime
drwxr-xr-x 1 root root      12 Dec 12  2019 alsa
drwxr-xr-x 1 root root      66 Aug 12 15:07 apparmor.d
-rw-r--r-- 1 root root     833 Aug 27 09:17 appstream.conf
-rw-r--r-- 1 root root       0 Dec  7  2021 arch-release
drwxr-xr-x 1 root root     138 Apr 29 12:24 audit
drwxr-xr-x 1 root root     142 Dec 21  2021 avahi
-rw-r--r-- 1 root root  505949 May 20  2020 avrdude.conf
-rw-r--r-- 1 root root      28 Jan  8  2022 bash.bash_logout
-rw-r--r-- 1 root root     618 Jan  8  2022 bash.bashrc
-rw-r--r-- 1 root root    2403 Aug 18 00:21 bind.keys
-rw-r--r-- 1 root root     535 Aug  8 21:27 bindresvport.blacklist
drwxr-xr-x 1 root root       0 Jan 11  2019 binfmt.d
drwxr-xr-x 1 root root      40 Feb  7  2021 bitlbee
```

Az egyes oszlopok jelentése:
 * Típus és jogosultságok
 * Linkszámláló
 * Tulajdonos
 * Csoport
 * Méret
 * Utolsó módosítás dátuma
 * Név

```bash
ls -lh
```

A méretet átváltja (k, M, G, T stb).

```bash
ls -R
```

Rekurzívan listáz.

```bash
ls -t
```

Nem betűrendben, hanem a módosítás ideje szerint rendez.

```bash
ls -r
```

A rendezést megfordítja.

Az ls kapcsolói kombinálhatóak is, például:

```bash
ls -alR
```

Rejtett fájlokat is tartalmazó, hosszú formátumú rekurzív listát ad.

### Fájl- és könyvtárműveletek

#### Új könyvtár létrehozása

Új könyvtárt az `mkdir` paranccsal tudnk létrehozni. Megadható neki akár egy,
akár több könyvtár is.

```bash
mkdir ujkonyvtar
mkdir konyvtar1 konyvtar2 konyvtar3
```

Az `mkdir` parancsnak megadhatunk egy útvonalat is, ha használjuk a `-p` kapcsolót.
Ilyenkor a teljes útvonal mentén található összes könyvtárat létrehozza.

```bash
mkdir egyik/masik/harmadik
```

Létrejön az `egyik` könyvtár, azon belül a `masik`, azon belül pedig a `masik`,
azon belül a `harmadik`.

#### Másolás

Fájlok másolása a `cp` paranccsal történik:

```bash
cp forrás cél
```

A forrás lehet egy, vagy több fájl, illetve könyvtár is. A cél egy esetet kivéve mindig könyvtár.
(Ha a forrás egy fájl, akkor a cél is lehet fájl. Például le tudunk másolni egy fájlt egy új néven.)

A másolás során használhatunk dzsóker karaktereket is:

 * `*`: Tetszőleges számú (akár 0 db is!) tetszőleges karaktert helyettesít.
 * `?`: Pontosan 1 db tetszőleges karaktert helyettesít.
 * `[K-V]`: K (kezdet) és V (vég) között bármilyen karaktert helyettesít.
 * `[K-V0-9abc]`: Ez a minta egy olyan karaktert helyettesít, ami vagy K és V között valami, vagy 0 és 9 között valami, vagy a, vagy b, vagy c lehet.

Néhány példa:

```bash
mkdir cel
cp *.py cel
cp /etc/*.conf /etc/*.cfg cel
cp *.txt /tmp
cp beszamolo.docx beszamolo_backup.docx
```

Ha a másolandók közt könyvtár is van, akkor a `-r` kapcsolót meg kell adni. (`r` mint recursive)

```bash
cp -r /etc/systemd .
```

Itt van jelentősége a `.` speciális könyvtárnak, ami az aktuális könyvtárt jelenti (ez a parancs tehát az
aktuális könyvtárba fog másolni).

```bash
cp -r /etc/li[a-x]* /tmp
```

Ez a minta azokra a bejegyzésekre illeszkedik, amik első két betűje `li`, amit *a* és *x* között bármi
követhet, illetve ezek után még tetszőleges karakterek következhetnek.

A cp a létező fájlt kérdés nélkül felülírja. Ha megadjuk a `-i` kapcsolót, akkor minden fájl esetében rákérdez.

#### Törlés

Fájlok törlése az `rm` paranccsal történik:

```bash
rm file1 file2 file3 ...
```

Könyvtár törlése esetén hibaüzenetet kapunk; ilyenkor a `-r` kapcsolót is meg kell adni.

```bash
rm -r konyvtar
```

Itt is használhatunk helyettesítő (dzsóker, wildcard) karaktereket:

```bash
rm *.doc *.txt
```

A `-i` kapcsolóval kiegészítve minden törlendő fájlra, könyvtárral egyenként rákérdez.

#### Üres könyvtár törlése

Az `rmdir` paranccsal történik.

```bash
rmdir konyvtar
rmdir konyvtar1 konyvtar2 konyvtar3
rmdir ko*
```

A parancsnak meg tudunk adni egy, vagy több könyvtárt, illetve shell mintát is

#### Áthelyezés, átnevezés

Az `mv` paranccsal történik. Többféle működési módja is van a szituációtól függően,
illetve *áthelyezni* és *átnevezni* is tud. 

Ha két fájlt adunk meg, amik azonos könyvtárban vannak és közülük az első létezik,
a második pedig nem akkor a fájlt *átnevezi* a könyvtáron belül.

```bash
mv regi.txt uj.txt
```

A `regi.txt` fájl új neve ezentúl `uj.txt` lesz. Ha a másodiknak megadott fájl létezik, akkor azt *felülírja*.

Hasonló a helyzet akkor is, ha könyvtárról van szó:

```bash
mv regi uj
```

A `regi` ezentúl `uj` néven fog szerepelni. Ha az `uj` létezne, akkor a `regi`-t *áthelyezi*
az `uj`-ba.

Ha több paramétert adunk meg, akkor az utolsó paraméternek mindenképpen könyvtárnak kell lennie.
A parancs ebbe a könyvtárba a többi paraméterben megadott összes fájlt és könyvtárt
*áthelyezi*.

```bash
mv egyik.txt masik.txt akarmi.sh konyvtar1 konyvtar2 celkonyvtar
```

Az összes felsorolt fájl és könyvtár a `celkonyvtar` könyvtárba kerül.

Shell minták természetesen ennél a parancsnál is használhatóak.

## Jogosultságok kezelése

A Linux (és a Unixok) a fájlok következő jogosultságait kezelik:

 * Tulajdonos
 * Csoport
 * Tulajdonos jogosultságai (olvasás, írás, végrehajtás)
 * Csoport jogosultságai (olvasás, írás, végrehajtás)
 * Mindenki más jogosultságai (olvasás, írás, végrehajtás)

Ezeket az adatokat az `ls -l` 

# Programok összekötése pipe-pal

Számos olyan parancssori program van, ami a bemenetét a standard billentyűzetről (vagy onnan is) veszi,
illetve a kimenetét a standard kimenetre írja. (A standard bemenet alapesetben a billentyűzet,
a standard kimenet pedig a képernyő.) Az ilyen típusú programok összekötésével komplex feldolgozás
valósítható meg, elsősorban szöveges tartalmak esetében.

## cat

A `cat` parancs kiírja a képernyőre egy fájl tartalmát.

```bash
cat pelda.txt
```

Kiírja a pelda.txt tartalmát. De meg tudunk adni több fájlt is:

```bash
cat egyik.txt masik.txt harmadik.txt
```

Ekkor mindhárom fájl tartalmát kiírja egymás után. Ezt úgy is értelmezhetjük, hogy a fájlok tartalmát
összefűzi (con*cat*enate, innen jön a program neve).

## wc

A `wc` parancs megszámolja, hogy a paraméterül kapott fájlok hány *sorból*, *szóból*, illetve *karakterből*
állnak. Több fájl megadása esetén egy összesítést is kapunk.

```bash
wc valami.txt szoveg.txt
```

Kiírja, hogy a valami.txt és a szoveg.txt hány sort, szót, illetve karaktert tartalmaz.

A program működése kapcsolókkal szabályozható.

Csak a sorok számlálása:

```bash
wc -l valami.txt
```

Csak a szavak számlálása:

```bash
wc -w valami.txt
```

Csak a karaktertek számlálása:

```bash
wc -c valami.txt
```

## head, tail

A `head` (jelentése fej) a fájlok elejét, a `tail` (jelentése farok) a fájlok végét írja ki. Ez alapesetben
mindkét parancsnál 10 sort jelent, ami szabályozható.

```bash
head pelda.txt
```

Kiírja a pelda.txt első 10 sorát.

```bash
head -n 5 pelda.txt
```

Kiírja a pelda.txt első 5 sorát.

```bash
tail pelda.txt
```

Kiírja a pelda.txt első 10 sorát.

```bash
tail -n 5 pelda.txt
```

Kiírja a pelda.txt első 5 sorát.

Előfordulhat, hogy a fájlban nincs annyi sor, amennyit ki akarunk iratni. Ilyenkor 
a parancs annyi sort ír ki, amennyi a fájlban van.

A `head`-nek és a `tail`-nek több fájl is megadható. Ebben az esetben
a program kiírja a fájlok nevét a következő módon. Ez a működés
egyébként a `-q` kapcsolóval kikapcsolható.

```bash
> head -n 3 egyik.txt masik.txt

==> egyik.txt <==
A file elso sora
A masodik sora
Es a harmadik

==> masik.txt <==
elso
masodik
harmadik sor
```



# Reguláris kifejezések és a `grep` parancs

A reguláris kifejezés (regular expression, regexp, regex) egy számításelméleti fogalom. Segitségével
egy *nyelvet* (~szavak halmazát) lehet definiálni; meg tudjuk vizsgálni, hogy egy szöveg *illeszkedik-e*
egy reguláris kifejezésre, vagyis *eleme-e* az általa definiált nyelvnek (halmaznak).

## A legegyszerűbb reguláris kifejezések

 * A reguláris kifejezések elemi (*atomi*) építőegységekből épülnek fel. Ilyen egységek például
az *alfanumerikus karakterek* (betűk, és számok), amik önmagukra illeszkednek.

 * Több atomi egység egymás után írva arra illeszkedik, amit sorban egymás után az egységek kifejeznek.

Példa:

```
a
```

Betű, önmagára illeszkedik.

```
b
```

Ez is egy betű, ez is önmagára illeszkedik.

```
ab
```

Két építőegység, ez összesen az `ab`-re illeszkedik.

Tehát bármely szó (illetve betűkből, számokból és néhány
egyéb jelből álló karaktersorozat) magára a szóra illeszkedik.

## A `grep`

A `grep` segítségével egy szövegből tudjuk azokat a sorokat kiszűrni, amelyik *tartalmaznak* egy
bizonyos reguláris kifejezést.
A példákat egy képzeletbeli *pelda.txt* nevű fájlon keresztül fogjuk kipróbálni.

A *grep*-et használhatjuk úgy is, hogy megadjuk neki a bemenetet tartalmazó fájlt:

```bash
grep regex pelda.txt
```

Illetve úgy is, hogy a bemenetet a standard bemenetről kapja:

```bash
valamilyen parancsok | grep regex
```

Egyelőre csak nagyon egyszerű reguláris kifejezéseket
tudunk készíteni.

```bash
grep valami pelda.txt

egyvalami
ilyesvalami
másvalami
olyasvalami
valami
valamicske
valamilyen
valamiből
valamicskét
```

### Kis- nagybetű érzékenység

A `grep` kis-nagybetű érzékeny (case sensitive), tehát különbséget tesz a kis- és nagybetűk között.
Ennek kikapcsolása a `-i` kapcsolóval történik.

```bash
grep Pista pelda.txt

Pista
```

De a *-i* kapcsoló megadásával:

```bash
grep Pista pelda.txt

pápista
sipista
trappista
utópista
Pista
eszképista
```

### Keresés megfordítása (regex tagadása)

További fontos kapcsoló a `-v`, amivel `grep` azokat a sorokat fogja kiírni, amikre a megadott
reguláris kifejezés *NEM* illeszkedik.

```bash
grep -v a pelda.txt
```

Olyan sorokat fog kiírni, amikben *nincs* `a` betű.

### Horgonyok

Az eddigi példákból látható volt, hogy a megadott kifejezés bárhol
lehet a sorban (az elején, a végén, valahol középen), a `grep` mindenképpen
kiírta az adott szót. A reguláris kifejezésben megadhatunk *horgonyokat*,
amik valahova (a sor elejére, végére) lerögzítik a reguláris kifejezés adott részét.

 * `^`: A sor elejére rögzít
 * `$`: A sor végére rögzít


Legyen a reguláris kifejezés a sor elején:

```bash
grep ^ab pelda.txt

abajgat
abakusz
abál
abált
abba
abbahagy
```

Legyen a végén:

```bash
grep ab$ pelda.txt

átszab
bab
beleszab
beszab
bokorbab
borhab
bútordarab
```

A két horgonyt egyszerre is lehet használni:

```bash
grep ^valami$ pelda.txt

valami
```

### Karakterhalmazok

Egy konkrét karakter helyett olyan atomokat is definiálhatunk, amik többféle
karakterre is illeszkedhetnek. Ezek állhatnak tartományokból, vagy felsorolt karakterekből,
illetve ezek kombinációjából is

 * `[a-z]`: a-tól z-ig bérmely karakterre illeszkedik
 * `[A-Z]`: A-tól Z-ig bármely karakterre illeszkedik
 * `[akdtx]`: Az a, k, d, t és x karakterekre illeszkedik
 * `[0-9pqfgb-h]`: Lehet számjegy, b, c, d, e, f, g, h, p, vagy q betű

Ha a `-` része a listának, azt a végére kell tenni:

 * `[0-9-]`: Számjegy, vagy kötőjel

A halmazt lehet negálni is a `^` jellel.

 * `[^A-Z]`: Bármely karakterre illeszkedik, ami *nem* nagybetű.

Végezetül a `.` (pont) bármely karakterre illeszkedik.

Néhány példa:

 * `^sz..[ef][^thpza]$`: *sz* betű, majd két tetszőleges karakter, majd *e*, vagy *f* betű, majd egy olyan karakter, ami nem *t*, nem *h*, nem *p*, nem *z* és nem is *a*.
 * `^.szt`: A sor első karaktere tetszőleges lehet, majd *s*, *z* és *t* következik

### Kvantorok

A kvantorokkal (többszörözőkkel) a reguláris kifejezés bizonyos részei (példáinkban
először csak karakterek) egymás utáni előfordulásainak számát tudjuk jelölni.

 * `atom*`: A megadott atom bármennyi (0-végtelen) darab előfordulása
 * `atom?`: A megadott atom 0, vagy 1 darab előfordulása
 * `atom+`: A megadott atom legalább 1 darab (1-végtelen darab) előfordulása

### Kiterjesztett szintaxis

### Összetett példák

```bash
ip addr show

1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp0s31f6: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group default qlen 1000
[...]
```

Szedjük ki a releváns részeket. Kétféle információra vagyunk kiváncsiak: A számozott sorokra és az
`inet`-tel kezdődőekre.

Számozott sorok:

```bash
ip addr show | grep -E '^[0-9]+:'
```

Az inet-es sorok:

```bash
ip addr show | grep -E '^ {4}inet '
```

A kettő együtt:

```bash
ip addr show | grep -E '(^[0-9]+:|^ {4}inet )'
```

## A `cut` és az `awk`

A `cut` mezők kiírására való, feltéve hogy a mezőket valamilyen fix elválasztó karakter határolja.
(Ez alapértelmezetten a tabulátor.)

A fontosabb kapcsolók:

 * `-d`: elválasztó karakter, *delimiter*
 * `-f`: mezők (*field*) listája

Egy vesszővel határolt táblázat második és harmadik oszlopának kinyerése például a következő
módon történhet:


```bash
cat tablazat.csv | cut -d "," -f 2,3
```

Az `awk` tulajdonképpen egy teljes értékű programnyelv, mi viszont csak a `print` utasítást fogjuk használni
belőle. Például az `ls -l` kimenetéből a fájlok nevének és hosszuknak a kinyerése:


```bash
ls -l | awk '{print $9 " " $5}'
```

Itt a `" "` nélkül összefolyna a név és a hossz.

Nézzük meg a nem sokkal ezelőtti példán is. Szükségünk van mondjuk az előző blokkban
tárgyalt parancs kimenetéből az IP címet tartalmazó mezőre:

```bash
ip addr show | grep -E '^ {4}inet ' | awk '{print $2}'

127.0.0.1/8
192.168.1.166/24
172.17.0.1/16
```

Ugyanez a `cut`-tal:

```bash
ip addr show | grep -E '^ {4}inet ' | cut -d " " -f 6
```

Itt a 6. mezőt kellett megadni, mert az első négy szóköz önmagában 1-1 mezőnek számít.

Ezt a kimenetet például a `/` jelet mint elválasztót használva tovább bonthatjuk:

```bash
ip addr show | grep -E '^ {4}inet ' | awk '{print $2}' | cut -d '/' -f 1

127.0.0.1
192.168.1.166/
172.17.0.1
```

# Shell script alapok

Eddig a shellt interaktív módban használtuk, vagyis a parancsokat egyenként beírva
hajtottuk végre. Ez egyszerűbb feladatok végrehajtárása elég is volt, azonban komplett
programok (shell scriptek) írására is lehetőség van.

Először is hozzunk létre egy könyvtárt, amiben a shell scriptjeink lesznek, és lépjünk bele:

```bash
mkdir proba
cd proba
```

## Az `mcedit` használata

A shell scripteket egy fájlban kell elhelyezni, aminek a szerkesztéséhez az
`mcedit` programot fogjuk használni. Legyen az első scriptünk neve `elso.sh`
és indítsuk el az `mcedit`-et a következő módon:


```bash
mcedit elso.sh
```

Az `mc` legfontosabb billentyűkombinációi:

 * F2: mentés
 * F10: kilépés
 * Ctrl-u: visszavonás
 * F8: kijelölt rész, vagy aktuális sor törlése

## Az első script

A shell scripteket a következő sorral kell kezdeni:

```bash
#!/bin/bash
```

Ez jelzi, hogy a scriptet a `bash` fogja végrehajtani. (Hasonlót láthatunk Python és
más interpretált nyelvek esetén is.)

Az ezt követő sorok szekvenciaként végrehajtódnak és többek közt az előzőekben
használt parancsok is használhatóak. Legyen az első programunk a következő:

```bash
#!/bin/bash

echo "Hello, World!"
```

Mentsük el (F2), majd adjunk rá futási jogot:


```bash
chmod a+x elso.sh
```

Egy apró megjegyzés: Az `mcedit` minden mentésnél azokat a jogosultságokat fogja visszaállítani,
amiket akkor talált, amikor a fájlt megnyitotta. Az első létrehozáskor célszerű kilépni a
szövegszerkesztőből, `chmod`-olni, majd újra megnyitni a file-t.

Futtatni az elérési út megadásával tudjuk, például ha az aktuális konyvtárban van a fájlunk:

```bash
./elso.sh
```

De az összetettebb (akár relatív, akár abszolút elérési utak is működnek:

```bash
/home/abc123/proba/elso.sh
~/proba/elso.sh
```

A program a *Hello, World!* szöveget fogja kiírni.

## Adatbekérés

A billentyűzetről a `read` paranccsal kérhetünk be adatokat. A `read` után egy,
vagy több változót kell megadni, amikbe a beolvasott adatok kerülnek.

A `read` mindig egy sort olvas be.

 * Ha egy változót adunk meg, akkor a teljes beolvasott sor abba a változóba kerül.
 * Két változó esetén az első szó az első változóba, a maradék pedig a második változóba kerül.
 * Három változó esetén az első szó az első változóba, a második szó a másodikba, minden más a harmadikba kerül.
 * Stb.

A `read`-et használhatjuk paraméterek nélkül is. Ilyenkor a beolvasott adatokat eldobja.

```bash
#!/bin/bash

echo "Melyik file-t toroljem?"
read fn
rm $fn
```

A fenti program a beolvasott nevű fájlt törli.

A `read`-et egy másik program kimenetének soronként történő beolvasására is használhatjuk. Erről
majd később.

## `For` ciklus

Ciklust többek közt a `for` segíŧségével szervezhetünk a következő módon:

```bash
for valtozo in ertek1 ertek2 ertek3 [...]
  do
    ciklusmag
  done
```

A `valtozo` sorban felveszi az `ertek1`, `ertek2`, ... értékeket és minden esetben lefut a ciklusmag.
Azonban a shell, mint fentebb már megfigyeltük, a shell mintákat behelyettesíti, így például a
`*` helyére az aktuális könyvtárban levő bejegyzések (fájlok, könyvtárak) kerülnek:

```bash
for fn in *
  do
    wc -l $fn
  done
```

Ez a program az aktuális könyvtárban található összes fájlon, könyvtáron végigmegy és
mindegyikre lefuttatja a `wc -l` parancsot.

## Elágazás (`if`)

Nézzük meg az `if` használatát egy példán keresztül:

```bash
for fn in *
  do
    echo "A file neve:"
    echo "$fn"
    if [ -f "$fn" ]
      then
        echo "Ez egy sima file."
      fi
    echo
  done
```

### A `[` parancs

A fenti szerkezetben a `[ -f "$fn" ]` egy parancs, aminek az eredménye alapján hajtja
végre az `if` a `then`, vagy az opcionális `else` ágat. A parancs
*eredménye* nem azonos a parancs *kimenetével*. (Ezt a számot
a `$?` változó tartalmazza. Itt a `0` jelentése az *igaz* és
minden más a *hamis*.)

A `[` parancsot használhatjuk például:

 * Stringek néhány tulajdonságának vizsgálatára:
  * `[ -z STR ]` Az STR string hossza nem nulla.
  * `[ -n STR ]` Az STR string hossza nulla.
  * `[ STR1 = STR2 ]` Az STR1 és STR2 stringek egyenlőek.
 * Számok összehasonlítására:
  * `[ A -eq B ]` Az A és B számok egyenlőek.
  * `[ A -ne B ]` Az A és B számok egyenlőek.
  * `[ A -lt B ]` A < B
  * `[ A -gt B ]` A > B
  * `[ A -le B ]` A <= B
  * `[ A -ge B ]` A >= B
 * Fájlok bizonyos tulajdonságainak vizsgálatára:
  * `[ -e FILE ]` A FILE létezik.
  * `[ -f FILE ]` A FILE létezik és sima fájl.
  * `[ -d FILE ]` A FILE létezik és könyvtár.

További lehetőségek: `man [`, vagy `man test`.

A fenti példában tehát az `if` után szereplő kifejezés tulajdonképpen egy parancs.
Az `if` feltétel része bármilyen más parancs is lehet.

### `if`, `elif` és `else`

Az `else` ág akkor fog lefutni, ha a megadott feltétel nem teljesül. Az `elif` a más nyelvekben
megszokott `else if`, vagy `elsif` megfelelője. Emellett
az elágazásokat egymásba is lehet ágyazni. Nézzünk egy példát:

```bash
#!/bin/bash

for x in *
  do
    echo "A bejegyzes neve:"
    echo $x
    if [ -e $x ]
      then
        if [ -f $x ]
          then
            echo "A bejegyzes egy sima file."
        elif [ -d $x ]
          then
            echo "A bejegyzes egy konyvtar."
        else
            echo "A bejegyzes se nem sima file, se nem konyvtar."
      else
        echo "A bejegyzes nem letezik."
      fi
    echo
  done
```

## Aritmetika `expr` használatával és anélkül

Adjuk össze az összes `.txt`-re végződő fájl sorainak számát. Ehhez a következő feladatokat
kell megoldanunk:
 * Végig kell mennünk a fájlokon
 * Ki kell nyernünk az adott fájl sorainak számát és eltárolni azt egy változóban.
 * Össze kell adni a számokat.

A fájlokon már végig tudunk menni a tanultak alapján:

```bash
for fn in *.txt
  do
    echo $fn
  done
```

### Az `expr` parancs

Az `expr` paranccsal aritmetikai műveleteket végezhetünk egész számokon:

```bash
expr 1 + 2
expr 10 - 5
expr 8 / 3
expr 2 \* 3
expr 10 % 4
```

A szorzáshoz használt `*`-ot a shell saját maga is értelmezi, ezért azt escape-elni kell (a `\` jel segíŧségével). A `%`
jel osztási maradékot számol. Az `expr` csak egész számokkal tud számolni.

### A `$()` szintaxis (parancs-behelyettesítés)

A `$()`-be írt parancsot a parancsértelmező lefuttatja és a program kimenetét *behelyettesíti*. Próbáljuk ki a `wc` és az `expr`
parancsokkal:

```bash
sor=$(cat $fn | wc -l)
```

Ezzel az `fn` változóban tárolt nevű fájl sorainak száma bekerül a `sor` változóba.


```bash
osszes=$(expr $osszes + $sor)
```

Ezzel pedig az `osszes` változó értékét megnöveljük a `sor` változó értékével. (Az `osszes` változót
induláskor nullázni kell.)

### A teljes program

A teljes program tehát így néz ki:

```bash
osszes=0
for fn in *.txt
  do
    sor=$(cat $fn | wc -l)
    osszes=$(expr $osszes + $sor)
  done
echo $osszes
```

## A `while` ciklus

TBD

### Több sornyi adat beolvasása `while` és `read` segítségével

TBD

```bash
while read fn
	do
		true
	done
```

## Keresés a fájlok között

Keresni a `find` paranccsal tudunk. Paraméterek nélkül az aktuális konyvtárban keres, minden típusú
bejegyzést, a találatokat egyszerűen kiírja.

Megadhatunk neki például egy könyvtárt, ahol keresni fog:

```bash
find KONYVTAR
```

Megadhatjuk a keresendő bejegyzések típusát a `-type` kapcsolóval (`f`: fájl, `d`: könyvtár):

```bash
find -type f
find -type d
```

Az első csak a fájlokat, a második csak a könyvtárakat fogja keresni.

Illetve megadhatunk egy mintát, amire a fájl (vagy könyvtár) nevének kell illeszkednie, a `-name`
kapcsolóval. Itt shell mintát (tehát NEM reguláris kifejezést!) kell használni.

```bash
find . -type f -name "*.txt"
```

A fenti parancs az aktuális könyvtárban (`.`) fog `.txt` végződésű fájlokat keresni.
A `-name` kis-nagybetű érzékeny. Ennek a nem kis-nagybetű érzékeny változata a `-iname`.

A `find` használata a `-exec` paraméter használatával, illetve a kimenetek további feldolgozásával
válik igazán sokoldalúvá. A `-exec` segítségével a `find` a megtalált fájlokat, könyvtárakat
nem egyszerűen kiírja, hanem minden egyes találatra lefuttat egy parancsot. Használata a következő:

```bash
find KONYVTAR -type TIPUS -name MINTA -exec PARANCS "{}" \;
```

A megtalált fájl, vagy könvytár nevét a `"{}"` helyére helyettesíti a parancs.

```bash
find . -type f -name "*.txt" -exec ls -l "{}" \;
```

A fenti parancs az aktuális könyvtárban megkeres minden `.txt`-re végződő fájlt
és mindegyiken lefuttatja az `ls -l` parancsot (tehát minden fájlról egy részletes
listát kapunk a jogosultságokkal, a mérettel stb.).

```bash
find /etc -type f -name "*.conf" -exec wc -l "{}" \;
```

A fenti parancs a `/etc` könyvtárban megkeres minden `.conf`-ra végződő fájlt
és lefuttatja rajtuk a `wc -l` parancsot (ami kiírja, hogy melyik fájl hány sorból áll).

Ezeket a kimeneteket aztán fel is dolgozhatjuk.

```bash
find /usr -type f -name "*" -exec ls -l "{}" \; | grep '^...[^x]' | wc -l
```

A fenti parancs megszámolja, hogy a `/usr` könyvtárban hány olyan fájl van, amire
a tulajdonosának nincs futtatási joga.

## Parancssori paraméterek kezelése

A programunknak megadhatunk paramétereket (argumentumokat) is, a következő módon:

```bash
./scriptem.sh elso masodik harmadik
```

Ekkor az 1. argumentum a `$1`, a második a `$2`, a harmadik a `$3` stb. változóban lesz.

Legyen az első paraméter egy könyvtár elérési útvonala, a második paraméter pedig egy fájlkiterjesztés

```bash

```

# Összetettebb shell script elemek

## Az `if` használata más feltételekkel

Az `if` parancsot nem csak a `[`-es szerkezettel tudjuk használni, hanem
tulajdonképpen bármilyen más programmal is, aminek az eredménye alapján
az `if` a `then`, vagy az `else` ágban levő utasításokat tudja végrehajtani.

### Az `if` használata a `grep`-pel

Készítsünk egy fej, vagy írás programot, ami véletlenszerűen
ki tudja írni, hogy *FEJ*, vagy *IRAS*. Ehhez véletlenszámokat
kell generálni. Ez a `RANDOM` változó kiolvasásával tehető meg.
A `RANDOM` változó minden kiolvasáskor egy véletlenszerű, 0 és 32767 közötti egész számot ad.
Ebből például úgy tudunk fejet, vagy írást csinálni, hogy a páros
számokhoz a fejet, a páratlanokhoz az írást rendeljük hozzá.
Tehát ha a szám utolsó számjegye 0, 2, 4, 6, vagy 8, akkor
az eredmény fej, egyébként írás. Ezt a `grep` paranccsal
és egy reguláris kifejezéssel tudjuk eldönteni.

A reguláris kifejezésünk illeszkedjen mondjuk a fejre, tehát arra
az esetre, amikor a szám a 0, 2, 4, 6 és 8 számok valamelyikére
végződik. A megoldás: `'[02358]$'`. A `grep`-hez szükséges még a `-q`
kapcsoló is, hogy magát a számot ne írja ki, csak döntse el, hogy
illeszkedik-e a mintára, vagy nem. A teljes program:

```bash
if echo $RANDOM | grep -q '[02468]$'
then
  echo "FEJ"
else
  echo "IRAS"
fi
```

Készítsünk olyan programot, ami végighalad az összes fájlon és megnézi,
hogy mely fájlok első sora `#/bin/bash`. (Rekurzív keresés nem szükséges.)

```bash
for fn in *
do
  if head -n 1 $fn | grep -q '^#!/bin/bash$'
  then
    echo $fn
  fi
done
```

## Tetszőlegesen sok parancsori paraméter (argumentum) kezelése

Eddigi ismereteink szerint fix számú argumentumot tudtunk kezelni shell scriptjeinkben. Lehetőség van viszont arra is, hogy
tetszőleges számú paramétert feldolgozzunk. Nézzük először a következő programot:

```bash
echo "Parameterek szama: $#"
echo "Elso parameter: $1"
echo "Masodik parameter: $2"
echo "Harmadik parameter: $3"
echo
shift
echo "Parameterek szama: $#"
echo "Elso parameter: $1"
echo "Masodik parameter: $2"
echo "Harmadik parameter: $3"
echo
shift
echo "Parameterek szama: $#"
echo "Elso parameter: $1"
echo "Masodik parameter: $2"
echo "Harmadik parameter: $3"
echo
shift
echo "Parameterek szama: $#"
echo "Elso parameter: $1"
echo "Masodik parameter: $2"
echo "Harmadik parameter: $3"
```

Futtassuk a programunkkat négy parancssori paraméterrel:

```bash
./scriptem.sh elso masodik harmadik negyedik
```

Minden `shift` parancs után a paraméterlista eggyel elcsúszik. Az első helyre az eddigi második
kerül, a második helyre az eddigi harmadik stb. Az eddigi első paraméter eltűnik, a paraméterek száma (`$#`)
eggyel csökken.

Ezek után már készíthetünk egy olyan programot, ami végigmegy az összes paraméteren:

```bash
while [ $# -ne 0 ]
  do
    aktualis=$1
    echo $aktualis
    shift
  done
```

A programban a `$#` a paraméterek aktuális számát jelenti. A ciklus addig fog működni, amíg ez 0-ra nem csökken.
A `$1` változón egyesével minden paraméter végighalad. A programban az `echo` csak egy példa. Értelemszerűen
bármilyen módon felhasználhatjuk a paramétereket.

Azt is megtehetjük, hogy az első (vagy az első kettő stb.) paramétert külön kezeljük, illetve nem csak egyesével tudunk
végiglépkedni a paramétereken, hanem kettesével, hármasával stb. is.

Készítsünk egy programot, ami tetszőlegesen sok paramétert fogad és a következő módon működik. Minden
paraméter egy-egy fájl nevét adja meg. Minden fájlról készítsünk biztonsági másolatot a `backup` nevű
könyvtárban.

```bash
while [ $# -ne 0 ]
  do
    fn=$1
    cp $fn backup
    shift
  done
```

Bővítsük ki ezt a programot úgy, hogy ne a `backup`, hanem az első paraméterben megadott könyvtárba
készüljenek a biztonsági mentések. A program vizsgálja meg azt is, hogy ez a könyvtár létezik-e.
Ha nem létezik, hozza létre. Ha létezik ilyen néven bejegyzés, de az nem könyvtár, akkor
adjon hibaüzenetet és lépjen ki. Programunk a következő módon fog kinézni:

```bash
cel=$1
shift

if [ -d $cel ]
  then
  echo "A $cel letezik."
elif [ -e $cel ]
  then
  echo "A $cel nem konyvtar, nem hozhato letre a biztonsagi mentes."
  exit
else
  echo "Nem letezik $cel neven bejegyzes, igy ilyen neven letrehozunk egy konyvtarat."
  mkdir $cel
fi

while [ $# -ne 0 ]
  do
    fn=$1
    cp $fn $cel
    shift
  done
```

A programban az első paramétert egy külön változóban eltároljuk, majd a `shift` utasítás után úgy
tudjuk kezelni a változókat, mint az eddigiekben.

## 

## Egy parancs kimenetének soronként történő feldolgozása

Tegyük fel, hogy egy program, például egy megfelelően felparaméterezett `find`
által kiírt adatokon szeretnénk egyesével végigmenni. Ehhez a `read`-et tudjuk
felhasználni úgy, hogy egy pipe segítségével az adott parancsot egy `while read`
szerkezetbe kötjük be.

Keressük meg azokat a shell scripteket a `proba` könyvtárban, amik *NEM* a `#!/bin/bash`
sorral kezdődnek.

```bash
find . -type f -name "*.sh" | \
	while read fn
		do
  if grep -vq '^#!/bin/bash$'
	then
	  echo 
	fi
    done
```

## A változókról bővebben

