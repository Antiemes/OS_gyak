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

