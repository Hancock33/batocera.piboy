################################################################################
#
# Aliens Vs Predator
#
################################################################################
# Version.: Commits on May 05, 2017
AVP_VERSION = 76a0169ab4a9226ae0f637fbabbf836447f804e9
AVP_SITE = $(call github,Rinnegatamante,AvP-Gold-Vita,$(AVP_VERSION))

AVP_DEPENDENCIES = sdl2 sdl2_mixer
AVP_LICENSE = GPL-2.0

AVP_SUPPORTS_IN_SOURCE_BUILD = NO

AVP_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -DSDL_TYPE=SDL2


define AVP_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/AVP
	cp -pvr $(@D)/data $(TARGET_DIR)/usr/share/AVP/
	$(INSTALL) -D $(@D)/buildroot-build/AVP $(TARGET_DIR)/usr/share/AVP/AVP
	chmod 0754 $(TARGET_DIR)/usr/share/AVP/AVP
	echo "cd /usr/share/AVP && ./AVP" > $(TARGET_DIR)/usr/share/AVP/AVP.sh
	chmod 0754 $(TARGET_DIR)/usr/share/AVP/AVP.sh

	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/AVP/AVP.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
