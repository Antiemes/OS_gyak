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

