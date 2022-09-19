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
ls -r
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
ls -alr
```

Rejtett fájlokat is tartalmazó, hosszú formátumú rekurzív listát ad.

### Fájl műveletek

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

TBD!

#### Áthelyezés, átnevezés

Az `mv` paranccsal történik.

TBD!

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

## wc

## head, tail

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
 * `$`: A sor végére rögzíŧ


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

