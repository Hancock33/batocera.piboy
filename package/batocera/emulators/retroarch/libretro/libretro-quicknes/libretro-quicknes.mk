################################################################################
#
# libretro-quicknes
#
################################################################################
# Version: Commits on Feb 20, 2023
LIBRETRO_QUICKNES_VERSION = 75d501a87ec2074e8d2f7256fb0359513c263c29
LIBRETRO_QUICKNES_SITE = $(call github,libretro,QuickNES_Core,$(LIBRETRO_QUICKNES_VERSION))
LIBRETRO_QUICKNES_LICENSE = GPL

define LIBRETRO_QUICKNES_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform=unix \
		GIT_VERSION="-$(shell echo $(LIBRETRO_QUICKNES_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_QUICKNES_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/quicknes_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/quicknes_libretro.so
endef

$(eval $(generic-package))
