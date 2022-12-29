#!/bin/bash
loc="ca
cs_CZ
de
en_GB
es
fi_FI
fr
ja_JP
nl
pl
pt_BR
ru_RU"

for i in $loc
do
    rm -r $i
    mkdir -p $i
    touch $i/batocera-es-system.po
done

