################################################################################
#
# desolated
#
################################################################################
# Version: Commits on Jan 06, 2026
DESOLATED_VERSION = 9de9e30a42ed6517d0805bf4814cc653ca40f34d
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
