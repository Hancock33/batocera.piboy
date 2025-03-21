################################################################################
#
# devilutionx
#
################################################################################
# Version: Commits on Aug 07, 2023
DEVILUTIONX_VERSION = 6112ca46e6ae74500620518e2cd00cc8220de6bd
DEVILUTIONX_SITE = https://github.com/diasurgical/devilutionX.git
DEVILUTIONX_SITE_METHOD=git
DEVILUTIONX_DEPENDENCIES = bzip2 fmt libpng libsodium lpeg lua lua-lpeg-patterns luafilesystem luasec luasocket sdl2 sdl2_image
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

define DEVILUTIONX_INSTALL_TARGET_ASSETS
	mkdir -p $(TARGET_DIR)/usr/bin/diablo
	mv $(TARGET_DIR)/usr/bin/devilutionx	$(TARGET_DIR)/usr/bin/diablo
	cp -a $(@D)/buildroot-build/assets		$(TARGET_DIR)/usr/bin/diablo
endef

DEVILUTIONX_POST_INSTALL_TARGET_HOOKS = DEVILUTIONX_INSTALL_TARGET_ASSETS

$(eval $(cmake-package))
