################################################################################
#
# rivensin
#
################################################################################
# Version: Commits on Jan 26, 2026
RIVENSIN_VERSION = 9cbfc2b03a4aca42f4e848f9e8b465b410c8984e
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
