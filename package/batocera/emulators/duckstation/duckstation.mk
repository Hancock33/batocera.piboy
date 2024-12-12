################################################################################
#
# duckstation
#
################################################################################
# Version: Commits on Dec 12, 2024
DUCKSTATION_VERSION = db848d1381e3b2f8fae4b2046afb011a96c64e5b
DUCKSTATION_SITE = $(call github,stenzek,duckstation,$(DUCKSTATION_VERSION))
DUCKSTATION_LICENSE = GPLv2
DUCKSTATION_DEPENDENCIES = boost cpuinfo ecm ffmpeg fmt libbacktrace libcurl libdrm libevdev libsoundtouch lunasvg sdl2 stenzek-shaderc webp zstd
DUCKSTATION_DEPENDENCIES += qt6base qt6tools qt6svg host-clang host-spirv-cross spirv-cross
DUCKSTATION_SUPPORTS_IN_SOURCE_BUILD = NO

DUCKSTATION_CONF_OPTS += -DBUILD_SHARED_LIBS=FALSE
DUCKSTATION_CONF_OPTS += -DENABLE_DISCORD_PRESENCE=OFF
DUCKSTATION_CONF_OPTS += -DBUILD_QT_FRONTEND=ON
DUCKSTATION_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/clang
DUCKSTATION_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/clang++
DUCKSTATION_CONF_OPTS += -DCMAKE_PREFIX_PATH=$(STAGING_DIR)/stenzek-shaderc
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

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
    DUCKSTATION_DEPENDENCIES += glslang
    DUCKSTATION_CONF_OPTS += -DENABLE_VULKAN=ON
else
    DUCKSTATION_CONF_OPTS += -DENABLE_VULKAN=OFF
endif

define DUCKSTATION_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/bin/duckstation
	cp -R $(@D)/buildroot-build/bin $(TARGET_DIR)/usr/bin/duckstation

	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/duckstation/psx.duckstation.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
