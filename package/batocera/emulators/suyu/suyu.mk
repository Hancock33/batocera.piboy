################################################################################
#
# suyu
#
################################################################################
# Version: Commits on Mar 18, 2024 (branch@dev)
SUYU_VERSION = 898bd281a269c4e897d64122dc64082a00de3670
SUYU_SITE = https://github.com/suyu-emu/suyu.git
SUYU_SITE_METHOD=git
SUYU_GIT_SUBMODULES=YES
SUYU_LICENSE = GPLv2
SUYU_DEPENDENCIES += fmt boost ffmpeg zstd zlib libzip lz4 catch2 sdl2 opus
SUYU_DEPENDENCIES += qt6base qt6svg qt6tools
SUYU_SUPPORTS_IN_SOURCE_BUILD = NO

SUYU_CONF_ENV += LDFLAGS=-lpthread ARCHITECTURE_x86_64=1

SUYU_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
SUYU_CONF_OPTS += -DARCHITECTURE_x86_64=ON
SUYU_CONF_OPTS += -DENABLE_QT6=ON
SUYU_CONF_OPTS += -DENABLE_SDL2=ON
SUYU_CONF_OPTS += -DENABLE_WEB_SERVICE=OFF
SUYU_CONF_OPTS += -DTZDB2NX_VERSION=1660610838
SUYU_CONF_OPTS += -DTZDB2NX_ZONEINFO_DIR=/usr/share/zoneinfo
SUYU_CONF_OPTS += -DUSE_DISCORD_PRESENCE=OFF
SUYU_CONF_OPTS += -DSUYU_TESTS=OFF
SUYU_CONF_OPTS += -DSUYU_USE_EXTERNAL_SDL2=OFF
SUYU_CONF_OPTS += -DSUYU_USE_EXTERNAL_VULKAN_HEADERS=OFF
SUYU_CONF_OPTS += -DSUYU_USE_PRECOMPILED_HEADERS=OFF

ifeq ($(BR2_PACKAGE_VULKAN_HEADERS)$(BR2_PACKAGE_VULKAN_LOADER),yy)
	SUYU_DEPENDENCIES += host-glslang vulkan-headers vulkan-loader
endif

define SUYU_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin
	cp $(@D)/buildroot-build/bin/{suyu,tzdb2nx} $(TARGET_DIR)/usr/bin/

	#evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -prn $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/suyu/switch.suyu.keys $(TARGET_DIR)/usr/share/evmapy
	cp -prn $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/suyu/switch.suyu.keys $(TARGET_DIR)/usr/share/evmapy/switch.yuzu.keys
endef

$(eval $(cmake-package))