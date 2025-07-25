################################################################################
#
# srb2
#
################################################################################
# Version: Commits on Jul 25, 2025
SRB2_VERSION = 455f173479bd1ea8afeee93f156605409e6cde6e
SRB2_SITE = $(call github,STJr,SRB2,$(SRB2_VERSION))
SRB2_DEPENDENCIES = libgme libopenmpt sdl2 sdl2_mixer
SRB2_LICENSE = GPL-2.0
SRB2_SUPPORTS_IN_SOURCE_BUILD = NO

define SRB2_ASSETS
	mkdir -p $(@D)/assets/installer
	cp -avr /home/lee/srb2-assets/* $(@D)/assets/installer
endef

SRB2_POST_EXTRACT_HOOKS += SRB2_ASSETS

SRB2_CONF_OPTS += -DSRB2_SDL2_EXE_NAME=srb2
SRB2_CONF_OPTS += -DSRB2_CONFIG_ENABLE_TESTS=FALSE

define SRB2_INSTALL_TARGET_CMDS
	cp -L $(@D)/buildroot-build/bin/srb2 $(TARGET_DIR)/usr/bin/srb2
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/system/.srb2
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/sonic/srb2/config.cfg $(TARGET_DIR)/usr/share/batocera/datainit/system/.srb2/
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/sonic/srb2/srb2.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
