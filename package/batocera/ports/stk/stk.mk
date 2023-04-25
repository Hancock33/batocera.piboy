################################################################################
#
# stk
#
################################################################################
# Version: Commits on Oct 31, 2022
STK_VERSION = 1.4
STK_SITE = https://github.com/supertuxkart/stk-code.git
STK_SITE_METHOD=git
STK_GIT_SUBMODULES=YES

STK_DEPENDENCIES = sdl2 sdl2_mixer host-ninja
STK_LICENSE = GPL-2.0
STK_SUPPORTS_IN_SOURCE_BUILD = NO

STK_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -GNinja
STK_CONF_OPTS += -USE_GLES2=ON
STK_CONF_OPTS += -DCHECK_ASSETS=OFF
STK_CONF_OPTS += -DUSE_WIIUSE=OFF
STK_CONF_OPTS += -DCMAKE_CXX_FLAGS="-DEGL_NO_X11"
STK_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
STK_CONF_OPTS += -DBUILD_RECORDER=0

define STK_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(STK_BUILDDIR)
endef

define STK_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/buildroot-build/bin/supertuxkart -D $(TARGET_DIR)/usr/bin/supertuxkart
	# config
    mkdir -p $(TARGET_DIR)/usr/share/game_assets/supertuxkart
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/stk/players.xml $(TARGET_DIR)/usr/share/game_assets/supertuxkart
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/stk/stk.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
