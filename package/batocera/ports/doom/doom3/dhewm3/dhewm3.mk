################################################################################
#
# dhewm3
#
################################################################################
# Version: Commits on Apr 08, 2025
DHEWM3_VERSION = f3cd3f31d0c46e3dcc0f7e04930a441bb99b5a3a
DHEWM3_SITE = $(call github,dhewm,dhewm3,$(DHEWM3_VERSION))
DHEWM3_LICENSE = GPL-3.0
DHEWM3_LICENSE_FILES = COPYING.txt
DHEWM3_SUPPORTS_IN_SOURCE_BUILD = NO
DHEWM3_SUBDIR = neo
DHEWM3_DEPENDENCIES = host-libjpeg libcurl libogg libvorbis openal sdl2 zlib

DHEWM3_CONF_OPTS += -DSDL2=ON

$(eval $(cmake-package))
