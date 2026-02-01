################################################################################
#
# cdoom
#
################################################################################
# Version: Commits on Jan 26, 2026
CDOOM_VERSION = 270da42e013714aafb0cffbb10e6568a85c307a6
CDOOM_SITE = $(call github,dhewm,dhewm3-sdk,$(CDOOM_VERSION))
CDOOM_BRANCH = cdoom
CDOOM_LICENSE = GPLv3
CDOOM_LICENSE_FILES = COPYING.txt

CDOOM_DEPENDENCIES = dhewm3 host-libjpeg libcurl libogg libvorbis openal sdl2 zlib

define CDOOM_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/dhewm3
	cp $(@D)/cdoom*.so $(TARGET_DIR)/usr/lib/dhewm3/
endef

$(eval $(cmake-package))
