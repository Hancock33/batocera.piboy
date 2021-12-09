################################################################################
#
# HURRICAN
#
################################################################################
# Version.: Commits on Dec 08, 2021
HURRICAN_VERSION = 446b7a1a53a364e046b1b4e1570c522588aa5542
HURRICAN_SITE = https://github.com/drfiemost/Hurrican.git

HURRICAN_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image libepoxy
HURRICAN_SITE_METHOD=git
HURRICAN_GIT_SUBMODULES=YES
HURRICAN_LICENSE = GPL-2.0

HURRICAN_SUPPORTS_IN_SOURCE_BUILD = NO

HURRICAN_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release $(@D)/Hurrican -DRENDERER=GLES2

define HURRICAN_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/hurrican/
	cp -pvr $(@D)/buildroot-build/hurrican $(TARGET_DIR)/usr/bin
	chmod 0755 $(TARGET_DIR)/usr/bin/hurrican
    cp -avr $(@D)/Hurrican/data $(TARGET_DIR)/usr/share/hurrican/
    cp -avr $(@D)/Hurrican/lang $(TARGET_DIR)/usr/share/hurrican/

	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/hurrican/hurrican.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))

