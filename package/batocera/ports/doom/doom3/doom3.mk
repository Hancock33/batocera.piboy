################################################################################
#
# doom3
#
################################################################################

DOOM3_VERSION = 1.5.4
DOOM3_DEPENDENCIES += host-libjpeg libcurl libogg libvorbis openal sdl2 zlib dhewm3
DOOM3_DEPENDENCIES += bloodmod cdoom d3le dentonmod desolated eldoom fitz grimm hardcorps perfected realgibs rivensin sikkmod

$(eval $(virtual-package))
