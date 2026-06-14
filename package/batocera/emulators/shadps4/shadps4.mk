################################################################################
#
# shadps4
#
################################################################################
# Version: Commits on Jun 01, 2026
SHADPS4_VERSION = v.0.16.0
SHADPS4_SITE = https://github.com/shadps4-emu/shadPS4.git
SHADPS4_SITE_METHOD=git
SHADPS4_GIT_SUBMODULES=YES
SHADPS4_EMULATOR_INFO = shadps4.emulator.yml

SHADPS4_LICENSE = GPLv2
SHADPS4_LICENSE_FILE = LICENSE
SHADPS4_DEPENDENCIES += alsa-lib boost ffmpeg fmt glslang jack2 libedit libevdev openal openssl
SHADPS4_DEPENDENCIES += pugixml pulseaudio sdl3 udev vulkan-headers vulkan-validationlayers

SHADPS4_SUPPORTS_IN_SOURCE_BUILD = NO

SHADPS4_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
SHADPS4_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS="-lm -lstdc++"
SHADPS4_CONF_OPTS += -DCMAKE_INSTALL_PREFIX=/usr
SHADPS4_CONF_OPTS += -DENABLE_DISCORD_RPC=OFF
SHADPS4_CONF_OPTS += -DENABLE_UPDATER=OFF
SHADPS4_CONF_OPTS += -DVMA_ENABLE_INSTALL=ON

$(eval $(cmake-package))
$(eval $(emulator-info-package))
