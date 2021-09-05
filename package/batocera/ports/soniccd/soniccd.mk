################################################################################
#
# Sonic-CD Decompilation
#
################################################################################
# Version.: Commits on Sep 05, 2021
SONICCD_VERSION = df1b86d758db4ff12d92c4d20545d73767c663ae
SONICCD_SITE = $(call github,Rubberduckycooly,Sonic-CD-11-Decompilation,$(SONICCD_VERSION))
SONICCD_DEPENDENCIES = sdl2 libvorbis libogg libtheora
SONICCD_LICENSE = Custom

define SONICCD_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -f Makefile VERBOSE=1
endef

define SONICCD_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/bin/soniccd $(TARGET_DIR)/usr/bin/soniccd
endef

define SONICCD_POST_PROCESS
	mkdir -p $(TARGET_DIR)/usr/share/evmapy $(TARGET_DIR)/usr/share/soniccd
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/soniccd/sonicretro.soniccd.keys $(TARGET_DIR)/usr/share/evmapy
endef

SONICCD_POST_INSTALL_TARGET_HOOKS += SONICCD_POST_PROCESS

$(eval $(generic-package))