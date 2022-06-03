################################################################################
#
# Aliens Vs Predator
#
################################################################################
AVP_VERSION = 20170505-a1
AVP_SITE = http://www.icculus.org/avp/files
AVP_SOURCE = avp-$(AVP_VERSION).tar.gz

AVP_DEPENDENCIES = sdl2 sdl2_mixer
AVP_LICENSE = GPL-2.0

AVP_SUPPORTS_IN_SOURCE_BUILD = NO

AVP_CONF_OPTS += -DSDL_TYPE=SDL2 -DOPENGL_TYPE=OPENGL
AVP_CONF_OPTS += -DCMAKE_C_FLAGS="-O3 -mcpu=cortex-a72 -mtune=cortex-a72 -ffast-math -fno-math-errno -std=c++11 -g -DFIXED_WINDOW_SIZE"
AVP_CONF_OPTS += -DCMAKE_CXX_FLAGS="-O3 -mcpu=cortex-a72 -mtune=cortex-a72 -ffast-math -fno-math-errno -std=c++11 -g -DFIXED_WINDOW_SIZE"
AVP_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS="-g -Wl,--unresolved-symbols=ignore-all"

define AVP_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/buildroot-build/AVP $(TARGET_DIR)/usr/share/AVP/AVP
	chmod 0754 $(TARGET_DIR)/usr/share/AVP/AVP
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/AVP/AVP.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
