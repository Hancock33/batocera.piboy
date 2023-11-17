################################################################################
#
# yuzu
#
################################################################################
# Version: Commits on Nov 17, 2023
YUZU_VERSION = 4c16a1a26f3d35c5d3a57a6b1e988d3c3e07a932
YUZU_SITE = https://github.com/yuzu-emu/yuzu.git
YUZU_SITE_METHOD=git
YUZU_GIT_SUBMODULES=YES
YUZU_LICENSE = GPLv2
YUZU_DEPENDENCIES += fmt boost ffmpeg zstd zlib libzip lz4 catch2 sdl2 opus
YUZU_DEPENDENCIES += qt6base qt6svg qt6tools
YUZU_SUPPORTS_IN_SOURCE_BUILD = NO
YUZU_TZDB_VERSION = 221202
YUZU_EXTRA_DOWNLOADS = https://github.com/lat9nq/tzdb_to_nx/releases/download/$(YUZU_TZDB_VERSION)/$(YUZU_TZDB_VERSION).zip

YUZU_CONF_ENV += LDFLAGS=-lpthread ARCHITECTURE_x86_64=1

YUZU_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
YUZU_CONF_OPTS += -DARCHITECTURE_x86_64=ON
YUZU_CONF_OPTS += -DENABLE_SDL2=ON
YUZU_CONF_OPTS += -DYUZU_USE_EXTERNAL_SDL2=OFF
YUZU_CONF_OPTS += -DUSE_DISCORD_PRESENCE=OFF
YUZU_CONF_OPTS += -DYUZU_TESTS=OFF
YUZU_CONF_OPTS += -DENABLE_QT6=ON
YUZU_CONF_OPTS += -DYUZU_ENABLE_LTO=ON
YUZU_CONF_OPTS += -DYUZU_USE_EXTERNAL_VULKAN_HEADERS=OFF
YUZU_CONF_OPTS += -DYUZU_DOWNLOAD_TIME_ZONE_DATA=ON
YUZU_CONF_OPTS += -DENABLE_WEB_SERVICE=OFF

ifeq ($(BR2_PACKAGE_VULKAN_HEADERS)$(BR2_PACKAGE_VULKAN_LOADER),yy)
	YUZU_DEPENDENCIES += host-glslang
endif

define YUZU_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin
	$(INSTALL) -D $(@D)/buildroot-build/bin/yuzu $(TARGET_DIR)/usr/bin/
	$(INSTALL) -D $(@D)/buildroot-build/bin/yuzu-cmd $(TARGET_DIR)/usr/bin/
	$(INSTALL) -D $(@D)/buildroot-build/bin/yuzu-room $(TARGET_DIR)/usr/bin/
	#evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -prn $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/yuzu/switch.yuzu.keys \
		$(TARGET_DIR)/usr/share/evmapy
endef

define YUZU_DL_TZ
	mkdir -p $(@D)/buildroot-build/externals/nx_tzdb
	cp $(YUZU_DL_DIR)/$(YUZU_TZDB_VERSION).zip $(@D)/buildroot-build/externals/nx_tzdb
endef
YUZU_POST_EXTRACT_HOOKS += YUZU_DL_TZ

$(eval $(cmake-package))
