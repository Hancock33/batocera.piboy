################################################################################
#
# stk
#
################################################################################
# Version: Commits on May 13, 2025
STK_VERSION = 68c395a685456e37709426b71d5f2c1e5edbe4a4
STK_SITE = $(call github,supertuxkart,stk-code,$(STK_VERSION))
STK_DEPENDENCIES = sdl2 sdl2_mixer shaderc
STK_LICENSE = GPL-2.0
STK_SUPPORTS_IN_SOURCE_BUILD = NO

STK_CONF_OPTS += -USE_GLES2=ON
STK_CONF_OPTS += -DCHECK_ASSETS=OFF
STK_CONF_OPTS += -DUSE_WIIUSE=OFF
STK_CONF_OPTS += -DCMAKE_CXX_FLAGS="-DEGL_NO_X11"
STK_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
STK_CONF_OPTS += -DBUILD_RECORDER=0

define STK_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/buildroot-build/bin/supertuxkart -D $(TARGET_DIR)/usr/bin/supertuxkart
	# config
	mkdir -p $(TARGET_DIR)/usr/share/game_assets/supertuxkart
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/stk/players.xml $(TARGET_DIR)/usr/share/game_assets/supertuxkart
endef

$(eval $(cmake-package))
