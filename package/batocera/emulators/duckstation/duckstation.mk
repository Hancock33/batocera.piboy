################################################################################
#
# duckstation
#
################################################################################
# Version: Commits on Apr 21, 2024
DUCKSTATION_VERSION = 106f2c10ba942bfa4d968e86ce5eb941e7edcd94
DUCKSTATION_SITE = https://github.com/stenzek/duckstation.git
DUCKSTATION_SITE_METHOD=git
DUCKSTATION_GIT_SUBMODULES=YES
DUCKSTATION_LICENSE = GPLv2
DUCKSTATION_DEPENDENCIES = boost ecm ffmpeg fmt libcurl libdrm libevdev sdl2 shaderc webp zstd
DUCKSTATION_DEPENDENCIES += qt6base qt6tools qt6svg
DUCKSTATION_SUPPORTS_IN_SOURCE_BUILD = NO

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
	DUCKSTATION_VERSION = 8867bb129a803fa88371645920f27430eaec7657
endif

DUCKSTATION_CONF_OPTS += -DBUILD_SHARED_LIBS=FALSE
DUCKSTATION_CONF_OPTS += -DENABLE_DISCORD_PRESENCE=OFF
DUCKSTATION_CONF_OPTS += -DBUILD_QT_FRONTEND=ON
DUCKSTATION_CONF_OPTS += -DBUILD_NOGUI_FRONTEND=OFF
DUCKSTATION_CONF_ENV += LDFLAGS=-lpthread

ifeq ($(BR2_PACKAGE_WAYLAND),y)
	DUCKSTATION_CONF_OPTS += -DENABLE_WAYLAND=ON
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
