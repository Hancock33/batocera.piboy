################################################################################
#
# rpcs3
#
################################################################################
# Version: Commits on Jul 19, 2025
RPCS3_VERSION = 7fe3afbbc222aa2ab299833d25b65987c005e178
RPCS3_SITE = https://github.com/RPCS3/rpcs3.git
RPCS3_SITE_METHOD=git
RPCS3_GIT_SUBMODULES=YES
RPCS3_LICENSE = GPLv2
RPCS3_DEPENDENCIES += alsa-lib faudio ffmpeg flatbuffers libcurl libevdev libglew libglu libpng
RPCS3_DEPENDENCIES += libusb libxml2 llvm mesa3d ncurses openal opencv4 rtmpdump wolfssl
RPCS3_DEPENDENCIES += qt6base qt6multimedia qt6svg

RPCS3_SUPPORTS_IN_SOURCE_BUILD = NO

RPCS3_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
RPCS3_CONF_OPTS += -DCMAKE_CROSSCOMPILING=ON
RPCS3_CONF_OPTS += -DCMAKE_INSTALL_PREFIX=/usr
RPCS3_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS="-lstdc++ -flto"
RPCS3_CONF_OPTS += -DLLVM_DIR=$(STAGING_DIR)/usr/lib/cmake/llvm/
RPCS3_CONF_OPTS += -DSTATIC_LINK_LLVM=OFF
RPCS3_CONF_OPTS += -DOpenGL_GL_PREFERENCE=LEGACY
RPCS3_CONF_OPTS += -DUSE_DISCORD_RPC=OFF
RPCS3_CONF_OPTS += -DUSE_LIBEVDEV=ON
RPCS3_CONF_OPTS += -DUSE_LTO=ON
RPCS3_CONF_OPTS += -DUSE_NATIVE_INSTRUCTIONS=OFF
RPCS3_CONF_OPTS += -DUSE_PRECOMPILED_HEADERS=OFF
RPCS3_CONF_OPTS += -DUSE_SYSTEM_CUBEB=OFF
RPCS3_CONF_OPTS += -DUSE_SYSTEM_CURL=ON
RPCS3_CONF_OPTS += -DUSE_SYSTEM_FAUDIO=OFF
RPCS3_CONF_OPTS += -DUSE_SYSTEM_FFMPEG=ON
RPCS3_CONF_OPTS += -DUSE_SYSTEM_LIBUSB=ON
RPCS3_CONF_OPTS += -DUSE_SYSTEM_OPENCV=ON

ifeq ($(BR2_PACKAGE_SDL3),y)
    RPCS3_CONF_OPTS += -DUSE_SDL=ON
    RPCS3_CONF_OPTS += -DUSE_SYSTEM_SDL=ON
    RPCS3_CONF_OPTS += -DUSE_FAUDIO=ON
else
    RPCS3_CONF_OPTS += -DUSE_SDL=OFF
    RPCS3_CONF_OPTS += -DBUILD_SDL3=OFF
    RPCS3_CONF_OPTS += -DUSE_FAUDIO=ON
endif

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
    RPCS3_CONF_OPTS += -DUSE_VULKAN=ON
else
    RPCS3_CONF_OPTS += -DUSE_VULKAN=OFF
endif

define RPCS3_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(NINJA) -C $(@D)/buildroot-build
endef

$(eval $(cmake-package))
