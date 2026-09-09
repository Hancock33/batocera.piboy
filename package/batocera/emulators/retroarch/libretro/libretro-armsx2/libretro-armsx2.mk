################################################################################
#
# libretro-armsx2
#
################################################################################
# Version: Commits on Sept 09, 2026
LIBRETRO_ARMSX2_VERSION = nightly-20260909
LIBRETRO_ARMSX2_SITE = https://github.com/ARMSX2/ARMSX2.git
LIBRETRO_ARMSX2_SITE_METHOD = git
LIBRETRO_ARMSX2_GIT_SUBMODULES = YES
LIBRETRO_ARMSX2_LICENSE = GPLv2
LIBRETRO_ARMSX2_DEPENDENCIES = libaio xz host-xxd retroarch
LIBRETRO_ARMSX2_EMULATOR_INFO = armsx2.libretro.core.yml
LIBRETRO_ARMSX2_SUPPORTS_IN_SOURCE_BUILD = NO

LIBRETRO_ARMSX2_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
LIBRETRO_ARMSX2_CONF_OPTS += -DCMAKE_DISABLE_PRECOMPILE_HEADERS=ON
LIBRETRO_ARMSX2_CONF_OPTS += -DDISABLE_ADVANCE_SIMD=OFF
LIBRETRO_ARMSX2_CONF_OPTS += -DENABLE_GSRUNNER=OFF
LIBRETRO_ARMSX2_CONF_OPTS += -DENABLE_LIBRETRO=ON
LIBRETRO_ARMSX2_CONF_OPTS += -DENABLE_QT_UI=OFF
LIBRETRO_ARMSX2_CONF_OPTS += -DENABLE_RECOMPILER_TEST_HOOKS=OFF
LIBRETRO_ARMSX2_CONF_OPTS += -DENABLE_SDL_FRONTEND=OFF
LIBRETRO_ARMSX2_CONF_OPTS += -DENABLE_SETCAP=OFF
LIBRETRO_ARMSX2_CONF_OPTS += -DENABLE_TESTS=OFF
LIBRETRO_ARMSX2_CONF_OPTS += -DUSE_BACKTRACE=OFF
LIBRETRO_ARMSX2_CONF_OPTS += -DUSE_SYSTEM_LIBS=AUTO
LIBRETRO_ARMSX2_CONF_OPTS += -DX11_API=OFF

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
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/pcsx2/resources
	$(INSTALL) -D $(@D)/buildroot-build/bin/armsx2_libretro.so $(TARGET_DIR)/usr/lib/libretro/armsx2_libretro.so
	$(INSTALL) -D $(@D)/armsx2_libretro.info $(TARGET_DIR)/usr/share/libretro/inf/armsx2_libretro.info
	cp -f $(@D)/bin/resources/GameIndex.yaml $(TARGET_DIR)/usr/share/batocera/datainit/bios/pcsx2/resources
endef

LIBRETRO_PCSX2_POST_INSTALL_TARGET_HOOKS += LIBRETRO_PCSX2_PATCHES
define LIBRETRO_PCSX2_PATCHES
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/ps2
	curl -L https://github.com/PCSX2/pcsx2_patches/releases/download/latest/patches.zip -o $(TARGET_DIR)/usr/share/batocera/datainit/bios/ps2/patches.zip
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
