################################################################################
#
# duckstation-legacy
#
################################################################################
# Version: Commits on Mar 16, 2024
DUCKSTATION_LEGACY_VERSION = v0.1-6461
DUCKSTATION_LEGACY_SITE = https://github.com/stenzek/duckstation.git
DUCKSTATION_LEGACY_SITE_METHOD=git
DUCKSTATION_LEGACY_GIT_SUBMODULES=YES
DUCKSTATION_LEGACY_LICENSE = GPLv2
DUCKSTATION_LEGACY_DEPENDENCIES = boost dbus ecm ffmpeg fmt libcurl libdrm libevdev sdl2 shaderc webp zstd

DUCKSTATION_LEGACY_SUPPORTS_IN_SOURCE_BUILD = NO

DUCKSTATION_LEGACY_CONF_OPTS += -DBUILD_SHARED_LIBS=FALSE
DUCKSTATION_LEGACY_CONF_OPTS += -DENABLE_DISCORD_PRESENCE=OFF
DUCKSTATION_LEGACY_CONF_OPTS += -DBUILD_QT_FRONTEND=OFF
DUCKSTATION_LEGACY_CONF_OPTS += -DBUILD_NOGUI_FRONTEND=ON
DUCKSTATION_LEGACY_CONF_ENV += LDFLAGS=-lpthread

ifeq ($(BR2_PACKAGE_WAYLAND),y)
	DUCKSTATION_LEGACY_CONF_OPTS += -DENABLE_WAYLAND=ON
else
	DUCKSTATION_LEGACY_CONF_OPTS += -DENABLE_WAYLAND=OFF
endif

ifeq ($(BR2_PACKAGE_XORG7),y)
	DUCKSTATION_LEGACY_CONF_OPTS += -DENABLE_X11=ON
else
	DUCKSTATION_LEGACY_CONF_OPTS += -DENABLE_X11=OFF
endif

ifeq ($(BR2_PACKAGE_VULKAN_HEADERS)$(BR2_PACKAGE_VULKAN_LOADER),yy)
	DUCKSTATION_LEGACY_CONF_OPTS += -DENABLE_VULKAN=ON
else
	DUCKSTATION_LEGACY_CONF_OPTS += -DENABLE_VULKAN=OFF
endif

define DUCKSTATION_LEGACY_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/duckstation-legacy
	$(INSTALL) -D $(@D)/buildroot-build/bin/duckstation*	$(TARGET_DIR)/usr/bin/duckstation-legacy
	cp -pr	$(@D)/data/resources							$(TARGET_DIR)/usr/bin/duckstation-legacy/

	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/duckstation-legacy/psx.duckstation.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
