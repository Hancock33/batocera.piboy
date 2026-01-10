################################################################################
#
# hardcorps
#
################################################################################
# Version: Commits on Jan 06, 2026
HARDCORPS_VERSION = 986d7aaa10575a2d3961c8c203f419d5bbd21307
HARDCORPS_SITE = $(call github,dhewm,dhewm3-sdk,$(HARDCORPS_VERSION))
HARDCORPS_BRANCH = hardcorps
HARDCORPS_LICENSE = GPLv3
HARDCORPS_LICENSE_FILES = COPYING.txt

HARDCORPS_DEPENDENCIES = dhewm3 host-libjpeg libcurl libogg libvorbis openal sdl2 zlib

define HARDCORPS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/dhewm3
	cp $(@D)/hardcorps*.so $(TARGET_DIR)/usr/lib/dhewm3/
endef

$(eval $(cmake-package))
