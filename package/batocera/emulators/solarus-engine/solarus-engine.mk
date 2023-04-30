################################################################################
#
# solarus-engine
#
################################################################################
# Version: Commits on 20 Apr, 2023
SOLARUS_ENGINE_VERSION = bb74db8e7937b32f39f1d7a234e57bf412669c96
SOLARUS_ENGINE_SITE = https://gitlab.com/solarus-games/solarus
SOLARUS_ENGINE_SITE_METHOD=git

SOLARUS_ENGINE_LICENSE = GPL-3.0 (code), CC-BY-SA-4.0 (Solarus logos and icons), \
	CC-BY-SA-3.0 (GUI icons)
SOLARUS_ENGINE_LICENSE_FILES = license.txt

# Install libsolarus.so
SOLARUS_ENGINE_INSTALL_STAGING = YES

SOLARUS_ENGINE_DEPENDENCIES = glm libmodplug libogg libvorbis openal physfs \
	sdl2 sdl2_image sdl2_ttf host-ninja

# Disable launcher GUI (requires Qt5)
SOLARUS_ENGINE_CONF_OPTS = \
	-DSOLARUS_GUI=OFF \
	-DSOLARUS_TESTS=OFF \
	-GNinja

ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
	SOLARUS_ENGINE_DEPENDENCIES += libgles
	SOLARUS_ENGINE_CONF_OPTS += -DSOLARUS_GL_ES=ON
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

define SOLARUS_ENGINE_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(SOLARUS_ENGINE_BUILDDIR)
endef

define SOLARUS_ENGINE_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(SOLARUS_ENGINE_BUILDDIR)
endef

define SOLARUS_ENGINE_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(SOLARUS_ENGINE_BUILDDIR)
endef

define SOLARUS_ENGINE_EVMAP
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/solarus-engine/solarus.keys $(TARGET_DIR)/usr/share/evmapy/solarus.keys
endef
SOLARUS_ENGINE_POST_INSTALL_TARGET_HOOKS += SOLARUS_ENGINE_EVMAP

$(eval $(cmake-package))
