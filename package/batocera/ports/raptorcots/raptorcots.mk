################################################################################
#
# raptorcots
#
################################################################################
# Version: Commits on Dec 11, 2022
RAPTORCOTS_VERSION = 2c5cc26844693df303d0f0ab02cd33f0e3274c2b
RAPTORCOTS_SITE = $(call github,skynettx,raptor,$(RAPTORCOTS_VERSION))

RAPTORCOTS_DEPENDENCIES = sdl2 openal
RAPTORCOTS_LICENSE = GPL-2.0
RAPTORCOTS_SUPPORTS_IN_SOURCE_BUILD = NO

RAPTORCOTS_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
#RAPTORCOTS_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--unresolved-symbols=ignore-all"

define RAPTORCOTS_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/buildroot-build/bin/raptor $(TARGET_DIR)/usr/bin
	mkdir -p $(TARGET_DIR)/usr/share/raptor
	cp -av "$(@D)/SETUP(ADLIB).INI" $(TARGET_DIR)/usr/share/raptor/SETUP.INI
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/raptorcots/raptor.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
