################################################################################
#
# libretro-parallel-gx1
#
################################################################################
# Version: Commits on Nov 06, 2026
LIBRETRO_PARALLEL_GX1_VERSION = 6a6d63a114f2b68cf8ff0577341ba20115f3f9eb
LIBRETRO_PARALLEL_GX1_SITE = https://github.com/libretro/parallel-gx1.git
LIBRETRO_PARALLEL_GX1_SITE_METHOD = git
LIBRETRO_PARALLEL_GX1_GIT_SUBMODULES = YES
LIBRETRO_PARALLEL_GX1_LICENSE = GPL-2.0+
LIBRETRO_PARALLEL_GX1_LICENSE_FILES = COPYING
LIBRETRO_PARALLEL_GX1_DEPENDENCIES = retroarch
LIBRETRO_PARALLEL_GX1_EMULATOR_INFO = parallel_gx1.libretro.core.yml

LIBRETRO_PARALLEL_GX1_EXTRA_ARGS = LINK_STATIC_LIBCPLUSPLUS=0

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
    LIBRETRO_PARALLEL_GX1_EXTRA_ARGS += HAVE_VULKAN=1
else
    LIBRETRO_PARALLEL_GX1_EXTRA_ARGS += HAVE_VULKAN=0
endif

define LIBRETRO_PARALLEL_GX1_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) \
		platform=unix $(LIBRETRO_PARALLEL_GX1_EXTRA_ARGS)
endef

define LIBRETRO_PARALLEL_GX1_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/parallel_gx1_libretro.so $(TARGET_DIR)/usr/lib/libretro/parallel_gx1_libretro.so
endef

# The core reads <system>/dolphin-emu/Sys, the same folder libretro-dolphin,
# so only install it when libretro-dolphin is not built.
ifeq ($(BR2_PACKAGE_LIBRETRO_DOLPHIN),)
define LIBRETRO_PARALLEL_GX1_SYS_FOLDER
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/dolphin-emu/Sys/GameSettings
	cp -r $(@D)/Data/Sys/* $(TARGET_DIR)/usr/share/batocera/datainit/bios/dolphin-emu/Sys
	cp -pr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/dolphin-emu/ini/*.ini $(TARGET_DIR)/usr/share/batocera/datainit/bios/dolphin-emu/Sys/GameSettings
endef

LIBRETRO_PARALLEL_GX1_POST_INSTALL_TARGET_HOOKS += LIBRETRO_PARALLEL_GX1_SYS_FOLDER
endif

$(eval $(generic-package))
$(eval $(emulator-info-package))
