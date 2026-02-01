################################################################################
#
# sikkmod
#
################################################################################
# Version: Commits on Jan 26, 2026
SIKKMOD_VERSION = 6103ee0772f4216a14ea4946fd9eff7f3a6f4326
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
