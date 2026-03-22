################################################################################
#
# sikkmod
#
################################################################################
# Version: Commits on Mar 16, 2026
SIKKMOD_VERSION = a906116ae3831c481ee552e027c0bdfbf8583e40
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
