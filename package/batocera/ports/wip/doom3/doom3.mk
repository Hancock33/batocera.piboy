################################################################################
#
# Doom 3
#
################################################################################
# Version.: Commits on Jun 20, 2021
DOOM3_VERSION = ae63021d0060a61374657e507a43fcd12a0d0606
DOOM3_SITE = $(call github,dhewm,dhewm3,$(DOOM3_VERSION))

DOOM3_DEPENDENCIES = sdl2 sdl2_mixer
DOOM3_LICENSE = GPL-2.0

DOOM3_SUPPORTS_IN_SOURCE_BUILD = NO
DOOM3_SUBDIR = neo

DOOM3_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
DOOM3_CONF_OPTS += -DSDL2=ON

define DOOM3_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/neo/buildroot-build/idlib/libidlib.so $(TARGET_DIR)/usr/lib
	cp -pvr $(@D)/neo/buildroot-build/RBDoom3BFG $(TARGET_DIR)/usr/bin

	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	#cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/bennugd/bennugd.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))

