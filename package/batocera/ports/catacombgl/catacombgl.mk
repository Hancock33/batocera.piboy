################################################################################
#
# catacombgl
#
################################################################################
# Version: Commits on Nov 15, 2025
CATACOMBGL_VERSION = cf2ccf096d3e5dfb4b9dce14331e2439ea11444d
CATACOMBGL_SITE = $(call github,ArnoAnsems,CatacombGL,$(CATACOMBGL_VERSION))
CATACOMBGL_LICENSE = GPLv3
CATACOMBGL_LICENSE_FILES = COPYING.txt
CATACOMBGL_SUPPORTS_IN_SOURCE_BUILD = NO

CATACOMBGL_DEPENDENCIES = sdl2

define CATACOMBGL_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -prn $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/catacombgl/catacomb.keys $(TARGET_DIR)/usr/share/evmapy
endef

CATACOMBGL_POST_INSTALL_TARGET_HOOKS = CATACOMBGL_EVMAPY

$(eval $(cmake-package))
