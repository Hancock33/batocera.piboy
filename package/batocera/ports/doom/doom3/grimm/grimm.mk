################################################################################
#
# grimm
#
################################################################################
# Version: Commits on Jan 26, 2026
GRIMM_VERSION = 6f6a78896270a8dcbeacf294a81234ab52bab9d9
GRIMM_SITE = $(call github,dhewm,dhewm3-sdk,$(GRIMM_VERSION))
GRIMM_BRANCH = grimm
GRIMM_LICENSE = GPLv3
GRIMM_LICENSE_FILES = COPYING.txt

GRIMM_DEPENDENCIES = dhewm3 host-libjpeg libcurl libogg libvorbis openal sdl2 zlib

define GRIMM_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/dhewm3
	cp $(@D)/grimm*.so $(TARGET_DIR)/usr/lib/dhewm3/
endef

$(eval $(cmake-package))
