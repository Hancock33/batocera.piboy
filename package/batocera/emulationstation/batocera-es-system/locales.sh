#!/bin/bash
loc="ar
ca
cs_CZ
de
en_GB
es
fi_FI
fr
id_ID
it
ja_JP
ko
hu
nl
pl
pt_BR
pt_PT
ru_RU
sk_SK
tr
zh_CN"

for i in $loc
do
    rm -r locales/$i
    mkdir -p locales/$i
    touch locales/$i/batocera-es-system.po
done

