for PO in $HOME/batocera.se/package/batocera/emulationstation/batocera-es-system/locales/*/batocera-es-system.po
do 
    /home/lee/build-dir/batocera.x86_64/host/bin/msgmerge  -U --no-fuzzy-matching $PO $HOME/batocera.se/package/batocera/emulationstation/batocera-es-system/locales/batocera-es-system.pot
    printf "%s " $(basename $(dirname $PO)) 
    LANG=C /home/lee/build-dir/batocera.x86_64/host/bin/msgfmt -o /dev/null $PO --statistics
done
