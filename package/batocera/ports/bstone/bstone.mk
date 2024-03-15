################################################################################
#
# bstone
#
################################################################################
# Version: Commits on Mar 15, 2024
BSTONE_VERSION = 6db2a294b4c5f77705523da02196266c308e612f
BSTONE_SITE = $(call github,bibendovsky,bstone,$(BSTONE_VERSION))

BSTONE_DEPENDENCIES = sdl2 sdl2_mixer
BSTONE_LICENSE = GPL-2.0
BSTONE_SUPPORTS_IN_SOURCE_BUILD = NO

define BSTONE_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/buildroot-build/src/bstone $(TARGET_DIR)/usr/bin
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/bstone/bstone.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
