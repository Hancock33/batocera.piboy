################################################################################
#
# openlara
#
################################################################################
# Version: Commits on May 13, 2024
OPENLARA_VERSION = 28ee7ac92367e6c97aea2391c25e1c6fe29785aa
OPENLARA_SITE = $(call github,XProger,OpenLara,$(OPENLARA_VERSION))

OPENLARA_DEPENDENCIES = sdl2 sdl2_mixer openal
OPENLARA_LICENSE = GPL-2.0

define OPENLARA_BUILD_CMDS
	$(TARGET_CXX) -D_SDL2_OPENGL -std=c++11 `$(HOST_DIR)/usr/bin/pkg-config sdl2 --cflags` $(TARGET_OPTIMIZATION) -fno-exceptions -fno-rtti -ffunction-sections -fdata-sections \
	-Wl,--gc-sections -DNDEBUG -D__SDL2__ $(@D)/src/platform/sdl2/main.cpp $(@D)/src/libs/stb_vorbis/stb_vorbis.c $(@D)/src/libs/minimp3/minimp3.cpp \
	$(@D)/src/libs/tinf/tinflate.c -I$(@D)/src/ -o $(@D)/OpenLara `$(HOST_DIR)/usr/bin/pkg-config sdl2 --libs` -lGL -lm -lrt -lpthread -lasound -ludev
endef

define OPENLARA_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/OpenLara $(TARGET_DIR)/usr/bin
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/openlara/openlara.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(generic-package))
