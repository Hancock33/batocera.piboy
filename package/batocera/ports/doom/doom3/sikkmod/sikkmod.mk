################################################################################
#
# sikkmod
#
################################################################################
# Version: Commits on Jan 06, 2026
SIKKMOD_VERSION = 746a8fcc27f4c67ee48ff06f6cf328900346ea28
SIKKMOD_SITE = $(call github,dhewm,dhewm3-sdk,$(SIKKMOD_VERSION))
SIKKMOD_BRANCH = sikkmod
SIKKMOD_LICENSE = GPLv3
SIKKMOD_LICENSE_FILES = COPYING.txt

SIKKMOD_DEPENDENCIES = dhewm3 host-libjpeg libcurl libogg libvorbis openal sdl2 zlib

define SIKKMOD_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/dhewm3
	cp $(@D)/sikkmod*.so $(TARGET_DIR)/usr/lib/dhewm3/
endef

$(eval $(cmake-package))
