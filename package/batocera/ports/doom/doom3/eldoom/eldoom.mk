################################################################################
#
# eldoom
#
################################################################################
# Version: Commits on Jan 06, 2026
ELDOOM_VERSION = a1237468ad06bde11c4bf9e01992e829fd11b012
ELDOOM_SITE = $(call github,dhewm,dhewm3-sdk,$(ELDOOM_VERSION))
ELDOOM_BRANCH = eldoom
ELDOOM_LICENSE = GPLv3
ELDOOM_LICENSE_FILES = COPYING.txt

ELDOOM_DEPENDENCIES = dhewm3 host-libjpeg libcurl libogg libvorbis openal sdl2 zlib

define ELDOOM_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/dhewm3
	cp $(@D)/eldoom*.so $(TARGET_DIR)/usr/lib/dhewm3/
endef

$(eval $(cmake-package))
