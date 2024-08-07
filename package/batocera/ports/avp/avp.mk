################################################################################
#
# avp
#
################################################################################
# Version: Commits on Aug 07, 2024
AVP_VERSION = 32b8fdaf07e7e80e7eb67bfc2f0f4bc7a8dad1f1
AVP_SITE =  $(call github,atsb,NakedAVP,$(AVP_VERSION))

AVP_DEPENDENCIES = sdl2 sdl2_mixer
AVP_LICENSE = GPL-2.0
AVP_SUPPORTS_IN_SOURCE_BUILD = NO

AVP_TARGET_CFLAGS = $(TARGET_CFLAGS) -Wno-incompatible-pointer-types -Wno-implicit-function-declaration -Wno-int-conversion
AVP_CONF_OPTS += -DCMAKE_C_FLAGS="$(AVP_TARGET_CFLAGS)"
AVP_CONF_OPTS += -DSDL_TYPE=SDL2 -DOPENGL_TYPE=OPENGL
AVP_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
AVP_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++

define AVP_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/buildroot-build/avp $(TARGET_DIR)/usr/bin/avp
	chmod 0754 $(TARGET_DIR)/usr/bin/avp
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/avp/avp.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
