################################################################################
#
# libretro-vice
#
################################################################################
# Version: Commits on Jul 29, 2025
LIBRETRO_VICE_VERSION = e9f8ac034ddef3025f0567768f7af8219f7cfdb8
LIBRETRO_VICE_SITE = $(call github,sonninnos,libretro-vice,$(LIBRETRO_VICE_VERSION))
LIBRETRO_VICE_LICENSE = GPLv2
LIBRETRO_VICE_DEPENDENCIES += retroarch
LIBRETRO_VICE_EMULATOR_INFO = vice_x128.libretro.core.yml vice_x64.libretro.core.yml vice_x64sc.libretro.core.yml vice_xpet.libretro.core.yml vice_xplus4.libretro.core.yml vice_xscpu64.libretro.core.yml vice_xvic.libretro.core.yml

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_VICE_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_VICE_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_VICE_PLATFORM = rpi4
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_VICE_PLATFORM = rpi5
else ifeq ($(BR2_arm),y)
    LIBRETRO_VICE_PLATFORM = armv neon
else ifeq ($(BR2_aarch64),y)
    LIBRETRO_VICE_PLATFORM = unix
else
    LIBRETRO_VICE_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_VICE_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
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
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile platform="$(LIBRETRO_VICE_PLATFORM)" EMUTYPE=xscpu64
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -f Makefile objectclean
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile platform="$(LIBRETRO_VICE_PLATFORM)" EMUTYPE=xvic
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -f Makefile objectclean
endef

define LIBRETRO_VICE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/vice_x64_libretro.so    $(TARGET_DIR)/usr/lib/libretro/vice_x64_libretro.so
	$(INSTALL) -D $(@D)/vice_x64sc_libretro.so  $(TARGET_DIR)/usr/lib/libretro/vice_x64sc_libretro.so
	$(INSTALL) -D $(@D)/vice_x128_libretro.so   $(TARGET_DIR)/usr/lib/libretro/vice_x128_libretro.so
	$(INSTALL) -D $(@D)/vice_xpet_libretro.so   $(TARGET_DIR)/usr/lib/libretro/vice_xpet_libretro.so
	$(INSTALL) -D $(@D)/vice_xplus4_libretro.so $(TARGET_DIR)/usr/lib/libretro/vice_xplus4_libretro.so
	$(INSTALL) -D $(@D)/vice_xvic_libretro.so   $(TARGET_DIR)/usr/lib/libretro/vice_xvic_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))