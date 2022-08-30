################################################################################
#
# sonicmania
#
################################################################################
# Version: Commits on Aug 30, 2022
SONICMANIA_VERSION = 75c87c70e1a735a3aa3b98068ba033cf5a688628
SONICMANIA_SITE = https://github.com/Rubberduckycooly/Sonic-Mania-Decompilation.git
SONICMANIA_SITE_METHOD = git
SONICMANIA_GIT_SUBMODULES == YES

SONICMANIA_DEPENDENCIES = sdl2 libogg libvorbis
SONICMANIA_LICENSE = Custom

define SONICMANIA_BUILD_CMDS
    $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/dependencies/RSDKv5 -f Makefile PLATFORM=Linux SUBSYSTEM=SDL2
    $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -f Makefile STATIC=0
endef

define SONICMANIA_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/sonic_mania
	$(INSTALL) -D -m 0755 $(@D)/dependencies/RSDKv5/bin/Linux/SDL2/RSDKv5  $(TARGET_DIR)/usr/bin/sonicmania
	$(INSTALL) -D -m 0755 $(@D)/dependencies/RSDKv5/bin/Linux/SDL2/Game.so $(TARGET_DIR)/usr/bin/sonic_mania/Game.so
endef

define SONICMANIA_POST_PROCESS
	mkdir -p $(TARGET_DIR)/usr/share/evmapy $(TARGET_DIR)/usr/share/sonicmania
	cp -f $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/sonicmania/sonicretro.keys $(TARGET_DIR)/usr/share/evmapy
endef

SONICMANIA_POST_INSTALL_TARGET_HOOKS += SONICMANIA_POST_PROCESS

$(eval $(generic-package))
