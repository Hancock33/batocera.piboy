################################################################################
#
# dhewm3
#
################################################################################
# Version: Commits on Mar 22, 2026
DHEWM3_VERSION = b810234ea1e3b498fa6ff5f51efaaa9433b21060
DHEWM3_SITE = $(call github,dhewm,dhewm3,$(DHEWM3_VERSION))
DHEWM3_LICENSE = GPL-3.0
DHEWM3_LICENSE_FILES = COPYING.txt
DHEWM3_EMULATOR_INFO = doom3.emulator.yml
DHEWM3_SUPPORTS_IN_SOURCE_BUILD = NO
DHEWM3_SUBDIR = neo
DHEWM3_DEPENDENCIES = host-libjpeg libcurl libogg libvorbis openal sdl2 zlib

DHEWM3_CONF_OPTS += -DSDL2=OFF
DHEWM3_CONF_OPTS += -DSDL3=ON

$(eval $(cmake-package))
$(eval $(emulator-info-package))
