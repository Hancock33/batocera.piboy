################################################################################
#
# solarus-engine
#
################################################################################
# Version: Commits on 22 Sept, 2022
SOLARUS_ENGINE_VERSION = 83cf1685ac39f61d5561d22e4b48720edba5c2ce
SOLARUS_ENGINE_SITE = https://gitlab.com/solarus-games/solarus
SOLARUS_ENGINE_SITE_METHOD=git

SOLARUS_ENGINE_LICENSE = GPL-3.0 (code), CC-BY-SA-4.0 (Solarus logos and icons), \
	CC-BY-SA-3.0 (GUI icons)
SOLARUS_ENGINE_LICENSE_FILES = license.txt

# Install libsolarus.so
SOLARUS_ENGINE_INSTALL_STAGING = YES

SOLARUS_ENGINE_DEPENDENCIES = glm libmodplug libogg libvorbis openal physfs \
	sdl2 sdl2_image sdl2_ttf

# Disable launcher GUI (requires Qt5)
SOLARUS_ENGINE_CONF_OPTS = \
	-DSOLARUS_GUI=OFF \
	-DSOLARUS_TESTS=OFF

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
# Batocera - SBC prefer GLES
	ifneq ($(BR2_PACKAGE_BATOCERA_SBC_XORG),y)
		SOLARUS_ENGINE_DEPENDENCIES += libgl
	endif
else
	ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
		SOLARUS_ENGINE_DEPENDENCIES += libgles
		SOLARUS_ENGINE_CONF_OPTS += -DSOLARUS_GL_ES=ON
	endif
endif

SOLARUS_ENGINE_CONF_OPTS += -DSOLARUS_BASE_WRITE_DIR=/userdata/saves
SOLARUS_ENGINE_CONF_OPTS += -DSOLARUS_WRITE_DIR=solarus

ifeq ($(BR2_aarch64),y) # https://github.com/kubernetes/ingress-nginx/issues/2802
	SOLARUS_ENGINE_CONF_OPTS += -DSOLARUS_USE_LUAJIT=OFF
	SOLARUS_ENGINE_DEPENDENCIES += lua
else
	ifeq ($(BR2_PACKAGE_LUAJIT),y)
		SOLARUS_ENGINE_CONF_OPTS += -DSOLARUS_USE_LUAJIT=ON
		SOLARUS_ENGINE_DEPENDENCIES += luajit
	else
		SOLARUS_ENGINE_CONF_OPTS += -DSOLARUS_USE_LUAJIT=OFF
		SOLARUS_ENGINE_DEPENDENCIES += lua
	endif
endif

define SOLARUS_ENGINE_EVMAP
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/solarus-engine/solarus.keys $(TARGET_DIR)/usr/share/evmapy/solarus.keys
endef
SOLARUS_ENGINE_POST_INSTALL_TARGET_HOOKS += SOLARUS_ENGINE_EVMAP

$(eval $(cmake-package))
