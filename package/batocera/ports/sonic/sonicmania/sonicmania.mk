################################################################################
#
# sonicmania
#
################################################################################
# Version: Commits on Oct 21, 2023
SONICMANIA_VERSION = 131f32c12551c3cc4126bf608b23549a96adc05f
SONICMANIA_SITE = https://github.com/Rubberduckycooly/Sonic-Mania-Decompilation.git
SONICMANIA_SITE_METHOD = git
SONICMANIA_GIT_SUBMODULES = YES

SONICMANIA_DEPENDENCIES = sdl2 libogg libvorbis
SONICMANIA_LICENSE = Custom

define SONICMANIA_BUILD_CMDS
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION) |g" $(@D)/dependencies/RSDKv5/Makefile
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION) |g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/dependencies/RSDKv5 -f Makefile PLATFORM=Linux SUBSYSTEM=SDL2
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -f Makefile
endef

define SONICMANIA_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/dependencies/RSDKv5/bin/Linux/SDL2/RSDKv5U $(TARGET_DIR)/usr/bin/sonicmania
	mkdir -p $(TARGET_DIR)/usr/share/game_assets/sonicmania
	$(INSTALL) -D -m 0755 $(@D)/dependencies/RSDKv5/bin/Linux/SDL2/Game.so $(TARGET_DIR)/usr/share/game_assets/sonicmania
endef

$(eval $(generic-package))