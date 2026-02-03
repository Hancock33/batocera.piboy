################################################################################
#
# libretro-o2em
#
################################################################################
# Version: Commits on Nov 3, 2021
# Version: Commits on Oct 21, 2024
LIBRETRO_O2EM_VERSION = 3ba4231c1dc8dcdf487428712856b790d2e4b8f3
LIBRETRO_O2EM_SITE = $(call github,libretro,libretro-o2em,$(LIBRETRO_O2EM_VERSION))
LIBRETRO_O2EM_LICENSE = Artistic License
LIBRETRO_O2EM_DEPENDENCIES += retroarch
LIBRETRO_O2EM_EMULATOR_INFO = o2em.libretro.core.yml

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_O2EM_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_O2EM_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_O2EM_PLATFORM = rpi4_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_O2EM_PLATFORM = rpi5_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S812),y)
    LIBRETRO_O2EM_PLATFORM = armv neon
else ifeq ($(BR2_aarch64),y)
    LIBRETRO_O2EM_PLATFORM = unix
else
    LIBRETRO_O2EM_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_O2EM_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_O2EM_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_O2EM_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_O2EM_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/o2em_libretro.so $(TARGET_DIR)/usr/lib/libretro/o2em_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))