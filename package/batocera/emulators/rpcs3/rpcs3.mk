################################################################################
#
# rpcs3
#
################################################################################
# Version: Commits on Dec 15, 2024
RPCS3_VERSION = bd49c6bedb8400aff9ead241a9da4ce28b84e0b7
RPCS3_SITE = https://github.com/RPCS3/rpcs3.git
RPCS3_SITE_METHOD=git
RPCS3_GIT_SUBMODULES=YES
RPCS3_LICENSE = GPLv2
RPCS3_DEPENDENCIES += alsa-lib faudio ffmpeg libcurl libevdev libglew libglu libpng libusb libxml2
RPCS3_DEPENDENCIES += llvm mesa3d ncurses openal opencv4 rtmpdump wolfssl
RPCS3_DEPENDENCIES += qt6base qt6multimedia qt6svg

RPCS3_SUPPORTS_IN_SOURCE_BUILD = NO

RPCS3_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS="-fuse-ld=lld -lstdc++"
RPCS3_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-fuse-ld=lld -lstdc++"
RPCS3_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
RPCS3_CONF_OPTS += -DCMAKE_CROSSCOMPILING=ON
RPCS3_CONF_OPTS += -DCMAKE_CXX_FLAGS="-fno-function-sections"
RPCS3_CONF_OPTS += -DCMAKE_INSTALL_PREFIX=/usr
RPCS3_CONF_OPTS += -DLLVM_DIR=$(STAGING_DIR)/usr/lib/cmake/llvm/
RPCS3_CONF_OPTS += -DSTATIC_LINK_LLVM=OFF
RPCS3_CONF_OPTS += -DUSE_LIBEVDEV=ON
RPCS3_CONF_OPTS += -DUSE_NATIVE_INSTRUCTIONS=OFF
RPCS3_CONF_OPTS += -DUSE_PRECOMPILED_HEADERS=OFF
RPCS3_CONF_OPTS += -DUSE_SYSTEM_CURL=ON
RPCS3_CONF_OPTS += -DUSE_SYSTEM_FAUDIO=ON
RPCS3_CONF_OPTS += -DUSE_SYSTEM_FFMPEG=ON
RPCS3_CONF_OPTS += -DUSE_SYSTEM_LIBUSB=ON

ifeq ($(BR2_PACKAGE_SDL2),y)
    RPCS3_CONF_OPTS += -DUSE_SDL=ON
else
    RPCS3_CONF_OPTS += -DUSE_SDL=OFF
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
