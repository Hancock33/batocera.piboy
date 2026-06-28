################################################################################
#
# libretro-genesisplusgx-wide
#
################################################################################
# Version: Commits on Jun 26, 2026
LIBRETRO_GENESISPLUSGX_WIDE_VERSION = af902574b56a9606f716387b55460a4838df749d
LIBRETRO_GENESISPLUSGX_WIDE_SITE = $(call github,libretro,Genesis-Plus-GX-Wide,$(LIBRETRO_GENESISPLUSGX_WIDE_VERSION))
LIBRETRO_GENESISPLUSGX_WIDE_LICENSE = Non-commercial
LIBRETRO_GENESISPLUSGX_WIDE_DEPENDENCIES += retroarch
LIBRETRO_GENESISPLUSGX_WIDE_EMULATOR_INFO = genesisplusgx-wide.libretro.core.yml

LIBRETRO_GENESISPLUSGX_WIDE_PLATFORM += $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S922X),y)
    LIBRETRO_GENESISPLUSGX_WIDE_PLATFORM += CortexA73_G12B
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_ORANGEPI_PC),y)
    LIBRETRO_GENESISPLUSGX_WIDE_PLATFORM += rpi2
endif

define LIBRETRO_GENESISPLUSGX_WIDE_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile.libretro platform="$(LIBRETRO_GENESISPLUSGX_WIDE_PLATFORM)"
endef

define LIBRETRO_GENESISPLUSGX_WIDE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/genesis_plus_gx_wide_libretro.so $(TARGET_DIR)/usr/lib/libretro/genesisplusgx-wide_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
