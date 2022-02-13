################################################################################
#
# SuperTuxKart
#
################################################################################
# Version.: Commits on Feb 13, 2022
STK_VERSION = 9a3c51815a20aa3c2908f476dd150fffc08dbf5a
STK_SITE = $(call github,supertuxkart,stk-code,$(STK_VERSION))

STK_DEPENDENCIES = sdl2 sdl2_mixer
STK_LICENSE = GPL-2.0
STK_SUPPORTS_IN_SOURCE_BUILD = NO

STK_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
STK_CONF_OPTS += -USE_GLES2=ON
STK_CONF_OPTS += -DCHECK_ASSETS=OFF
STK_CONF_OPTS += -DUSE_WIIUSE=OFF
STK_CONF_OPTS += -DCMAKE_CXX_FLAGS="-DEGL_NO_X11"

define STK_ROMS_DIR
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/stk
	mkdir -p $(TARGET_DIR)/usr/share/supertuxkart/data
	ln -sf /userdata/roms/stk/karts $(TARGET_DIR)/usr/share/supertuxkart/data
	ln -sf /userdata/roms/stk/library $(TARGET_DIR)/usr/share/supertuxkart/data
	ln -sf /userdata/roms/stk/models $(TARGET_DIR)/usr/share/supertuxkart/data
	ln -sf /userdata/roms/stk/music $(TARGET_DIR)/usr/share/supertuxkart/data
	ln -sf /userdata/roms/stk/sfx $(TARGET_DIR)/usr/share/supertuxkart/data
	ln -sf /userdata/roms/stk/textures $(TARGET_DIR)/usr/share/supertuxkart/data
	ln -sf /userdata/roms/stk/tracks $(TARGET_DIR)/usr/share/supertuxkart/data
	cp -pvr $(@D)/buildroot-build/lib/libsquish/libsquish.so* $(TARGET_DIR)/usr/lib
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/system/.config/supertuxkart/config-0.10
	cp  -pvr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/stk/*.xml $(TARGET_DIR)/usr/share/batocera/datainit/system/.config/supertuxkart/config-0.10
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/stk/stk.keys $(TARGET_DIR)/usr/share/evmapy

endef

STK_POST_INSTALL_TARGET_HOOKS += STK_ROMS_DIR

$(eval $(cmake-package))
