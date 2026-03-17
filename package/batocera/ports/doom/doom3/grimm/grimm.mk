################################################################################
#
# grimm
#
################################################################################
# Version: Commits on Mar 16, 2026
GRIMM_VERSION = 3bfac7aea5a9c39afeb83d97500d7f757f6bebc1
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
