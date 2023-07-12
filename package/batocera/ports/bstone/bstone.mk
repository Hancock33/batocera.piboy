################################################################################
#
# bstone
#
################################################################################
# Version: Commits on Jul 11, 2023
BSTONE_VERSION = dcfb75be449d87431de9906d2324d474d0d0ff58
BSTONE_SITE = $(call github,bibendovsky,bstone,$(BSTONE_VERSION))

BSTONE_DEPENDENCIES = sdl2 sdl2_mixer host-ninja
BSTONE_LICENSE = GPL-2.0

BSTONE_SUPPORTS_IN_SOURCE_BUILD = NO

BSTONE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -GNinja

define BSTONE_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(BSTONE_BUILDDIR)
endef

define BSTONE_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/buildroot-build/src/bstone $(TARGET_DIR)/usr/bin
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/bstone/bstone.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
