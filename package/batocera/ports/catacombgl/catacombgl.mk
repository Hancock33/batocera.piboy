################################################################################
#
# catacombgl
#
################################################################################
# Version: Commits on Dec 30, 2025
CATACOMBGL_VERSION = 1c9e1bddc21e21e16a1c12c6b2304977657edd16
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
