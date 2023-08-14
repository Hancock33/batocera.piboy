################################################################################
#
# srb2kart
#
################################################################################
# Version: Commits on Aug 03, 2023
SRB2KART_VERSION = c499a8387e1daf9519d443251444beafbdeacea2
SRB2KART_SITE = $(call github,STJr,Kart-Public,$(SRB2KART_VERSION))

SRB2KART_DEPENDENCIES = sdl2 sdl2_mixer libgme
SRB2KART_LICENSE = GPL-2.0
SRB2KART_SUPPORTS_IN_SOURCE_BUILD = NO

define SRB2KART_ASSETS
	mkdir -p $(@D)/assets/installer
    cp -avr /home/lee/srb2kart/* $(@D)/assets/installer
	sed -i 's/-Wno-trigraphs//g' $(@D)/src/CMakeLists.txt
endef

SRB2KART_POST_EXTRACT_HOOKS += SRB2KART_ASSETS

define SRB2KART_INSTALL_TARGET_CMDS
	cp -L $(@D)/buildroot-build/bin/srb2kart $(TARGET_DIR)/usr/bin/srb2kart
	chmod 754 $(TARGET_DIR)/usr/bin/srb2kart
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/sonic/srb2kart/srb2kart.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
