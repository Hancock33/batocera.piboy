################################################################################
#
# cgenius
#
################################################################################
# Version: Commits on May 24, 2025
CGENIUS_VERSION = e9782c7328bcee0df33e401a9ff1a0ec563de88d
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

define CGENIUS_INSTALL_TARGET_ASSETS
	rm -rf $(TARGET_DIR)/usr/share/batocera/datainit/roms/ports/cgenius
	mv $(TARGET_DIR)/userdata/roms/ports/cgenius/commandergenius $(TARGET_DIR)/usr/share/batocera/datainit/roms/ports/cgenius
endef

CGENIUS_POST_INSTALL_TARGET_HOOKS += CGENIUS_INSTALL_TARGET_ASSETS

$(eval $(cmake-package))
