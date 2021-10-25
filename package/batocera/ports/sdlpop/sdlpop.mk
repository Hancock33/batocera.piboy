################################################################################
#
# SDLPOP
#
################################################################################
# Version.: Commits on Oct 24, 2021
SDLPOP_VERSION = 8a07f11bd5952b5e1b9558c334bfbcd8f8f254bd
SDLPOP_SITE = $(call github,NagyD,SDLPoP,$(SDLPOP_VERSION))
SDLPOP_SUBDIR = src
SDLPOP_LICENSE = GPLv3
SDLPOP_DEPENDENCIES = sdl2 sdl2_image

define SDLPOP_BUILD_CMDS
		$(TARGET_CONFIGURE_OPTS) $(MAKE) \
		CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
		-C $(@D)/src -f Makefile
endef

define SDLPOP_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/sdlpop
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	$(INSTALL) -m 0755 $(@D)/prince -D $(TARGET_DIR)/usr/bin/SDLPoP
	cp -pr $(@D)/data $(TARGET_DIR)/usr/share/sdlpop/
	ln -sf /userdata/system/configs/sdlpop/SDLPoP.ini $(TARGET_DIR)/usr/share/sdlpop/SDLPoP.ini
	ln -sf /userdata/system/configs/sdlpop/SDLPoP.cfg $(TARGET_DIR)/usr/share/sdlpop/SDLPoP.cfg
	ln -sf /userdata/screenshots $(TARGET_DIR)/usr/share/sdlpop/screenshots
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/sdlpop/sdlpop.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(generic-package))
