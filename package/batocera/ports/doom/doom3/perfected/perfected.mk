################################################################################
#
# perfected
#
################################################################################
# Version: Commits on Mar 16, 2026
PERFECTED_VERSION = 2af5c64bc9dcaf03872dd22bd99a24b9d25a49bb
PERFECTED_SITE = $(call github,dhewm,dhewm3-sdk,$(PERFECTED_VERSION))
PERFECTED_BRANCH = perfected
PERFECTED_LICENSE = GPLv3
PERFECTED_LICENSE_FILES = COPYING.txt

PERFECTED_DEPENDENCIES = dhewm3 host-libjpeg libcurl libogg libvorbis openal sdl2 zlib

define PERFECTED_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/dhewm3
	cp $(@D)/perfected*.so $(TARGET_DIR)/usr/lib/dhewm3/
endef

$(eval $(cmake-package))
