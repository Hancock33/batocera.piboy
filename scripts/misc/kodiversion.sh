#!/bin/bash

make_sub_sys="xbmc
audiodecoder.modplug
audiodecoder.nosefart
audiodecoder.sidplay
audiodecoder.snesapu
audiodecoder.stsound
audiodecoder.timidity
audiodecoder.vgmstream
audioencoder.flac
audioencoder.lame
audioencoder.vorbis
audioencoder.wav
imagedecoder.heif
imagedecoder.raw
inputstream.adaptive
inputstream.ffmpegdirect
inputstream.rtmp
jsonschemabuilder
peripheral.joystick
screensaver.asteroids
screensaver.asterwave
screensaver.biogenesis
screensaver.cpblobs
screensaver.greynetic
screensaver.matrixtrails
screensaver.pingpong
screensaver.pyro
screensaver.rsxs
screensaver.stars
skin.confluence
vfs.libarchive
vfs.rar
vfs.sftp
visualization.fishbmc
visualization.goom
visualization.matrix
visualization.shadertoy
visualization.spectrum
visualization.starburst
visualization.waveform"

for i in $make_sub_sys
do
	echo $i@ >> /tmp/kodi.txt
	#git ls-remote https://github.com/xbmc/$i | grep Omega >> /tmp/kodi.txt
	git -c 'versionsort.suffix=-' ls-remote --exit-code --refs --sort='version:refname' --tags https://github.com/xbmc/$i '*.*.*'| grep Omega | tail --lines=1 | cut --delimiter='/' --fields=3 >> /tmp/kodi.txt
done

kodi_norepo="texturepacker"

kodi_per="peripheral.xarcade"

for i in $kodi_per
do
	echo $i@ >> /tmp/kodi.txt
	#git ls-remote https://github.com/kodi-game/$i | grep Omega >> /tmp/kodi.txt
	git -c 'versionsort.suffix=-' ls-remote --exit-code --refs --sort='version:refname' --tags https://github.com/kodi-game/$i '*.*.*'| grep Omega | tail --lines=1 | cut --delimiter='/' --fields=3 >> /tmp/kodi.txt
done

kodi_pvr="pvr.argustv
pvr.dvblink
pvr.dvbviewer
pvr.filmon
pvr.hdhomerun
pvr.hts
pvr.iptvsimple
pvr.mediaportal.tvserver
pvr.mythtv
pvr.nextpvr
pvr.njoy
pvr.octonet
pvr.pctv
pvr.plutotv
pvr.stalker
pvr.vbox
pvr.vdr.vnsi
pvr.vuplus
pvr.waipu
pvr.wmc
pvr.zattoo"

for i in $kodi_pvr
do
	echo $i@ >> /tmp/kodi.txt
	#git ls-remote https://github.com/kodi-pvr/$i | grep Omega >> /tmp/kodi.txt
	git -c 'versionsort.suffix=-' ls-remote --exit-code --refs --sort='version:refname' --tags https://github.com/kodi-pvr/$i '*.*.*'| grep Omega | tail --lines=1 | cut --delimiter='/' --fields=3 >> /tmp/kodi.txt
done
