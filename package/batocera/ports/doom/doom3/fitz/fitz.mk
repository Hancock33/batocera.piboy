################################################################################
#
# fitz
#
################################################################################
# Version: Commits on Jan 26, 2026
FITZ_VERSION = 06af5d131c12f244a54d9964818ad9799e8d6654
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
