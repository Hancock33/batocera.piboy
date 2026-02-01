################################################################################
#
# desolated
#
################################################################################
# Version: Commits on Jan 26, 2026
DESOLATED_VERSION = c5aa467045194fcd2a86f1f8aa3c8ca365cbf49a
DESOLATED_SITE = $(call github,dhewm,dhewm3-sdk,$(DESOLATED_VERSION))
DESOLATED_BRANCH = desolated
DESOLATED_LICENSE = GPLv3
DESOLATED_LICENSE_FILES = COPYING.txt

DESOLATED_DEPENDENCIES = dhewm3 host-libjpeg libcurl libogg libvorbis openal sdl2 zlib

define DESOLATED_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/dhewm3
	cp $(@D)/desolated*.so $(TARGET_DIR)/usr/lib/dhewm3/
endef

$(eval $(cmake-package))
