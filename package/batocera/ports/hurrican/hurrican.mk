################################################################################
#
# hurrican
#
################################################################################
# Version: Commits on Dec 12, 2023
HURRICAN_VERSION = 780878cad348c09c335af331fc3cd6c67ab5df87
HURRICAN_SITE = https://github.com/HurricanGame/Hurrican

HURRICAN_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image libepoxy
HURRICAN_SITE_METHOD=git
HURRICAN_GIT_SUBMODULES=YES
HURRICAN_LICENSE = GPL-2.0
HURRICAN_SUPPORTS_IN_SOURCE_BUILD = NO

HURRICAN_CONF_OPTS += $(@D)/Hurrican -DRENDERER=GLES2

define HURRICAN_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/hurrican/
	cp -pvr $(@D)/buildroot-build/hurrican $(TARGET_DIR)/usr/bin
	chmod 0755 $(TARGET_DIR)/usr/bin/hurrican
	cp -avr $(@D)/Hurrican/data $(TARGET_DIR)/usr/share/hurrican/
	cp -avr $(@D)/Hurrican/lang $(TARGET_DIR)/usr/share/hurrican/
	# install media
	mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/hurrican
	cp -a  $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/hurrican/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/hurrican/
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/hurrican/hurrican.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))

