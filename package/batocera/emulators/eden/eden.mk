################################################################################
#
# EDEN
#
################################################################################
# Version: Commits on Sept 09, 2025
EDEN_VERSION = 9d2681ecc9565681db623fb71799e76381998512
EDEN_SITE = https://git.eden-emu.dev/eden-emu/eden
EDEN_SITE_METHOD=git
EDEN_GIT_SUBMODULES=YES
EDEN_LICENSE = GPLv2
EDEN_DEPENDENCIES += boost catch2 enet ffmpeg fmt json-for-modern-cpp libva
EDEN_DEPENDENCIES += libzip lz4 opus sdl2 zlib zstd qt6base qt6svg qt6tools
EDEN_SUPPORTS_IN_SOURCE_BUILD = NO

EDEN_CONF_ENV += LDFLAGS=-lpthread ARCHITECTURE_x86_64=1

EDEN_CONF_OPTS += -DARCHITECTURE_x86_64=ON
EDEN_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
EDEN_CONF_OPTS += -DENABLE_QT6=ON
EDEN_CONF_OPTS += -DENABLE_SDL2=ON
EDEN_CONF_OPTS += -DENABLE_WEB_SERVICE=ON
EDEN_CONF_OPTS += -DLINUX=ON
EDEN_CONF_OPTS += -DUSE_DISCORD_PRESENCE=OFF
EDEN_CONF_OPTS += -DUSE_SANITIZERS=OFF
EDEN_CONF_OPTS += -DYUZU_CHECK_SUBMODULES=OFF
EDEN_CONF_OPTS += -DYUZU_CMD=OFF
EDEN_CONF_OPTS += -DYUZU_ROOM=OFF
EDEN_CONF_OPTS += -DYUZU_TESTS=OFF
EDEN_CONF_OPTS += -DYUZU_USE_BUNDLED_FFMPEG=OFF
EDEN_CONF_OPTS += -DYUZU_USE_CPM=OFF
EDEN_CONF_OPTS += -DYUZU_USE_EXTERNAL_SDL2=OFF

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
    EDEN_DEPENDENCIES += host-glslang vulkan-headers vulkan-loader vulkan-validationlayers
endif

define EDEN_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin
	mkdir -p $(TARGET_DIR)/usr/lib/eden
	$(INSTALL) -D $(@D)/buildroot-build/bin/eden $(TARGET_DIR)/usr/bin/
endef

$(eval $(cmake-package))
