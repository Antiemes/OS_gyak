#!/bin/bash
#set -x

while getopts d: option; do
    case ${option} in
    d)
        if [[ ${OPTARG} =~ [a-zA-Z] ]]; then
            echo "Hiba: A megadott dátum (-d) betűt is tartalmaz! Csak számokat használj."
            exit 1
        elif ! [[ ${OPTARG} =~ ^[0-9]{8}$ ]]; then
            echo "Hiba: A dátum nem 8 karakter hosszú! Várt formátum: ÉÉÉÉHHNN (pl. 20260328)."
            exit 1
        else
            dat=$(date -d "${OPTARG}" "+%Y_%m%d")
        fi
        ;;
    \?)
        echo "Használat: $0 [-d ÉÉÉÉHHNN] fajl1 fajl2 ..."
        exit 1
        ;;
    esac
done

shift $((OPTIND-1))

if [[ -z $dat ]]; then
    echo -n "Kérem az évet (ÉÉÉÉ): "
    read ev
    if ! [[ $ev =~ ^[0-9]{4}$ ]]; then
        echo "Hiba: Az év formátuma érvénytelen! Pontosan 4 számjegyet adj meg."
        exit 1
    fi

    echo -n "Kérem a hónapot (HH): "
    read ho
    if ! [[ $ho =~ ^[0-9]{2}$ ]]; then
        echo "Hiba: A hónap formátuma érvénytelen! Pontosan 2 számjegyet adj meg (pl. 03)."
        exit 1
    fi

    echo -n "Kérem a napot (NN): "
    read nap
    if ! [[ $nap =~ ^[0-9]{2}$ ]]; then
        echo "Hiba: A nap formátuma érvénytelen! Pontosan 2 számjegyet adj meg."
        exit 1
    fi

    dat=$(date -d "$ev$ho$nap" "+%Y_%m%d")
fi

while (( $# )); do
    fnev=$(basename "$1")
    
    if ! [[ -e "/tmp/logs/$fnev" ]]; then
        echo "Figyelmeztetés: A(z) '$fnev' fájl nem létezik a logs könyvtárban. Ugrom..."
        shift
        continue
    fi
    if ! [[ -r "/tmp/logs/$fnev" ]]; then
        echo "Hiba: A(z) '$fnev' fájl nem olvasható (nincs rá jogosultság). Ugrom..."
        shift
        continue
    fi

    echo "=== Eredmények a(z) $fnev fájlból ==="
    
    if grep -q "${dat}" "/tmp/logs/$fnev"; then
        echo "Egyedi értékek a 4. oszlopból:"
        echo "$(grep "${dat}" "/tmp/logs/$fnev" | cut -d "," -f 4 | sort -u)"
        echo "---"
        
        echo "Legnagyobb érték (3. oszlop):"
        echo "$(grep "${dat}" "/tmp/logs/$fnev" | cut -d "," -f 3 | sort -nr | head -n 1)"

        echo "Legkisebb érték (3. oszlop):"
        echo "$(grep "${dat}" "/tmp/logs/$fnev" | cut -d "," -f 3 | sort -n | head -n 1)"

        echo "-> Sikeres találat erre a dátumra."
    else
        echo "-> Nincs találat erre a dátumra ebben a fájlban."
    fi
    echo 
    
    shift
done
