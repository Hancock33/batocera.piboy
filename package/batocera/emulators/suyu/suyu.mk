################################################################################
#
# suyu
#
################################################################################
# Version: Commits on Oct 06, 2024
SUYU_VERSION = ee365bad9501c73ff49936e72ec91cd9c3ce5c24
SUYU_BRANCH = dev
SUYU_SITE = https://git.suyu.dev/suyu/suyu.git
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
SUYU_CONF_OPTS += -DSUYU_TESTS=OFF
SUYU_CONF_OPTS += -DSUYU_USE_EXTERNAL_VULKAN_HEADERS=OFF
SUYU_CONF_OPTS += -DSUYU_USE_EXTERNAL_VULKAN_UTILITY_LIBRARIES=OFF
SUYU_CONF_OPTS += -DSUYU_USE_PRECOMPILED_HEADERS=OFF
SUYU_CONF_OPTS += -DUSE_DISCORD_PRESENCE=OFF

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
    SUYU_DEPENDENCIES += host-glslang vulkan-headers vulkan-loader
endif

define SUYU_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin
	cp $(@D)/buildroot-build/bin/{suyu,tzdb2nx} $(TARGET_DIR)/usr/bin/

	#evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/suyu/switch.suyu.keys $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/suyu/switch.suyu.keys $(TARGET_DIR)/usr/share/evmapy/switch.yuzu.keys
endef

$(eval $(cmake-package))
