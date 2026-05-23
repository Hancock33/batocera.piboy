################################################################################
#
# catacombgl
#
################################################################################
# Version: Commits on May 23, 2026
CATACOMBGL_VERSION = b609b50ee4cb1326d4f2b2d9fd6b5f3decff129c
CATACOMBGL_SITE = $(call github,ArnoAnsems,CatacombGL,$(CATACOMBGL_VERSION))
CATACOMBGL_LICENSE = GPLv3
CATACOMBGL_LICENSE_FILES = COPYING.txt
CATACOMBGL_SUPPORTS_IN_SOURCE_BUILD = NO

CATACOMBGL_DEPENDENCIES = sdl2
CATACOMBGL_EMULATOR_INFO = catacombgl.emulator.yml

define CATACOMBGL_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -prn $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/catacombgl/catacomb.keys $(TARGET_DIR)/usr/share/evmapy
endef

CATACOMBGL_POST_INSTALL_TARGET_HOOKS = CATACOMBGL_EVMAPY

$(eval $(cmake-package))
$(eval $(emulator-info-package))
