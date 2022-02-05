################################################################################
#
# Aliens Vs Predator
#
################################################################################
# Version.: Commits on Apr 19, 2020
AVP_VERSION = 2d5774781dd2ed959a83b2a98ab6f3f26e1dcc51
AVP_SITE = $(call github,neuromancer,avp,$(AVP_VERSION))

AVP_DEPENDENCIES = sdl2 sdl2_mixer
AVP_LICENSE = GPL-2.0

AVP_SUPPORTS_IN_SOURCE_BUILD = NO

AVP_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -DSDL_TYPE=SDL2 -DOPENGL_TYPE=OPENGLES2
AVP_CONF_OPTS += -DCMAKE_C_FLAGS="-DNDEBUG -Ofast -pipe -ffast-math -fno-math-errno -g -DFIXED_WINDOW_SIZE"
AVP_CONF_OPTS += -DCMAKE_CXX_FLAGS="-DNDEBUG -Ofast -pipe -std=c++11 -ffast-math -fno-math-errno -g -DDFIXED_WINDOW_SIZE"
AVP_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS="-g"

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
