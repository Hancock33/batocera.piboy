################################################################################
#
# avp
#
################################################################################
# Version: Commits on Apr 14, 2023
AVP_VERSION = 7e9aa037d5b5c9202838ae56674d62db209b52d1
AVP_SITE =  $(call github,atsb,NakedAVP,$(AVP_VERSION))

AVP_DEPENDENCIES = sdl2 sdl2_mixer
AVP_LICENSE = GPL-2.0

AVP_SUPPORTS_IN_SOURCE_BUILD = NO

AVP_CONF_OPTS += -DSDL_TYPE=SDL2 -DOPENGL_TYPE=OPENGL

define AVP_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/buildroot-build/avp $(TARGET_DIR)/usr/bin/avp
	chmod 0754 $(TARGET_DIR)/usr/bin/avp
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/avp/avp.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
