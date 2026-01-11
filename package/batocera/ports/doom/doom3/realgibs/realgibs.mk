################################################################################
#
# realgibs
#
################################################################################
# Version: Commits on Jan 06, 2026
REALGIBS_VERSION = 56a89fb69a8aea5cd5f3cb8260c31d125b0b6646
REALGIBS_SITE = $(call github,dhewm,dhewm3-sdk,$(REALGIBS_VERSION))
REALGIBS_BRANCH = realgibs
REALGIBS_LICENSE = GPLv3
REALGIBS_LICENSE_FILES = COPYING.txt

REALGIBS_DEPENDENCIES = dhewm3 host-libjpeg libcurl libogg libvorbis openal sdl2 zlib

define REALGIBS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/dhewm3
	cp $(@D)/realgibs*.so $(TARGET_DIR)/usr/lib/dhewm3/
endef

$(eval $(cmake-package))
