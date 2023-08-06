################################################################################
#
# yuzu
#
################################################################################
# Version: Commits on Aug 05, 2023
YUZU_VERSION = 755f45a5228e29b41cc9cd41b65e33f2328f2540
YUZU_SITE = https://github.com/yuzu-emu/yuzu.git
YUZU_SITE_METHOD=git
YUZU_GIT_SUBMODULES=YES
YUZU_LICENSE = GPLv2
YUZU_DEPENDENCIES += fmt boost ffmpeg zstd zlib libzip lz4 catch2 sdl2 opus
YUZU_DEPENDENCIES += qt6base qt6svg qt6tools host-ninja

YUZU_SUPPORTS_IN_SOURCE_BUILD = NO

YUZU_CONF_ENV += LDFLAGS=-lpthread ARCHITECTURE_x86_64=1

YUZU_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -GNinja
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

ifeq ($(BR2_PACKAGE_VULKAN_HEADERS)$(BR2_PACKAGE_VULKAN_LOADER),yy)
    YUZU_DEPENDENCIES += host-glslang
endif

define YUZU_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(YUZU_BUILDDIR)
endef

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
    wget -O $(@D)/buildroot-build/externals/nx_tzdb/220816.zip https://github.com/lat9nq/tzdb_to_nx/releases/download/220816/220816.zip
endef
YUZU_POST_EXTRACT_HOOKS += YUZU_DL_TZ

$(eval $(cmake-package))
