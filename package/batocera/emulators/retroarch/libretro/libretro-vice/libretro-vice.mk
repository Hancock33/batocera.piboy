################################################################################
#
# libretro-vice
#
################################################################################
# Version: Commits on Nov 22, 2023
LIBRETRO_VICE_VERSION = a2385eb1103a9f5c86333bae0f308ca678fc7d82
LIBRETRO_VICE_SITE = $(call github,sonninnos,libretro-vice,$(LIBRETRO_VICE_VERSION))
LIBRETRO_VICE_LICENSE = GPLv2

LIBRETRO_VICE_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
LIBRETRO_VICE_PLATFORM = rpi1

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
LIBRETRO_VICE_PLATFORM = rpi2

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
LIBRETRO_VICE_PLATFORM = rpi3_64

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
LIBRETRO_VICE_PLATFORM = rpi4_64

#else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
#LIBRETRO_VICE_PLATFORM = rpi5_64

else ifeq ($(BR2_arm),y)
LIBRETRO_VICE_PLATFORM = armv neon

else ifeq ($(BR2_aarch64),y)
LIBRETRO_VICE_PLATFORM = unix
endif

define LIBRETRO_VICE_BUILD_CMDS
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile platform="$(LIBRETRO_VICE_PLATFORM)" EMUTYPE=x64
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -f Makefile objectclean
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile platform="$(LIBRETRO_VICE_PLATFORM)" EMUTYPE=x64sc
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -f Makefile objectclean
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile platform="$(LIBRETRO_VICE_PLATFORM)" EMUTYPE=x128
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -f Makefile objectclean
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile platform="$(LIBRETRO_VICE_PLATFORM)" EMUTYPE=xpet
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -f Makefile objectclean
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile platform="$(LIBRETRO_VICE_PLATFORM)" EMUTYPE=xplus4
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -f Makefile objectclean
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile platform="$(LIBRETRO_VICE_PLATFORM)" EMUTYPE=xvic
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -f Makefile objectclean
endef

define LIBRETRO_VICE_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/vice_x64_libretro.so $(TARGET_DIR)/usr/lib/libretro/vice_x64_libretro.so
	$(INSTALL) -D $(@D)/vice_x64sc_libretro.so $(TARGET_DIR)/usr/lib/libretro/vice_x64sc_libretro.so
	$(INSTALL) -D $(@D)/vice_x128_libretro.so $(TARGET_DIR)/usr/lib/libretro/vice_x128_libretro.so
	$(INSTALL) -D $(@D)/vice_xpet_libretro.so $(TARGET_DIR)/usr/lib/libretro/vice_xpet_libretro.so
	$(INSTALL) -D $(@D)/vice_xplus4_libretro.so $(TARGET_DIR)/usr/lib/libretro/vice_xplus4_libretro.so
	$(INSTALL) -D $(@D)/vice_xvic_libretro.so $(TARGET_DIR)/usr/lib/libretro/vice_xvic_libretro.so
endef

$(eval $(generic-package))
