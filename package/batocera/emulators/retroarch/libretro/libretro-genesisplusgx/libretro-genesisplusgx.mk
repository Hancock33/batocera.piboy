################################################################################
#
# libretro-genesisplusgx
#
################################################################################
# Version: Commits on Jul 16, 2025
LIBRETRO_GENESISPLUSGX_VERSION = 69adb1bca412643c164c2a36376ae1ec15a85d38
LIBRETRO_GENESISPLUSGX_SITE = $(call github,ekeeke,Genesis-Plus-GX,$(LIBRETRO_GENESISPLUSGX_VERSION))
LIBRETRO_GENESISPLUSGX_LICENSE = Non-commercial
LIBRETRO_GENESISPLUSGX_DEPENDENCIES = retroarch

LIBRETRO_GENESISPLUSGX_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
LIBRETRO_GENESISPLUSGX_PLATFORM += rpi3_64

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S922X),y)
LIBRETRO_GENESISPLUSGX_PLATFORM += CortexA73_G12B

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_H3),y)
LIBRETRO_GENESISPLUSGX_PLATFORM += rpi2

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3128),y)
LIBRETRO_GENESISPLUSGX_PLATFORM += rpi2

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_ODIN),y)
LIBRETRO_GENESISPLUSGX_PLATFORM += odin
endif

define LIBRETRO_GENESISPLUSGX_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile.libretro platform="$(LIBRETRO_GENESISPLUSGX_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_GENESISPLUSGX_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_GENESISPLUSGX_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/genesis_plus_gx_libretro.so $(TARGET_DIR)/usr/lib/libretro/genesisplusgx_libretro.so
endef

$(eval $(generic-package))
