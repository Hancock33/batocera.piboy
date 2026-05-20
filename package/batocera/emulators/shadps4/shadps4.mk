################################################################################
#
# shadps4
#
################################################################################
# Version: Commits on May 20, 2026
SHADPS4_VERSION = f95edd27e0dde1ea26e94152ac3c6c12ed42ffaf
SHADPS4_SITE = https://github.com/shadps4-emu/shadPS4.git
SHADPS4_SITE_METHOD=git
SHADPS4_GIT_SUBMODULES=YES
SHADPS4_EMULATOR_INFO = shadps4.emulator.yml

SHADPS4_LICENSE = GPLv2
SHADPS4_LICENSE_FILE = LICENSE
SHADPS4_DEPENDENCIES += alsa-lib jack2 libedit libevdev openal openssl pulseaudio sdl3 sdl3_mixer udev
SHADPS4_DEPENDENCIES += glslang vulkan-headers vulkan-loader vulkan-validationlayers

SHADPS4_SUPPORTS_IN_SOURCE_BUILD = NO

SHADPS4_CONF_OPTS += -DCMAKE_INSTALL_PREFIX=/usr
SHADPS4_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
SHADPS4_CONF_OPTS += -DENABLE_DISCORD_RPC=OFF
SHADPS4_CONF_OPTS += -DENABLE_UPDATER=OFF
SHADPS4_CONF_OPTS += -DVMA_ENABLE_INSTALL=ON

$(eval $(cmake-package))
$(eval $(emulator-info-package))
