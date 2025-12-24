################################################################################
#
# shadps4
#
################################################################################
# Version: Commits on Dec 24, 2025
SHADPS4_VERSION = v.0.13.0
SHADPS4_SITE = https://github.com/shadps4-emu/shadPS4.git
SHADPS4_SITE_METHOD=git
SHADPS4_GIT_SUBMODULES=YES
SHADPS4_LICENSE = GPLv2
SHADPS4_LICENSE_FILE = LICENSE
SHADPS4_DEPENDENCIES += alsa-lib jack2 libedit libevdev openal openssl pulseaudio sdl3 udev
SHADPS4_DEPENDENCIES += glslang vulkan-headers vulkan-loader vulkan-validationlayers

SHADPS4_SUPPORTS_IN_SOURCE_BUILD = NO

SHADPS4_CONF_OPTS += -DCMAKE_INSTALL_PREFIX=/usr
SHADPS4_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
SHADPS4_CONF_OPTS += -DENABLE_DISCORD_RPC=OFF
SHADPS4_CONF_OPTS += -DENABLE_UPDATER=OFF
SHADPS4_CONF_OPTS += -DVMA_ENABLE_INSTALL=ON

define SHADPS4_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/shadps4
	$(INSTALL) -m 0755 $(@D)/buildroot-build/shadps4 $(TARGET_DIR)/usr/bin/shadps4/
endef

$(eval $(cmake-package))
