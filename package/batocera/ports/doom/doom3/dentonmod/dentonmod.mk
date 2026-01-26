################################################################################
#
# dentonmod
#
################################################################################
# Version: Commits on Jan 26, 2026
DENTONMOD_VERSION = 95e71bd01c5b0a4f39cd2ea7bf49ee1899647519
DENTONMOD_SITE = $(call github,dhewm,dhewm3-sdk,$(DENTONMOD_VERSION))
DENTONMOD_BRANCH = dentonmod
DENTONMOD_LICENSE = GPLv3
DENTONMOD_LICENSE_FILES = COPYING.txt

DENTONMOD_DEPENDENCIES = dhewm3 host-libjpeg libcurl libogg libvorbis openal sdl2 zlib

DENTONMOD_CONF_OPTS = -DBASE_NAME=dentonmod

define DENTONMOD_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/dhewm3
	cp $(@D)/dentonmod*.so $(TARGET_DIR)/usr/lib/dhewm3/
endef

$(eval $(cmake-package))
