# Példa ZH feladat

Készítsen shell scriptet, ami rekurzívan végignézi az aktuális könyvtárban található fájlokat és kiszűr bizonyos rendellenességeket.

## 2-es szint
A vizsgált rendellenességek:

  * `.sh`-ra végződik, de nincs futási joga
  * 0 bájtos

## +1 jegy

A program vizsgálja meg azt is, hogy a megtalált shell script (`.sh`-ra végződő file) első sora megfelelő-e.

A megfelelőnek minősülő fájl a következő sorral kezdődik:

```bash
#!/bin/bash
```

## +1 jegy

Keressük meg azokat a fájlokat, amelyek nem `.sh`-ra végződnek, de arra kellene, hogy végződjenek. (Az első soruk `#!/bin/bash` és van futási joguk.)

## +1 jegy

A program fogadjon el egy parancssori paramétert, ami a vizsgálandó könyvtár neve. Ha ez nincs megadva, akkor legyen az alapérték az aktuális könyvtár.

## +1 jegy

A program előző pontot kibővítve fogadjon el bármennyi parancssori paramétert.

## +1 jegy

A program vizsgálja meg, hogy a megtalált fájlok jogaival kapcsolatban van-e anomália. Van-e valamelyik szereplőnek magasabb jogosultsági szintje, mint a tulajdonosnak?

