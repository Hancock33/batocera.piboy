################################################################################
#
# shadps4
#
################################################################################
# Version: Commits on Jun 02, 2026
SHADPS4_VERSION = 0b9eb3dd17bbd5566b46e3daff7de5e3024c5cd2
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

# Dear_ImGui_FontEmbed is a build-time code generator. When cross-compiling
# (e.g. aarch64 host -> x86_64 target) the binary built with the target
# toolchain cannot be executed on the build host, so pre-build it with the
# host compiler and tell CMake to import it (see 0001-imgui-renderer-*.patch).
define SHADPS4_BUILD_HOST_FONTEMBED
	$(HOSTCXX) -O2 -o $(@D)/host-dear-imgui-fontembed \
		$(@D)/externals/dear_imgui/misc/fonts/binary_to_compressed_c.cpp
endef
SHADPS4_PRE_CONFIGURE_HOOKS += SHADPS4_BUILD_HOST_FONTEMBED

SHADPS4_CONF_OPTS += -DDear_ImGui_FontEmbed_EXECUTABLE=$(BUILD_DIR)/shadps4-$(SHADPS4_VERSION)/host-dear-imgui-fontembed

$(eval $(cmake-package))
$(eval $(emulator-info-package))
