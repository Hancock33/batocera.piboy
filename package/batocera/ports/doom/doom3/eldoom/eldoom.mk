################################################################################
#
# eldoom
#
################################################################################
# Version: Commits on Jan 26, 2026
ELDOOM_VERSION = ff4d6d201b0443465ccbf097e240b47f43f24787
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
