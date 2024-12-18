################################################################################
#
# hypseus-singe
#
################################################################################
# Version: Commits on Oct 01, 2024
HYPSEUS_SINGE_VERSION = b353e1728bf56d8b6c6fb606df78b7296a203702
HYPSEUS_SINGE_SITE = $(call github,DirtBagXon,hypseus-singe,$(HYPSEUS_SINGE_VERSION))
HYPSEUS_SINGE_LICENSE = GPLv3
HYPSEUS_SINGE_DEPENDENCIES = libzip sdl2 sdl2_image sdl2_ttf zlib libogg libvorbis libmpeg2
HYPSEUS_SINGE_SUPPORTS_IN_SOURCE_BUILD = NO
HYPSEUS_SINGE_SUBDIR = src

HYPSEUS_SINGE_TARGET_CFLAGS = $(TARGET_CFLAGS) -Wno-implicit-function-declaration -Wno-int-conversion
HYPSEUS_SINGE_CONF_OPTS += -DCMAKE_C_FLAGS="$(HYPSEUS_SINGE_TARGET_CFLAGS)"
HYPSEUS_SINGE_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
HYPSEUS_SINGE_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
HYPSEUS_SINGE_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++

define HYPSEUS_SINGE_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/buildroot-build/hypseus $(TARGET_DIR)/usr/bin/
		mkdir -p $(TARGET_DIR)/usr/share/hypseus-singe

	# copy support files
	cp -pr $(@D)/pics $(TARGET_DIR)/usr/share/hypseus-singe
	cp -pr $(@D)/fonts $(TARGET_DIR)/usr/share/hypseus-singe
	cp -pr $(@D)/sound $(TARGET_DIR)/usr/share/hypseus-singe
	cp -pf $(@D)/doc/*.ini $(TARGET_DIR)/usr/share/hypseus-singe

	#evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -f $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/hypseus-singe/*.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
