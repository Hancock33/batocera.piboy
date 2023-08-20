################################################################################
#
# srb2
#
################################################################################
# Version: Commits on Aug 20, 2023
SRB2_VERSION = 909e07be65d74eb50fc7a41b27852ae387475738
SRB2_SITE = $(call github,STJr,SRB2,$(SRB2_VERSION))

SRB2_DEPENDENCIES = sdl2 sdl2_mixer libgme libopenmpt
SRB2_LICENSE = GPL-2.0
SRB2_SUPPORTS_IN_SOURCE_BUILD = NO

SRB2_CONF_OPTS += -DSRB2_ASSET_INSTALL=OFF

define SRB2_ASSETS
	mkdir -p $(@D)/assets/installer
	cp -avr /home/lee/srb2-assets/* $(@D)/assets/installer
	sed -i 's/-Wno-trigraphs//g' $(@D)/src/CMakeLists.txt
	sed -i 's/-mno-ms-bitfields//g' $(@D)/src/CMakeLists.txt
endef

SRB2_POST_EXTRACT_HOOKS += SRB2_ASSETS

define SRB2_INSTALL_TARGET_CMDS
	cp -L $(@D)/buildroot-build/bin/lsdlsrb2 $(TARGET_DIR)/usr/bin/srb2
	chmod 754 $(TARGET_DIR)/usr/bin/srb2
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/system/.srb2
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/sonic/srb2/config.cfg $(TARGET_DIR)/usr/share/batocera/datainit/system/.srb2/
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/sonic/srb2/srb2.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
