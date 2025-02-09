################################################################################
#
# cgenius
#
################################################################################
# Version: Commits on Jan 26, 2025
CGENIUS_VERSION = 14c9da0038875154991109ceec836faabb8994d5
CGENIUS_SITE = https://github.com/gerstrong/Commander-Genius
CGENIUS_SITE_METHOD=git
CGENIUS_GIT_SUBMODULES=YES
CGENIUS_SUPPORTS_IN_SOURCE_BUILD = NO
CGENIUS_CONF_LICENSE = GPL-2.0
CGENIUS_CONF_LICENSE_FILES = LICENSE
CGENIUS_DEPENDENCIES += boost host-xxd libcurl python-configobj
CGENIUS_DEPENDENCIES += sdl2 sdl2_image sdl2_mixer sdl2_ttf

CGENIUS_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
CGENIUS_CONF_OPTS += -DBUILD_COSMOS=1
CGENIUS_CONF_OPTS += -DGAMES_SHAREDIR=/userdata/roms/ports/cgenius
CGENIUS_CONF_OPTS += -DFULL_GAMES_SHAREDIR=/userdata/roms/ports/cgenius

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
CGENIUS_CONF_OPTS += -DUSE_OPENGL=ON
else
CGENIUS_CONF_OPTS += -DUSE_OPENGL=OFF
endif

define CGENIUS_INSTALL_TARGET_EVMAP
	rm -rf $(TARGET_DIR)/usr/share/batocera/datainit/roms/ports/cgenius
	mv $(TARGET_DIR)/userdata/roms/ports/cgenius/commandergenius $(TARGET_DIR)/usr/share/batocera/datainit/roms/ports/cgenius

	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/cgenius/*.keys $(TARGET_DIR)/usr/share/evmapy
endef

CGENIUS_POST_INSTALL_TARGET_HOOKS += CGENIUS_INSTALL_TARGET_EVMAP

$(eval $(cmake-package))
