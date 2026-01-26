################################################################################
#
# hardcorps
#
################################################################################
# Version: Commits on Jan 26, 2026
HARDCORPS_VERSION = d8bfe6d8084175789fe8552d0426adaa96e9e06e
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
