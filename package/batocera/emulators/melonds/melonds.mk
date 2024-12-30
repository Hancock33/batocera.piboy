################################################################################
#
# melonds
#
################################################################################
# Version: Commits on Dec 26, 2024
MELONDS_VERSION = 0c5dd28b1c5c1d17a2ce87efbd858059a8f9376f
MELONDS_SITE = $(call github,melonDS-emu,melonDS,$(MELONDS_VERSION))
MELONDS_LICENSE = GPLv2
MELONDS_DEPENDENCIES = ecm libarchive libegl libepoxy qt6base qt6multimedia sdl2 slirp
MELONDS_SUPPORTS_IN_SOURCE_BUILD = NO

MELONDS_CONF_OPTS += -DCMAKE_INSTALL_PREFIX="/usr"
MELONDS_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
MELONDS_CONF_OPTS += -DUSE_QT6=ON

ifeq ($(BR2_PACKAGE_WAYLAND),y)
MELONDS_CONF_OPTS += -DENABLE_WAYLAND=ON
else
MELONDS_CONF_OPTS += -DENABLE_WAYLAND=OFF
endif

define MELONDS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/buildroot-build/melonDS \
		$(TARGET_DIR)/usr/bin/
endef

define MELONDS_POST_PROCESS
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/melonds/nds.melonds.keys \
		$(TARGET_DIR)/usr/share/evmapy
endef

MELONDS_POST_INSTALL_TARGET_HOOKS += MELONDS_POST_PROCESS

$(eval $(cmake-package))
