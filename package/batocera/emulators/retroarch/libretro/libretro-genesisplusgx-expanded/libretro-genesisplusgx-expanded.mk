################################################################################
#
# libretro-genesisplusgx-expanded
#
################################################################################
# Version: Commits on Jul 16, 2025
LIBRETRO_GENESISPLUSGX_EXPANDED_VERSION = 258749423d02e9cba34ef4221c91ea3e01cef126
LIBRETRO_GENESISPLUSGX_EXPANDED_SITE = $(call github,RapidEdwin08,Genesis-Plus-GX-Expanded-Rom-Size,$(LIBRETRO_GENESISPLUSGX_EXPANDED_VERSION))
LIBRETRO_GENESISPLUSGX_EXPANDED_LICENSE = Non-commercial
LIBRETRO_GENESISPLUSGX_EXPANDED_DEPENDENCIES = retroarch

LIBRETRO_GENESISPLUSGX_EXPANDED_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S922X),y)
LIBRETRO_GENESISPLUSGX_EXPANDED_PLATFORM += CortexA73_G12B

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_H3),y)
LIBRETRO_GENESISPLUSGX_EXPANDED_PLATFORM += rpi2

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3128),y)
LIBRETRO_GENESISPLUSGX_EXPANDED_PLATFORM += rpi2

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_ODIN),y)
LIBRETRO_GENESISPLUSGX_EXPANDED_PLATFORM += odin
endif

define LIBRETRO_GENESISPLUSGX_EXPANDED_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile.libretro platform="$(LIBRETRO_GENESISPLUSGX_EXPANDED_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_GENESISPLUSGX_EXPANDED_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_GENESISPLUSGX_EXPANDED_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/genesis_plus_gx_libretro.so $(TARGET_DIR)/usr/lib/libretro/genesisplusgx-expanded_libretro.so
endef

$(eval $(generic-package))
