################################################################################
#
# SQUIRRELJME
#
################################################################################
# Version.: Commits on Jul 12, 2021
LIBRETRO_SQUIRRELJME_VERSION = c1e1b26daf1881b57d153046d37a8cd8adbeb757
LIBRETRO_SQUIRRELJME_SITE = $(call github,SquirrelJME,SquirrelJME,$(LIBRETRO_SQUIRRELJME_VERSION))
LIBRETRO_SQUIRRELJME_LICENSE = GPL-3.0

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI4),y)
LIBRETRO_SQUIRRELJME_MAKE_FILE=Makefile.linux_rpi4
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI3),y)
LIBRETRO_SQUIRRELJME_MAKE_FILE=Makefile.linux_rpi3
else
LIBRETRO_SQUIRRELJME_MAKE_FILE=Makefile.linux_x86_64
endif

define LIBRETRO_SQUIRRELJME_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ratufacoat/libretro -f "$(LIBRETRO_SQUIRRELJME_MAKE_FILE)"
endef

define LIBRETRO_SQUIRRELJME_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/ratufacoat/libretro/squirreljme_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/squirreljme_libretro.so
endef

$(eval $(generic-package))
