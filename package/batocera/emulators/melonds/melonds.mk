################################################################################
#
# melonds
#
################################################################################
# Version: Commits on Oct 01, 2024
MELONDS_VERSION = f13c70d028beac130278b857ca84493841fcc7a1
MELONDS_SITE = $(call github,melonDS-emu,melonDS,$(MELONDS_VERSION))
MELONDS_LICENSE = GPLv2
MELONDS_DEPENDENCIES = ecm libarchive libegl libepoxy qt6base qt6multimedia sdl2 slirp
MELONDS_SUPPORTS_IN_SOURCE_BUILD = NO

MELONDS_CONF_OPTS += -DCMAKE_INSTALL_PREFIX="/usr"
MELONDS_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
MELONDS_CONF_OPTS += -DUSE_QT6=ON

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
