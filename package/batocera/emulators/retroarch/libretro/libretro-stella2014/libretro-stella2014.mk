################################################################################
#
# libretro-stella2014
#
################################################################################
# Version: Commits on May 20, 2024
LIBRETRO_STELLA2014_VERSION = db6bee857f73138ae02755bf09e392b31fef4540
LIBRETRO_STELLA2014_SITE = $(call github,libretro,stella2014-libretro,$(LIBRETRO_STELLA2014_VERSION))
LIBRETRO_STELLA2014_LICENSE = GPLv2

LIBRETRO_STELLA2014_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
LIBRETRO_STELLA2014_PLATFORM = rpi1
endif

define LIBRETRO_STELLA2014_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C \
		$(@D)/ -f Makefile platform="$(LIBRETRO_STELLA2014_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_STELLA2014_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_STELLA2014_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/stella2014_libretro.so $(TARGET_DIR)/usr/lib/libretro/stella2014_libretro.so
endef

$(eval $(generic-package))
