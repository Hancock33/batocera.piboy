################################################################################
#
# melonds
#
################################################################################
# Version: Commits on Nov 22, 2026
MELONDS_VERSION = ff972523f8a70e877dd054439876c3c8c6b79197
MELONDS_SITE = $(call github,melonDS-emu,melonDS,$(MELONDS_VERSION))
MELONDS_LICENSE = GPL-2.0
MELONDS_SUPPORTS_IN_SOURCE_BUILD = NO
MELONDS_DEPENDENCIES += ecm enet libarchive libepoxy sdl2 slirp
MELONDS_DEPENDENCIES += qt6base qt6multimedia qt6svg
MELONDS_EMULATOR_INFO = melonds.emulator.yml

MELONDS_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
MELONDS_CONF_OPTS += -DUSE_QT6=ON

ifeq ($(BR2_PACKAGE_WAYLAND),y)
MELONDS_CONF_OPTS += -DENABLE_WAYLAND=ON
else
MELONDS_CONF_OPTS += -DENABLE_WAYLAND=OFF
endif

define MELONDS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/buildroot-build/melonDS $(TARGET_DIR)/usr/bin/melonDS
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
