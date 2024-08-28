################################################################################
#
# bstone
#
################################################################################
# Version: Commits on Aug 28, 2024
BSTONE_VERSION = e7017f596795cc5357b886a10cc26961da69e96b
BSTONE_SITE = $(call github,bibendovsky,bstone,$(BSTONE_VERSION))

BSTONE_DEPENDENCIES = sdl2 sdl2_mixer
BSTONE_LICENSE = GPL-2.0
BSTONE_SUPPORTS_IN_SOURCE_BUILD = NO

BSTONE_CONF_OPTS += -DBSTONE_CI_GIT_HASH="$(shell echo $(BSTONE_VERSION) | cut -c 1-7)"

define BSTONE_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/buildroot-build/src/bstone $(TARGET_DIR)/usr/bin
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/bstone/bstone.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
