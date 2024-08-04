################################################################################
#
# cgenius
#
################################################################################
# Version: Commits on Jul 28, 2024
CGENIUS_VERSION = bd7f9a8e3875b34f35593099f2080bbacd2fb6b6
CGENIUS_SITE = https://github.com/gerstrong/Commander-Genius

CGENIUS_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image sdl2_ttf boost libcurl
CGENIUS_SITE_METHOD=git
CGENIUS_GIT_SUBMODULES=YES
CGENIUS_SUPPORTS_IN_SOURCE_BUILD = NO

# No OpenGL ES support
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_ANY),y)
CGENIUS_CONF_OPTS += -DUSE_OPENGL=ON
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
CGENIUS_CONF_OPTS += -DUSE_OPENGL=ON
else
CGENIUS_CONF_OPTS += -DUSE_OPENGL=OFF -DEMBEDDED=ON
endif

CGENIUS_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
CGENIUS_CONF_OPTS += -DBUILD_COSMOS=1
CGENIUS_CONF_OPTS += -DGAMES_SHAREDIR=/userdata/roms/ports/cgenius
CGENIUS_CONF_OPTS += -DFULL_GAMES_SHAREDIR=/userdata/roms/ports/cgenius

define CGENIUS_INSTALL_TARGET_EVMAP
	rm -rf $(TARGET_DIR)/usr/share/batocera/datainit/roms/ports/cgenius
	mv $(TARGET_DIR)/userdata/roms/ports/cgenius/commandergenius $(TARGET_DIR)/usr/share/batocera/datainit/roms/ports/cgenius
	rm -r $(TARGET_DIR)/userdata/roms

	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/cgenius/*.keys $(TARGET_DIR)/usr/share/evmapy
endef

CGENIUS_POST_INSTALL_TARGET_HOOKS += CGENIUS_INSTALL_TARGET_EVMAP

$(eval $(cmake-package))
