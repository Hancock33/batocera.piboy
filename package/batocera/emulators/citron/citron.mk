################################################################################
#
# citron
#
################################################################################
# Version: Commits on May 14, 2025
CITRON_VERSION = 046538bb473c99fe3d02f9b0e76f7a056e6cecc8
CITRON_SITE = https://git.citron-emu.org/citron/emu
CITRON_SITE_METHOD=git
CITRON_GIT_SUBMODULES=YES
CITRON_LICENSE = GPLv2
CITRON_DEPENDENCIES += fmt boost ffmpeg zstd zlib libzip lz4 catch2 sdl2 opus
CITRON_DEPENDENCIES += qt6base qt6svg qt6tools
CITRON_SUPPORTS_IN_SOURCE_BUILD = NO

CITRON_CONF_ENV += LDFLAGS=-lpthread ARCHITECTURE_x86_64=1

CITRON_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++
CITRON_CONF_OPTS += -DARCHITECTURE_x86_64=ON
CITRON_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
CITRON_CONF_OPTS += -DCITRON_TESTS=OFF
CITRON_CONF_OPTS += -DCITRON_USE_EXTERNAL_SDL2=OFF
CITRON_CONF_OPTS += -DENABLE_QT6=ON
CITRON_CONF_OPTS += -DENABLE_SDL2=ON
CITRON_CONF_OPTS += -DENABLE_WEB_SERVICE=OFF
CITRON_CONF_OPTS += -DUSE_DISCORD_PRESENCE=OFF
CITRON_CONF_OPTS += -DUSE_SANITIZERS=OFF

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
    CITRON_DEPENDENCIES += host-glslang vulkan-headers vulkan-loader vulkan-validationlayers
endif

define CITRON_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin
	cp $(@D)/buildroot-build/bin/{citron,tzdb2nx} $(TARGET_DIR)/usr/bin/
endef

$(eval $(cmake-package))
