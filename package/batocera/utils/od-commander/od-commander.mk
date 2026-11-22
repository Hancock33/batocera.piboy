################################################################################
#
# od-commander
#
################################################################################
# Version: Commits on Mar 24, 2026
OD_COMMANDER_VERSION = 1ca465f7cd5e080d13a8906fdfc45eb543ea255c
OD_COMMANDER_SITE = $(call github,jwty,tv-commander,$(OD_COMMANDER_VERSION))
OD_COMMANDER_LICENSE = MIT
OD_COMMANDER_LICENSE_FILES = LICENSE.txt
OD_COMMANDER_DEPENDENCIES = sdl2 sdl2_gfx sdl2_image sdl2_ttf dejavu nanum-font
OD_COMMANDER_EMULATOR_INFO = odcommander.emulator.yml

OD_COMMANDER_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
OD_COMMANDER_CONF_OPTS += -DCMDR_GAMEPAD_OPEN=ControllerButton::A
OD_COMMANDER_CONF_OPTS += -DCMDR_GAMEPAD_PARENT=ControllerButton::B

define OD_COMMANDER_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/commander $(TARGET_DIR)/usr/bin/od-commander
	rm -rf $(TARGET_DIR)/usr/share/commander/res
	mkdir -p $(TARGET_DIR)/usr/share/commander
	cp -r $(@D)/res $(TARGET_DIR)/usr/share/commander/res
	# install media
	mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/od-commander
	cp -a $(OD_COMMANDER_PKGDIR)/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/od-commander/
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
