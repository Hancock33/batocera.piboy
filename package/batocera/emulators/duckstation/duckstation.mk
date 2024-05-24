################################################################################
#
# duckstation
#
################################################################################
# Version: Commits on May 24, 2024
DUCKSTATION_VERSION = a7f2ad37de936d68e8881aa6878e91ed213d228a
DUCKSTATION_SITE = $(call github,stenzek,duckstation,$(DUCKSTATION_VERSION))
DUCKSTATION_LICENSE = GPLv2
DUCKSTATION_DEPENDENCIES = boost ecm ffmpeg fmt libcurl libdrm libevdev sdl2 shaderc webp zstd
DUCKSTATION_DEPENDENCIES += qt6base qt6tools qt6svg
DUCKSTATION_SUPPORTS_IN_SOURCE_BUILD = NO

DUCKSTATION_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CFLAGS) -flax-vector-conversions"
DUCKSTATION_CONF_OPTS += -DBUILD_SHARED_LIBS=FALSE
DUCKSTATION_CONF_OPTS += -DENABLE_DISCORD_PRESENCE=OFF
DUCKSTATION_CONF_OPTS += -DBUILD_QT_FRONTEND=ON
DUCKSTATION_CONF_OPTS += -DBUILD_NOGUI_FRONTEND=OFF
DUCKSTATION_CONF_ENV += LDFLAGS=-lpthread

ifeq ($(BR2_PACKAGE_WAYLAND),y)
	DUCKSTATION_CONF_OPTS += -DENABLE_WAYLAND=ON
	DUCKSTATION_DEPENDENCIES += qt6wayland
else
	DUCKSTATION_CONF_OPTS += -DENABLE_WAYLAND=OFF
endif

ifeq ($(BR2_PACKAGE_XORG7),y)
	DUCKSTATION_CONF_OPTS += -DENABLE_X11=ON
else
	DUCKSTATION_CONF_OPTS += -DENABLE_X11=OFF
endif

ifeq ($(BR2_PACKAGE_VULKAN_HEADERS)$(BR2_PACKAGE_VULKAN_LOADER),yy)
	DUCKSTATION_CONF_OPTS += -DENABLE_VULKAN=ON
else
	DUCKSTATION_CONF_OPTS += -DENABLE_VULKAN=OFF
endif

define DUCKSTATION_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/duckstation
	$(INSTALL) -D $(@D)/buildroot-build/bin/duckstation*	$(TARGET_DIR)/usr/bin/duckstation
	cp -pr	$(@D)/data/resources							$(TARGET_DIR)/usr/bin/duckstation/
	cp -R $(@D)/buildroot-build/bin/translations			$(TARGET_DIR)/usr/bin/duckstation/

	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/duckstation/psx.duckstation.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
