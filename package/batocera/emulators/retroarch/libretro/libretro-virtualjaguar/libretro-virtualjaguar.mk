################################################################################
#
# libretro-virtualjaguar
#
################################################################################
# Version: Commits on Apr 23, 2026
LIBRETRO_VIRTUALJAGUAR_VERSION = e5a74b570f7e2f2e12b49fe545b6d529fed2373e
LIBRETRO_VIRTUALJAGUAR_SITE = $(call github,libretro,virtualjaguar-libretro,$(LIBRETRO_VIRTUALJAGUAR_VERSION))
LIBRETRO_VIRTUALJAGUAR_LICENSE = GPLv3
LIBRETRO_VIRTUALJAGUAR_DEPENDENCIES += retroarch
LIBRETRO_VIRTUALJAGUAR_EMULATOR_INFO = virtualjaguar.libretro.core.yml

ifeq ($(BR2_aarch64),y)
    LIBRETRO_VIRTUALJAGUAR_SIMD = neon
else ifeq ($(BR2_arm),y)
    LIBRETRO_VIRTUALJAGUAR_SIMD = neon
else ifeq ($(BR2_x86_64),y)
    LIBRETRO_VIRTUALJAGUAR_SIMD = sse2
else
    LIBRETRO_VIRTUALJAGUAR_SIMD = scalar
endif

define LIBRETRO_VIRTUALJAGUAR_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile \
		platform="unix" GIT_VERSION="-$(shell echo $(LIBRETRO_VIRTUALJAGUAR_VERSION) | cut -c 1-7)" \
		BLITTER_SIMD="$(LIBRETRO_VIRTUALJAGUAR_SIMD)"
endef

define LIBRETRO_VIRTUALJAGUAR_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/virtualjaguar_libretro.so $(TARGET_DIR)/usr/lib/libretro/virtualjaguar_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
