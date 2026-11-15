################################################################################
#
# stuntcar
#
################################################################################
# Version: Commits on Nov 15, 2026
STUNTCAR_VERSION = a06b0a40698813cdb8b90a49e884342afc3b6563
STUNTCAR_SITE = $(call github,ptitSeb,stuntcarremake,$(STUNTCAR_VERSION))
STUNTCAR_EMULATOR_INFO = stuntcar.emulator.yml
STUNTCAR_DEPENDENCIES = sdl2 sdl2_mixer sdl2_ttf openal
STUNTCAR_LICENSE = GPL-2.0

STUNTCAR_CONF_OPTS += -DSTUNT_SDL2=ON

define STUNTCAR_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/stuntcar
	$(INSTALL) -D $(@D)/stuntcarracer $(TARGET_DIR)/usr/share/stuntcar/stuntcar
	chmod 0754 $(TARGET_DIR)/usr/share/stuntcar/stuntcar
	cp -av $(@D)/Bitmap $(TARGET_DIR)/usr/share/stuntcar/
	cp -av $(@D)/Sounds $(TARGET_DIR)/usr/share/stuntcar/
	cp -av $(@D)/Tracks $(TARGET_DIR)/usr/share/stuntcar/
	cp -av $(@D)/DejaVuSans-Bold.ttf $(TARGET_DIR)/usr/share/stuntcar/
	# install media
	mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/stuntcar
	cp -a  $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/stuntcar/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/stuntcar/
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/stuntcar/stuntcar.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
