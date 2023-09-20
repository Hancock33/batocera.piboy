################################################################################
#
# melonds
#
################################################################################
# Version: Commits on Sept 20, 2023
MELONDS_VERSION = 6ca02aab2c1878ad3c708097f5a7c3b37d8aa77b
MELONDS_SITE = https://github.com/melonDS-emu/melonDS.git
MELONDS_SITE_METHOD=git
MELONDS_GIT_SUBMODULES=YES
MELONDS_LICENSE = GPLv2
MELONDS_DEPENDENCIES = sdl2 qt6base qt6multimedia slirp libepoxy libarchive
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
