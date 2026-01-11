################################################################################
#
# melonds
#
################################################################################
# Version: Commits on Jan 11, 2026
MELONDS_VERSION = d7a3c9179793ec69dd002519ba613403b71d768f
MELONDS_SITE = $(call github,melonDS-emu,melonDS,$(MELONDS_VERSION))
MELONDS_LICENSE = GPLv2
MELONDS_SUPPORTS_IN_SOURCE_BUILD = NO
MELONDS_DEPENDENCIES += ecm enet libarchive libepoxy sdl2 slirp
MELONDS_DEPENDENCIES += qt6base qt6multimedia qt6svg

MELONDS_CONF_OPTS += -DCMAKE_INSTALL_PREFIX="/usr"
MELONDS_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
MELONDS_CONF_OPTS += -DUSE_QT6=ON

ifeq ($(BR2_PACKAGE_WAYLAND),y)
MELONDS_CONF_OPTS += -DENABLE_WAYLAND=ON
else
MELONDS_CONF_OPTS += -DENABLE_WAYLAND=OFF
endif

define MELONDS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/buildroot-build/melonDS $(TARGET_DIR)/usr/bin/
endef

$(eval $(cmake-package))
