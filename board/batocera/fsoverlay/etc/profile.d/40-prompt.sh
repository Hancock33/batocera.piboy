#More info contained
#Usually [root@BATOCERA /current/dir]# 
NM="\[\033[0;1;37m\]"
HI="\[\033[0;37m\]"
SI="\[\033[0;31m\]"
NI="\[\033[0;1;30m\]"
IN="\[\033[0;1;37m\]"

PS1="\[\e]2;BATOCERA - $PWD\a\]$NM-=[$HI\u$NI@$HI\h $SI\w$NM]=-\n#$IN"
PS2="\n#> "
export PS1 PS2
