################################################################################
#
# rivensin
#
################################################################################
# Version: Commits on Mar 16, 2026
RIVENSIN_VERSION = c6292882a5a8946165aa17a5c1621a22cde1499d
RIVENSIN_SITE = $(call github,dhewm,dhewm3-sdk,$(RIVENSIN_VERSION))
RIVENSIN_BRANCH = rivensin
RIVENSIN_LICENSE = GPLv3
RIVENSIN_LICENSE_FILES = COPYING.txt

RIVENSIN_DEPENDENCIES = dhewm3 host-libjpeg libcurl libogg libvorbis openal sdl2 zlib

define RIVENSIN_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/dhewm3
	cp $(@D)/rivensin*.so $(TARGET_DIR)/usr/lib/dhewm3/
endef

$(eval $(cmake-package))
