################################################################################
#
# hardcorps
#
################################################################################
# Version: Commits on Mar 16, 2026
HARDCORPS_VERSION = 375a1d275ae9438781fe64f0d717a5443472ea73
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
