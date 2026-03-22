################################################################################
#
# eldoom
#
################################################################################
# Version: Commits on Mar 16, 2026
ELDOOM_VERSION = c8ff0c0fa83a1ae0210b8e07adff8ef2107c08c8
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
