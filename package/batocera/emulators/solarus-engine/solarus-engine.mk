################################################################################
#
# solarus-engine
#
################################################################################
# Version: Commits on 13 Jul, 2023
SOLARUS_ENGINE_VERSION = 207eec981a237948b50a0e3e3c40ef00fa940d0d
SOLARUS_ENGINE_SITE = https://gitlab.com/solarus-games/solarus
SOLARUS_ENGINE_SITE_METHOD=git

SOLARUS_ENGINE_LICENSE = GPL-3.0 (code), CC-BY-SA-4.0 (Solarus logos and icons), \
	CC-BY-SA-3.0 (GUI icons)
SOLARUS_ENGINE_LICENSE_FILES = license.txt

# Install libsolarus.so
SOLARUS_ENGINE_INSTALL_STAGING = YES

SOLARUS_ENGINE_DEPENDENCIES = batocera-luajit glm libmodplug libogg libvorbis openal physfs \
	sdl2 sdl2_image sdl2_ttf

SOLARUS_ENGINE_CONF_OPTS = \
	-DSOLARUS_GUI=OFF \
	-DSOLARUS_TESTS=OFF

ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
SOLARUS_ENGINE_DEPENDENCIES += libgles
SOLARUS_ENGINE_CONF_OPTS += -DSOLARUS_GL_ES=ON
endif

SOLARUS_ENGINE_CONF_OPTS += -DSOLARUS_BASE_WRITE_DIR=/userdata/saves
SOLARUS_ENGINE_CONF_OPTS += -DSOLARUS_WRITE_DIR=solarus

SOLARUS_ENGINE_CONF_OPTS += -DSOLARUS_USE_LUAJIT=ON

define SOLARUS_ENGINE_EVMAP
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/solarus-engine/solarus.keys $(TARGET_DIR)/usr/share/evmapy/solarus.keys
endef
SOLARUS_ENGINE_POST_INSTALL_TARGET_HOOKS += SOLARUS_ENGINE_EVMAP

$(eval $(cmake-package))
