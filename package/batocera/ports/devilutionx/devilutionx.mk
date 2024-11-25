################################################################################
#
# devilutionx
#
################################################################################
# Version: Commits on Nov 24, 2024
DEVILUTIONX_VERSION = 36e0abfc35d12ee57354a6ebca434ec78e3e7e90
DEVILUTIONX_SITE = https://github.com/diasurgical/devilutionX.git
DEVILUTIONX_SITE_METHOD=git
DEVILUTIONX_DEPENDENCIES = sdl2 sdl2_image fmt libsodium libpng bzip2 lua luafilesystem lua-lpeg-patterns lpeg luasocket luasec
DEVILUTIONX_SUPPORTS_IN_SOURCE_BUILD = NO

# Prefill the player name when creating a new character, in case the device does
# not have a keyboard.
DEVILUTIONX_CONF_OPTS += -DBUILD_TESTING=OFF
DEVILUTIONX_CONF_OPTS += -DUSE_LD_MOLD=ON
DEVILUTIONX_CONF_OPTS += -DPREFILL_PLAYER_NAME=ON
DEVILUTIONX_CONF_OPTS += -DCPACK=ON
DEVILUTIONX_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
DEVILUTIONX_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++

define DEVILUTIONX_FIX_SDL2MAIN
	sed -i -e s+"SDL2::SDL2main"+"-lSDL2main"+ $(@D)/CMakeLists.txt
	sed -i -e s+"SDL2::SDL2_image"+"-lSDL2_image"+ $(@D)/Source/CMakeLists.txt
endef

DEVILUTIONX_PRE_CONFIGURE_HOOKS += DEVILUTIONX_FIX_SDL2MAIN

define DEVILUTIONX_INSTALL_TARGET_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/bin/diablo
	mv $(TARGET_DIR)/usr/bin/devilutionx	$(TARGET_DIR)/usr/bin/diablo
	cp -a $(@D)/buildroot-build/assets		$(TARGET_DIR)/usr/bin/diablo
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/devilutionx/devilutionx.keys $(TARGET_DIR)/usr/share/evmapy
endef

DEVILUTIONX_POST_INSTALL_TARGET_HOOKS = DEVILUTIONX_INSTALL_TARGET_EVMAPY

$(eval $(cmake-package))
