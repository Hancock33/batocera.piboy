################################################################################
#
# catacombgl
#
################################################################################
# Version: Commits on Nov 17, 2026
CATACOMBGL_VERSION = 277b6cc518f6f7e6fb35886dbc155ef81fb0ce91
CATACOMBGL_SITE = $(call github,ArnoAnsems,CatacombGL,$(CATACOMBGL_VERSION))
CATACOMBGL_LICENSE = GPL-3.0
CATACOMBGL_LICENSE_FILES = COPYING.txt
CATACOMBGL_SUPPORTS_IN_SOURCE_BUILD = NO

CATACOMBGL_DEPENDENCIES = sdl2
CATACOMBGL_EMULATOR_INFO = catacombgl.emulator.yml

define CATACOMBGL_EVMAPY
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/share/evmapy $(CATACOMBGL_PKGDIR)/catacomb.keys
endef

CATACOMBGL_POST_INSTALL_TARGET_HOOKS = CATACOMBGL_EVMAPY

$(eval $(cmake-package))
$(eval $(emulator-info-package))
