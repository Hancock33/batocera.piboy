################################################################################
#
# bloodmod
#
################################################################################
# Version: Commits on Jan 06, 2026
BLOODMOD_VERSION = d4c930fbb7ec4c5b588688916526de933a635af3
BLOODMOD_SITE = $(call github,dhewm,dhewm3-sdk,$(BLOODMOD_VERSION))
BLOODMOD_BRANCH = bloodmod
BLOODMOD_LICENSE = GPLv3
BLOODMOD_LICENSE_FILES = COPYING.txt

BLOODMOD_DEPENDENCIES = dhewm3 host-libjpeg libcurl libogg libvorbis openal sdl2 zlib

define BLOODMOD_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/dhewm3
	cp $(@D)/bloodmod.so $(TARGET_DIR)/usr/lib/dhewm3/
endef

$(eval $(cmake-package))
