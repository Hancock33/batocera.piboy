################################################################################
#
# bstone
#
################################################################################
# Version: Commits on Sept 01, 2024
BSTONE_VERSION = ca0c1a02abcf2513b1871a09f786162abb41caec
BSTONE_SITE = $(call github,bibendovsky,bstone,$(BSTONE_VERSION))

BSTONE_DEPENDENCIES = sdl2 sdl2_mixer
BSTONE_LICENSE = GPL-2.0
BSTONE_SUPPORTS_IN_SOURCE_BUILD = NO

BSTONE_CONF_OPTS += -DBSTONE_CI_GIT_HASH="$(shell echo $(BSTONE_VERSION) | cut -c 1-7)"

define BSTONE_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/buildroot-build/src/bstone/bstone $(TARGET_DIR)/usr/bin
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/bstone/bstone.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
