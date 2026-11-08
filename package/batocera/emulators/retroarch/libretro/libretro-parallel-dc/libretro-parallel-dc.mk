################################################################################
#
# libretro-parallel-dc
#
################################################################################
# Version: Commits on Nov 06, 2026
LIBRETRO_PARALLEL_DC_VERSION = 6f315dd55a66cb2299dd2282b24d2fd84fe7f390
LIBRETRO_PARALLEL_DC_SITE = $(call github,libretro,parallel-dc,$(LIBRETRO_PARALLEL_DC_VERSION))
LIBRETRO_PARALLEL_DC_LICENSE = GPL-2.0
LIBRETRO_PARALLEL_DC_LICENSE_FILES = LICENSE
LIBRETRO_PARALLEL_DC_DEPENDENCIES += retroarch
LIBRETRO_PARALLEL_DC_EMULATOR_INFO = parallel_dc.libretro.core.yml

LIBRETRO_PARALLEL_DC_EXTRA_ARGS = ARCH="$(call qstrip,$(BR2_ARCH))"

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
    LIBRETRO_PARALLEL_DC_DEPENDENCIES += libgl
    LIBRETRO_PARALLEL_DC_EXTRA_ARGS += FORCE_GLES=0
else
    LIBRETRO_PARALLEL_DC_DEPENDENCIES += libgles
    LIBRETRO_PARALLEL_DC_EXTRA_ARGS += FORCE_GLES=1
endif

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
    LIBRETRO_PARALLEL_DC_EXTRA_ARGS += HAVE_VULKAN=1
else
    LIBRETRO_PARALLEL_DC_EXTRA_ARGS += HAVE_VULKAN=0
endif

define LIBRETRO_PARALLEL_DC_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) \
		platform="$(LIBRETRO_PLATFORM)" $(LIBRETRO_PARALLEL_DC_EXTRA_ARGS)
endef

define LIBRETRO_PARALLEL_DC_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/parallel_dc_libretro.so $(TARGET_DIR)/usr/lib/libretro/parallel_dc_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
