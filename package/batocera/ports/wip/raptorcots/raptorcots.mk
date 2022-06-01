################################################################################
#
# Raptor: Call of the Shadows Clone
#
################################################################################
# Version: Commits on Jun 01, 2022
RAPTORCOTS_VERSION = 21a88bbdcd56e7f5efb13ff92079949742edf504
RAPTORCOTS_SITE = $(call github,skynettx,raptor,$(RAPTORCOTS_VERSION))

RAPTORCOTS_DEPENDENCIES = sdl2 openal
RAPTORCOTS_LICENSE = GPL-2.0
RAPTORCOTS_SUPPORTS_IN_SOURCE_BUILD = NO

RAPTORCOTS_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
#RAPTORCOTS_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--unresolved-symbols=ignore-all"

define RAPTORCOTS_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/buildroot-build/bin/raptor $(TARGET_DIR)/usr/bin
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/RAPTORCOTS/raptor.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
