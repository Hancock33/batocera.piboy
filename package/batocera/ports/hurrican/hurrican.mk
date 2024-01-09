################################################################################
#
# hurrican
#
################################################################################
# Version: Commits on Dec 27, 2023
HURRICAN_VERSION = 2c5596b2fa242eb3ad7eebe7cdbf81b3586678bb
HURRICAN_SITE = https://github.com/HurricanGame/Hurrican

HURRICAN_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image libepoxy
HURRICAN_SITE_METHOD=git
HURRICAN_GIT_SUBMODULES=YES
HURRICAN_LICENSE = GPL-2.0
HURRICAN_SUPPORTS_IN_SOURCE_BUILD = NO
HURRICAN_SUBDIR = Hurrican

HURRICAN_CONF_OPTS += -DRENDERER=GLES2

define HURRICAN_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/hurrican/
	cp -pvr $(@D)/Hurrican/buildroot-build/hurrican $(TARGET_DIR)/usr/bin
	chmod 0755 $(TARGET_DIR)/usr/bin/hurrican
	cp -avr $(@D)/Hurrican/data $(TARGET_DIR)/usr/share/hurrican/
	cp -avr $(@D)/Hurrican/lang $(TARGET_DIR)/usr/share/hurrican/
	rm -r $(TARGET_DIR)/usr/share/hurrican/data/textures/pvr
	# install media
	mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/hurrican
	cp -a  $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/hurrican/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/hurrican/
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/hurrican/hurrican.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))

