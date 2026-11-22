################################################################################
#
# shadps4
#
################################################################################
# Version: Commits on Oct 30, 2026
SHADPS4_VERSION = v.0.21.0
SHADPS4_SITE = https://github.com/shadps4-emu/shadPS4.git
SHADPS4_SITE_METHOD = git
SHADPS4_GIT_SUBMODULES = YES
SHADPS4_EMULATOR_INFO = shadps4.emulator.yml

SHADPS4_LICENSE = GPL-2.0+
SHADPS4_LICENSE_FILES = LICENSE
SHADPS4_SUPPORTS_IN_SOURCE_BUILD = NO

SHADPS4_DEPENDENCIES += host-glslang host-protobuf
SHADPS4_DEPENDENCIES += boost cli11 ffmpeg fmt freetype glslang json-for-modern-cpp
SHADPS4_DEPENDENCIES += libabseil-cpp libminiupnpc libpng openal protobuf pugixml
SHADPS4_DEPENDENCIES += sdl3 vulkan-headers xxhash zlib zstd
SHADPS4_DEPENDENCIES += alsa-lib libevdev pulseaudio udev vulkan-loader vulkan-validationlayers

SHADPS4_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
SHADPS4_CONF_OPTS += -DENABLE_DISCORD_RPC=OFF
SHADPS4_CONF_OPTS += -DENABLE_SYSTEM_LIBRARIES=ON
SHADPS4_CONF_OPTS += -DENABLE_TESTS=OFF
SHADPS4_CONF_OPTS += -DENABLE_UPDATER=OFF

# Code generators must run on the build machine, not the target:
# - 0002-Allow-using-system-protobuf-and-a-host-protoc.patch
# - 0003-host_shaders-allow-overriding-GLSLANG_COMPILER.patch
SHADPS4_CONF_OPTS += -DSHADPS4_PROTOC_EXECUTABLE=$(HOST_DIR)/bin/protoc
SHADPS4_CONF_OPTS += -DGLSLANG_COMPILER=$(HOST_DIR)/bin/glslang

# Dear_ImGui_FontEmbed is a build-time code generator too. Rather than adding
# a host- package just for it, build it with the host compiler before
# configuring and hand it to CMake
# (0001-imgui-renderer-allow-a-prebuilt-Dear_ImGui_FontEmbed.patch).
SHADPS4_HOST_FONTEMBED = $(SHADPS4_DIR)/host-dear-imgui-fontembed

define SHADPS4_BUILD_HOST_FONTEMBED
	$(HOSTCXX) $(HOST_CXXFLAGS) $(HOST_LDFLAGS) -O2 \
		-o $(SHADPS4_HOST_FONTEMBED) \
		$(@D)/externals/imgui/misc/fonts/binary_to_compressed_c.cpp
endef
SHADPS4_PRE_CONFIGURE_HOOKS += SHADPS4_BUILD_HOST_FONTEMBED

SHADPS4_CONF_OPTS += -DDear_ImGui_FontEmbed_EXECUTABLE=$(SHADPS4_HOST_FONTEMBED)

$(eval $(cmake-package))
$(eval $(emulator-info-package))
