################################################################################
#
# bstone
#
################################################################################
# Version: Commits on Jul 17, 2023
BSTONE_VERSION = dd93a185a5a79344722f40de384dac4ce73f8108
BSTONE_SITE = $(call github,bibendovsky,bstone,$(BSTONE_VERSION))

BSTONE_DEPENDENCIES = sdl2 sdl2_mixer
BSTONE_LICENSE = GPL-2.0
BSTONE_SUPPORTS_IN_SOURCE_BUILD = NO
BSTONE_CMAKE_BACKEND = ninja

BSTONE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

define BSTONE_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/buildroot-build/src/bstone $(TARGET_DIR)/usr/bin
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/bstone/bstone.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
