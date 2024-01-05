################################################################################
#
# libretro-squirreljme
#
################################################################################
# Version: Commits on Jan 05, 2024
LIBRETRO_SQUIRRELJME_VERSION = 55c43cb45bbc45d9dd3eced999a7770ea5113a21
LIBRETRO_SQUIRRELJME_SITE = $(call github,SquirrelJME,SquirrelJME,$(LIBRETRO_SQUIRRELJME_VERSION))
LIBRETRO_SQUIRRELJME_LICENSE = GPL-3.0

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
LIBRETRO_SQUIRRELJME_MAKE_FILE=Makefile.linux_rpi4
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
LIBRETRO_SQUIRRELJME_MAKE_FILE=Makefile.linux_rpi3
else
LIBRETRO_SQUIRRELJME_MAKE_FILE=Makefile.linux_x86_64
endif

define LIBRETRO_SQUIRRELJME_BUILD_CMDS
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/ratufacoat/libretro/$(LIBRETRO_SQUIRRELJME_MAKE_FILE)
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/ratufacoat/libretro/$(LIBRETRO_SQUIRRELJME_MAKE_FILE)
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ratufacoat/libretro -f "$(LIBRETRO_SQUIRRELJME_MAKE_FILE)"
endef

define LIBRETRO_SQUIRRELJME_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/ratufacoat/libretro/squirreljme_libretro.so $(TARGET_DIR)/usr/lib/libretro/squirreljme_libretro.so
endef

$(eval $(generic-package))
