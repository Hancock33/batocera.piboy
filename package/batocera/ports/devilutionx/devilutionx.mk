################################################################################
#
# devilutionx
#
################################################################################
# Version: Commits on Jul 12, 2026
DEVILUTIONX_VERSION = 4f6ad78fc37104e062d4aec81ad04d6080eddbad
DEVILUTIONX_SITE = https://github.com/diasurgical/devilutionX.git
DEVILUTIONX_SITE_METHOD=git
DEVILUTIONX_EMULATOR_INFO = devilutionx.emulator.yml
DEVILUTIONX_DEPENDENCIES += bzip2 fmt libpng libsodium lpeg lua lua-lpeg-patterns luafilesystem luasec luasocket 
DEVILUTIONX_DEPENDENCIES += sdl3 sdl3_image sdl3_mixer
DEVILUTIONX_SUPPORTS_IN_SOURCE_BUILD = NO

# Prefill the player name when creating a new character, in case the device does
# not have a keyboard.
DEVILUTIONX_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
DEVILUTIONX_CONF_OPTS += -DBUILD_TESTING=OFF
DEVILUTIONX_CONF_OPTS += -DCPACK=ON
DEVILUTIONX_CONF_OPTS += -DDEVILUTIONX_SYSTEM_SDL3=ON
DEVILUTIONX_CONF_OPTS += -DPREFILL_PLAYER_NAME=ON
DEVILUTIONX_CONF_OPTS += -DUSE_LD_MOLD=ON
DEVILUTIONX_CONF_OPTS += -DUSE_SDL3=ON 

define DEVILUTIONX_INSTALL_TARGET_ASSETS
	mkdir -p $(TARGET_DIR)/usr/bin/diablo
	mv $(TARGET_DIR)/usr/bin/devilutionx	$(TARGET_DIR)/usr/bin/diablo
	cp -a $(@D)/buildroot-build/assets		$(TARGET_DIR)/usr/bin/diablo
	cp -a $(@D)/buildroot-build/_deps/sheenbidi-build/libSheenBidi.so* $(TARGET_DIR)/usr/lib
endef

DEVILUTIONX_POST_INSTALL_TARGET_HOOKS = DEVILUTIONX_INSTALL_TARGET_ASSETS

$(eval $(cmake-package))
$(eval $(emulator-info-package))
