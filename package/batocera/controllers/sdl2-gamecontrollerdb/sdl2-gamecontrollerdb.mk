################################################################################
#
# sdl2-gamecontrollerdb
#
################################################################################
# Version: Commits on Apr 12, 2023
SDL2_GAMECONTROLLERDB_VERSION = c3517cf0d87b35ebe6ae4f738e1d96166e44b58f
SDL2_GAMECONTROLLERDB_SITE = $(call github,gabomdq,SDL_GameControllerDB,$(SDL2_GAMECONTROLLERDB_VERSION))
SDL2_GAMECONTROLLERDB_DEPENDENCIES = sdl2

define SDL2_GAMECONTROLLERDB_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/sdlcontrollerdb
	cp $(@D)/gamecontrollerdb.txt $(TARGET_DIR)/usr/share/sdlcontrollerdb
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/sdl2-gamecontrollerdb/S98sdlctl_db $(TARGET_DIR)/etc/init.d/S98sdlctl_db
endef

$(eval $(generic-package))
