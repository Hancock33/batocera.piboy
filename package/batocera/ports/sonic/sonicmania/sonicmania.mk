################################################################################
#
# sonicmania
#
################################################################################
# Version: Commits on Jan 25, 2023
SONICMANIA_VERSION = 0f75401660c9d94f84d364679024afdad6a59d87
SONICMANIA_SITE = https://github.com/Rubberduckycooly/Sonic-Mania-Decompilation.git
SONICMANIA_SITE_METHOD = git
SONICMANIA_GIT_SUBMODULES = YES

SONICMANIA_DEPENDENCIES = sdl2 libogg libvorbis
SONICMANIA_LICENSE = Custom

define SONICMANIA_BUILD_CMDS
    $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/dependencies/RSDKv5 -f Makefile PLATFORM=Linux SUBSYSTEM=SDL2
    $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -f Makefile
endef

define SONICMANIA_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/dependencies/RSDKv5/bin/Linux/SDL2/RSDKv5  $(TARGET_DIR)/usr/bin/sonicmania
	mkdir -p $(TARGET_DIR)/usr/share/game_assets/sonicmania
	$(INSTALL) -D -m 0755 $(@D)/dependencies/RSDKv5/bin/Linux/SDL2/Game.so $(TARGET_DIR)/usr/share/game_assets/sonicmania
endef

$(eval $(generic-package))
