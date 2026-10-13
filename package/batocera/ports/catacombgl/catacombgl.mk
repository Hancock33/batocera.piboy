################################################################################
#
# catacombgl
#
################################################################################
# Version: Commits on Oct 12, 2026
CATACOMBGL_VERSION = 40a45918e371ff797466e2916cb24d0e1f8e8c0e
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
