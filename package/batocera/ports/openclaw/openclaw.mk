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
	rm -f $(@D)/Build_Release/ASSETS.ZIP
	cd $(@D)/Build_Release/ASSETS && zip -r ../ASSETS.ZIP *
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/share/game_assets/openclaw_zip $(@D)/Build_Release/ASSETS.ZIP
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/share/game_assets/openclaw \
		$(@D)/Build_Release/clacon.ttf \
		$(@D)/Build_Release/console02.tga \
		$(@D)/Build_Release/MENU.xml \
		$(@D)/Build_Release/SAVES.XML \
		$(@D)/Build_Release/startup_commands.txt \
		$(OPENCLAW_PKGDIR)/config.xml
	# evmap config
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/share/evmapy $(OPENCLAW_PKGDIR)/openclaw.keys
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
