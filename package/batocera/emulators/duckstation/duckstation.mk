################################################################################
#
# duckstation
#
################################################################################
# Version: Commits on Mar 31, 2024
DUCKSTATION_VERSION = 71a07a5a8e82ee79dacb2d2306d652d40cfda7eb
DUCKSTATION_SITE = https://github.com/stenzek/duckstation.git
DUCKSTATION_SITE_METHOD=git
DUCKSTATION_GIT_SUBMODULES=YES
DUCKSTATION_LICENSE = GPLv2
DUCKSTATION_DEPENDENCIES = fmt boost ffmpeg libcurl ecm libdrm sdl2 libevdev webp
DUCKSTATION_SUPPORTS_IN_SOURCE_BUILD = NO

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
DUCKSTATION_VERSION = 8b2b4ce8d9c8aeb2d53a0ec170cd1dfc31263f3c
endif

DUCKSTATION_CONF_OPTS += -DBUILD_SHARED_LIBS=FALSE
DUCKSTATION_CONF_OPTS += -DENABLE_DISCORD_PRESENCE=OFF
DUCKSTATION_CONF_OPTS += -DBUILD_QT_FRONTEND=OFF
DUCKSTATION_CONF_OPTS += -DBUILD_NOGUI_FRONTEND=ON
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

	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/duckstation/psx.duckstation.keys $(TARGET_DIR)/usr/share/evmapy
endef

define SOUNDTOUCH_OPTIMISE
	$(SED) "s|-Ofast|$(TARGET_OPTIMIZATION)|g" $(@D)/dep/soundtouch/CMakeLists.txt
endef

DUCKSTATION_PRE_CONFIGURE_HOOKS = SOUNDTOUCH_OPTIMISE

$(eval $(cmake-package))
