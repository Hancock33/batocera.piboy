################################################################################
#
# dhewm3
#
################################################################################
# Version: Commits on Jun 08, 2026
DHEWM3_VERSION = 455b88e8dff2be822f08eb498f51b383e851fa38
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
