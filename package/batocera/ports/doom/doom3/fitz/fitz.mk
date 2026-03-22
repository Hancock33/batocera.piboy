################################################################################
#
# fitz
#
################################################################################
# Version: Commits on Mar 16, 2026
FITZ_VERSION = 9dc1b4c6651c6ffcc3902091d50999255fc0cdcb
FITZ_SITE = $(call github,dhewm,dhewm3-sdk,$(FITZ_VERSION))
FITZ_BRANCH = fitz
FITZ_LICENSE = GPLv3
FITZ_LICENSE_FILES = COPYING.txt

FITZ_DEPENDENCIES = dhewm3 host-libjpeg libcurl libogg libvorbis openal sdl2 zlib

define FITZ_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/dhewm3
	cp $(@D)/fitz*.so $(TARGET_DIR)/usr/lib/dhewm3/
endef

$(eval $(cmake-package))
