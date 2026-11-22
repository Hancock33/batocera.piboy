################################################################################
#
# catacombgl
#
################################################################################
# Version: Commits on Nov 22, 2026
CATACOMBGL_VERSION = d00d480f65edaaf75f087e6bcf55b0e0737f24c6
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
