################################################################################
#
# avp
#
################################################################################
# Version: Commits on Aug 05, 2025
AVP_VERSION = febda659bc62c69734a2e762dbad670ad6659d54
AVP_SITE =  $(call github,atsb,NakedAVP,$(AVP_VERSION))
AVP_DEPENDENCIES = sdl3 sdl3_mixer
AVP_LICENSE = GPL-2.0
AVP_SUPPORTS_IN_SOURCE_BUILD = NO

AVP_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -Wno-implicit-function-declaration"
AVP_CONF_OPTS += -DOPENGL_TYPE=AUTO

define AVP_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/buildroot-build/avp $(TARGET_DIR)/usr/bin/avp
	chmod 0754 $(TARGET_DIR)/usr/bin/avp
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/avp/avp.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
