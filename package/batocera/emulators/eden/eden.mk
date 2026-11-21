################################################################################
#
# eden
#
################################################################################
# Version: Commits on Nov 20, 2026
EDEN_VERSION = 4089cfcffd66a0907dd8b70293b8b954527a0973
EDEN_SITE = https://git.eden-emu.dev/eden-emu/eden
EDEN_SITE_METHOD = git
EDEN_LICENSE = GPL-3.0+
EDEN_LICENSE_FILES = LICENSE.txt
EDEN_EMULATOR_INFO = eden.emulator.yml
EDEN_SUPPORTS_IN_SOURCE_BUILD = NO

EDEN_DEPENDENCIES += host-glslang boost cubeb enet ffmpeg libusb lz4 openssl
EDEN_DEPENDENCIES += opus qt6base qt6charts sdl3 spirv-headers zlib zstd
EDEN_DEPENDENCIES += vulkan-headers vulkan-loader vulkan-utility-libraries

EDEN_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
EDEN_CONF_OPTS += -DENABLE_QT_TRANSLATION=OFF
EDEN_CONF_OPTS += -DENABLE_UPDATE_CHECKER=OFF
EDEN_CONF_OPTS += -DENABLE_WEB_SERVICE=ON
EDEN_CONF_OPTS += -DENABLE_WERROR=OFF
EDEN_CONF_OPTS += -DUSE_DISCORD_PRESENCE=OFF
EDEN_CONF_OPTS += -DYUZU_CMD=OFF
EDEN_CONF_OPTS += -DYUZU_ROOM=OFF
EDEN_CONF_OPTS += -DYUZU_TESTS=OFF
EDEN_CONF_OPTS += -DDYNARMIC_TESTS=OFF
EDEN_CONF_OPTS += -DYUZU_USE_BUNDLED_FFMPEG=OFF
EDEN_CONF_OPTS += -DYUZU_USE_BUNDLED_OPENSSL=OFF
EDEN_CONF_OPTS += -DYUZU_USE_BUNDLED_QT=OFF
EDEN_CONF_OPTS += -DYUZU_USE_BUNDLED_SDL3=OFF
EDEN_CONF_OPTS += -DYUZU_USE_BUNDLED_SIRIT=OFF
EDEN_CONF_OPTS += -DQuaZip-Qt6_FORCE_BUNDLED=ON

define EDEN_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/bin/eden $(TARGET_DIR)/usr/bin/eden
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
