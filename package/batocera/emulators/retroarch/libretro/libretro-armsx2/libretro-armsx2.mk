################################################################################
#
# libretro-armsx2
#
################################################################################
# Version: Commits on Oct 21, 2026
LIBRETRO_ARMSX2_VERSION = nightly-20261021
LIBRETRO_ARMSX2_SITE = https://github.com/ARMSX2/ARMSX2.git
LIBRETRO_ARMSX2_SITE_METHOD = git
LIBRETRO_ARMSX2_GIT_SUBMODULES = YES
LIBRETRO_ARMSX2_LICENSE = GPLv2
LIBRETRO_ARMSX2_DEPENDENCIES = libaio xz host-xxd retroarch
LIBRETRO_ARMSX2_EMULATOR_INFO = armsx2.libretro.core.yml
LIBRETRO_ARMSX2_SUPPORTS_IN_SOURCE_BUILD = NO

LIBRETRO_ARMSX2_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
LIBRETRO_ARMSX2_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -moutline-atomics"
LIBRETRO_ARMSX2_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -moutline-atomics -Wno-c++11-narrowing -Wno-narrowing"
LIBRETRO_ARMSX2_CONF_OPTS += -DCMAKE_DISABLE_PRECOMPILE_HEADERS=ON
LIBRETRO_ARMSX2_CONF_OPTS += -DDISABLE_ADVANCE_SIMD=ON
LIBRETRO_ARMSX2_CONF_OPTS += -DENABLE_GSRUNNER=OFF
LIBRETRO_ARMSX2_CONF_OPTS += -DENABLE_LIBRETRO=ON
LIBRETRO_ARMSX2_CONF_OPTS += -DENABLE_QT_UI=OFF
LIBRETRO_ARMSX2_CONF_OPTS += -DENABLE_RECOMPILER_TEST_HOOKS=OFF
LIBRETRO_ARMSX2_CONF_OPTS += -DENABLE_SDL_FRONTEND=OFF
LIBRETRO_ARMSX2_CONF_OPTS += -DENABLE_SETCAP=OFF
LIBRETRO_ARMSX2_CONF_OPTS += -DENABLE_TESTS=OFF
LIBRETRO_ARMSX2_CONF_OPTS += -DHOST_PAGE_SIZE=4096
LIBRETRO_ARMSX2_CONF_OPTS += -DHOST_CACHE_LINE_SIZE=64
LIBRETRO_ARMSX2_CONF_OPTS += -DUSE_BACKTRACE=OFF
LIBRETRO_ARMSX2_CONF_OPTS += -DUSE_SYSTEM_LIBS=AUTO

ifeq ($(BR2_PACKAGE_XORG7),y)
    LIBRETRO_ARMSX2_CONF_OPTS += -DX11_API=ON
else
    LIBRETRO_ARMSX2_CONF_OPTS += -DX11_API=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_WAYLAND),y)
    LIBRETRO_ARMSX2_CONF_OPTS += -DWAYLAND_API=ON
else
    LIBRETRO_ARMSX2_CONF_OPTS += -DWAYLAND_API=OFF
endif

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
    LIBRETRO_ARMSX2_CONF_OPTS += -DUSE_OPENGL=ON
else
    LIBRETRO_ARMSX2_CONF_OPTS += -DUSE_OPENGL=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
    LIBRETRO_ARMSX2_CONF_OPTS += -DUSE_VULKAN=ON
else
    LIBRETRO_ARMSX2_CONF_OPTS += -DUSE_VULKAN=OFF
endif

define LIBRETRO_ARMSX2_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/ps2
	$(INSTALL) -D $(@D)/buildroot-build/bin/armsx2_libretro.so $(TARGET_DIR)/usr/lib/libretro/armsx2_libretro.so
	$(INSTALL) -D $(@D)/armsx2_libretro.info $(TARGET_DIR)/usr/share/libretro/inf/armsx2_libretro.info
	cp -pr $(@D)/bin/resources $(TARGET_DIR)/usr/share/batocera/datainit/bios/ps2
endef

LIBRETRO_ARMSX2_POST_INSTALL_TARGET_HOOKS += LIBRETRO_ARMSX2_PATCHES
define LIBRETRO_ARMSX2_PATCHES
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/ps2
	curl -L https://github.com/PCSX2/pcsx2_patches/releases/download/latest/patches.zip -o $(TARGET_DIR)/usr/share/batocera/datainit/bios/ps2/patches.zip
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
