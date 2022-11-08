################################################################################
#
# stk
#
################################################################################
# Version: Commits on Nov 08, 2022
STK_VERSION = 4c7353a3a46708bda229b5a0ca5ea679f9869e93
STK_SITE = https://github.com/supertuxkart/stk-code.git
STK_SITE_METHOD=git
STK_GIT_SUBMODULES=YES

STK_DEPENDENCIES = sdl2 sdl2_mixer
STK_LICENSE = GPL-2.0
STK_SUPPORTS_IN_SOURCE_BUILD = NO

STK_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
STK_CONF_OPTS += -USE_GLES2=ON
STK_CONF_OPTS += -DCHECK_ASSETS=OFF
STK_CONF_OPTS += -DUSE_WIIUSE=OFF
STK_CONF_OPTS += -DCMAKE_CXX_FLAGS="-DEGL_NO_X11"
STK_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF

define STK_ROMS_DIR
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/ports/stk
	mkdir -p $(TARGET_DIR)/usr/share/supertuxkart/data
	ln -sf /userdata/roms/ports/stk/karts $(TARGET_DIR)/usr/share/supertuxkart/data
	ln -sf /userdata/roms/ports/stk/library $(TARGET_DIR)/usr/share/supertuxkart/data
	ln -sf /userdata/roms/ports/stk/models $(TARGET_DIR)/usr/share/supertuxkart/data
	ln -sf /userdata/roms/ports/stk/music $(TARGET_DIR)/usr/share/supertuxkart/data
	ln -sf /userdata/roms/ports/stk/sfx $(TARGET_DIR)/usr/share/supertuxkart/data
	ln -sf /userdata/roms/ports/stk/textures $(TARGET_DIR)/usr/share/supertuxkart/data
	ln -sf /userdata/roms/ports/stk/tracks $(TARGET_DIR)/usr/share/supertuxkart/data
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/system/.config/supertuxkart/config-0.10
	cp  -pvr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/stk/*.xml $(TARGET_DIR)/usr/share/batocera/datainit/system/.config/supertuxkart/config-0.10
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/stk/stk.keys $(TARGET_DIR)/usr/share/evmapy
endef

STK_POST_INSTALL_TARGET_HOOKS += STK_ROMS_DIR

$(eval $(cmake-package))
