################################################################################
#
# taradino
#
################################################################################
# Version: Commits on Nov 19, 2026
TARADINO_VERSION = cb59bd899f7d75946c1297e9a0f94999fa76742a
TARADINO_SITE = $(call github,fabiangreffrath,taradino,$(TARADINO_VERSION))
TARADINO_LICENSE = GPL-2.0
TARADINO_LICENSE_FILES = README.md
TARADINO_EMULATOR_INFO = taradino.emulator.yml
TARADINO_DEPENDENCIES = sdl2 sdl2_mixer

TARADINO_SUPPORTS_IN_SOURCE_BUILD = NO

TARADINO_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF

define TARADINO_EVMAPY
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/share/evmapy $(TARADINO_PKGDIR)/rott.keys
endef
TARADINO_POST_INSTALL_TARGET_HOOKS += TARADINO_EVMAPY

$(eval $(cmake-package))
$(eval $(emulator-info-package))
