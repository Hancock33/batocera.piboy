################################################################################
#
# sdl2-gamecontrollerdb
#
################################################################################
# Version: Commits on Nov 17, 2026
SDL2_GAMECONTROLLERDB_VERSION = 4e87e3c6c2574f49e1cdf8526b6f829b61e5ccb3
SDL2_GAMECONTROLLERDB_SITE = $(call github,mdqinc,SDL_GameControllerDB,$(SDL2_GAMECONTROLLERDB_VERSION))
SDL2_GAMECONTROLLERDB_LICENSE = Zlib
SDL2_GAMECONTROLLERDB_LICENSE_FILES = LICENSE
SDL2_GAMECONTROLLERDB_DEPENDENCIES = sdl2

define SDL2_GAMECONTROLLERDB_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 $(@D)/gamecontrollerdb.txt $(TARGET_DIR)/usr/share/sdlcontrollerdb/gamecontrollerdb.txt
	$(INSTALL) -D -m 0755 $(SDL2_GAMECONTROLLERDB_PKGDIR)/S98sdlctl_db $(TARGET_DIR)/etc/init.d/S98sdlctl_db
endef

$(eval $(generic-package))
