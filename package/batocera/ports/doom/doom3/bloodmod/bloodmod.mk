################################################################################
#
# bloodmod
#
################################################################################
# Version: Commits on Mar 16, 2026
BLOODMOD_VERSION = 20171f9419807eca068193fc0c36926f2abe8573
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
