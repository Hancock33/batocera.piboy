################################################################################
#
# dhewm3
#
################################################################################
# Version: Commits on Jan 24, 2026
DHEWM3_VERSION = 81bfd0c9ead6a87eea72727c225d0a7b0087c6ee
DHEWM3_SITE = $(call github,dhewm,dhewm3,$(DHEWM3_VERSION))
DHEWM3_LICENSE = GPL-3.0
DHEWM3_LICENSE_FILES = COPYING.txt
DHEWM3_SUPPORTS_IN_SOURCE_BUILD = NO
DHEWM3_SUBDIR = neo
DHEWM3_DEPENDENCIES = host-libjpeg libcurl libogg libvorbis openal sdl2 zlib

DHEWM3_CONF_OPTS += -DSDL2=ON

$(eval $(cmake-package))
