################################################################################
#
# openlara
#
################################################################################
# Version: Commits on Mar 06, 2026
OPENLARA_VERSION = a8c7d935254c272411f17a7a70ce4d50726b02af
OPENLARA_SITE = $(call github,XProger,OpenLara,$(OPENLARA_VERSION))
OPENLARA_EMULATOR_INFO = openlara.emulator.yml
OPENLARA_DEPENDENCIES = openal sdl2 zlib
OPENLARA_LICENSE = GPL-2.0

define OPENLARA_BUILD_CMDS
	$(TARGET_CXX) -D_SDL2_OPENGL -std=c++11 `$(HOST_DIR)/bin/pkg-config sdl2 --cflags` $(TARGET_OPTIMIZATION) -fno-exceptions -fno-rtti -ffunction-sections -fdata-sections \
	-Wl,--gc-sections -DNDEBUG -D__SDL2__ $(@D)/src/platform/sdl2/main.cpp $(@D)/src/libs/stb_vorbis/stb_vorbis.c $(@D)/src/libs/minimp3/minimp3.cpp \
	$(@D)/src/libs/tinf/tinflate.c -I$(@D)/src/ -o $(@D)/OpenLara `$(HOST_DIR)/bin/pkg-config sdl2 --libs` -lGL -lm -lrt -lpthread -lasound -ludev
endef

define OPENLARA_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/OpenLara $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
