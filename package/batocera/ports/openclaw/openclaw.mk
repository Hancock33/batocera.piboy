################################################################################
#
# Open Claw
#
################################################################################
# Version.: Commits on Jun 7, 2021
OPENCLAW_VERSION = 3586dfade4a0ae9b4456d24b599c9e9b111522e2
OPENCLAW_SITE = $(call github,pjasicek,OpenClaw,$(OPENCLAW_VERSION))

OPENCLAW_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image sdl2_ttf sdl2_gfx
OPENCLAW_LICENSE = GPL-3.0
OPENCLAW_SUPPORTS_IN_SOURCE_BUILD = NO

OPENCLAW_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

define OPENCLAW_INSTALL_TARGET_CMDS
    $(INSTALL) -D $(@D)/Build_Release/openclaw $(TARGET_DIR)/usr/bin/openclaw
    #copy assets
    mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/openclaw
	cp -v $(@D)/Build_Release/ASSETS.ZIP $(TARGET_DIR)/usr/share/batocera/datainit/roms/openclaw/
	cp -v $(@D)/Build_Release/clacon.ttf $(TARGET_DIR)/usr/share/batocera/datainit/roms/openclaw/
	cp -v $(@D)/Build_Release/console02.tga $(TARGET_DIR)/usr/share/batocera/datainit/roms/openclaw/
	cp -v $(@D)/Build_Release/MENU.xml $(TARGET_DIR)/usr/share/batocera/datainit/roms/openclaw/
	cp -v $(@D)/Build_Release/SAVES.XML $(TARGET_DIR)/usr/share/batocera/datainit/roms/openclaw/
	cp -v $(@D)/Build_Release/startup_commands.txt $(TARGET_DIR)/usr/share/batocera/datainit/roms/openclaw/
	cp -v $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/openclaw/config.xml $(TARGET_DIR)/usr/share/batocera/datainit/roms/openclaw/
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/openclaw/openclaw.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
