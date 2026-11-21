################################################################################
#
# lichii
#
################################################################################
# Version: Commits on Nov 21, 2026
LICHII_VERSION = 3165970aa14fcf44e5059a46101761f113172a8e
LICHII_SITE = https://github.com/zortos293/Lichii.git
LICHII_SITE_METHOD=git
LICHII_GIT_SUBMODULES=YES
LICHII_LICENSE = GPL-3.0+
LICHII_LICENSE_FILES = LICENSE.txt
LICHII_EMULATOR_INFO = lichii.emulator.yml
LICHII_DEPENDENCIES += boost enet ffmpeg fmt json-for-modern-cpp libusb libva
LICHII_DEPENDENCIES += lz4 openssl opus sdl3 zlib zstd qt6base qt6svg
LICHII_SUPPORTS_IN_SOURCE_BUILD = NO

LICHII_CONF_OPTS += -DARCHITECTURE_x86_64=ON
LICHII_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
LICHII_CONF_OPTS += -DENABLE_UPDATE_CHECKER=OFF
LICHII_CONF_OPTS += -DENABLE_WEB_SERVICE=ON
LICHII_CONF_OPTS += -DLINUX=ON
LICHII_CONF_OPTS += -DUSE_DISCORD_PRESENCE=OFF
LICHII_CONF_OPTS += -DLICHII_CMD=OFF
LICHII_CONF_OPTS += -DLICHII_ROOM=OFF
LICHII_CONF_OPTS += -DLICHII_TESTS=OFF
LICHII_CONF_OPTS += -DLICHII_USE_BUNDLED_FFMPEG=OFF
LICHII_CONF_OPTS += -DLICHII_USE_BUNDLED_OPENSSL=OFF
LICHII_CONF_OPTS += -DLICHII_USE_BUNDLED_QT=OFF
LICHII_CONF_OPTS += -DLICHII_USE_BUNDLED_SDL3=OFF

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
    LICHII_DEPENDENCIES += host-glslang vulkan-headers vulkan-loader vulkan-validationlayers
endif

define LICHII_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/bin/lichii $(TARGET_DIR)/usr/bin/lichii

endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
