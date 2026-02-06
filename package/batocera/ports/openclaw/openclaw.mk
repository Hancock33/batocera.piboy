################################################################################
#
# openclaw
#
################################################################################
# Version: Commits on Jul 13, 2022
OPENCLAW_VERSION = 5ee5740ca98377c76b13b50c84f610b0066a4717
OPENCLAW_SITE = $(call github,pjasicek,OpenClaw,$(OPENCLAW_VERSION))
OPENCLAW_EMULATOR_INFO = openclaw.emulator.yml
OPENCLAW_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image sdl2_ttf sdl2_gfx
OPENCLAW_LICENSE = GPL-3.0
OPENCLAW_SUPPORTS_IN_SOURCE_BUILD = NO

define OPENCLAW_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/Build_Release/openclaw $(TARGET_DIR)/usr/bin/openclaw
	#copy assets
	rm $(@D)/Build_Release/ASSETS.ZIP
	cd $(@D)/Build_Release/ASSETS && zip -r ../ASSETS.ZIP *
	mkdir -p $(TARGET_DIR)/usr/share/game_assets/{openclaw,openclaw_zip}
	cp -v $(@D)/Build_Release/ASSETS.ZIP											$(TARGET_DIR)/usr/share/game_assets/openclaw_zip
	cp -v $(@D)/Build_Release/clacon.ttf											$(TARGET_DIR)/usr/share/game_assets/openclaw
	cp -v $(@D)/Build_Release/console02.tga											$(TARGET_DIR)/usr/share/game_assets/openclaw
	cp -v $(@D)/Build_Release/MENU.xml												$(TARGET_DIR)/usr/share/game_assets/openclaw
	cp -v $(@D)/Build_Release/SAVES.XML												$(TARGET_DIR)/usr/share/game_assets/openclaw
	cp -v $(@D)/Build_Release/startup_commands.txt									$(TARGET_DIR)/usr/share/game_assets/openclaw
	cp -v $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/openclaw/config.xml	$(TARGET_DIR)/usr/share/game_assets/openclaw
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/openclaw/openclaw.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
