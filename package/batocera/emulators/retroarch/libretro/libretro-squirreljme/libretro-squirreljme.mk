################################################################################
#
# libretro-squirreljme
#
################################################################################
# Version: Commits on Apr 23, 2024
LIBRETRO_SQUIRRELJME_VERSION = 00a376c022b7d767763459fe87954b6ae21b2e7e
LIBRETRO_SQUIRRELJME_SITE = $(call github,SquirrelJME,SquirrelJME,$(LIBRETRO_SQUIRRELJME_VERSION))
LIBRETRO_SQUIRRELJME_LICENSE = GPL-3.0
LIBRETRO_SQUIRRELJME_SUPPORTS_IN_SOURCE_BUILD = NO
LIBRETRO_SQUIRRELJME_SUBDIR = nanocoat

define LIBRETRO_SQUIRRELJME_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/nanocoat/buildroot-build/squirreljme_libretro.so	$(TARGET_DIR)/usr/lib/libretro/squirreljme_libretro.so
	$(INSTALL) -D $(@D)/nanocoat/squirreljme_libretro.info					$(TARGET_DIR)/usr/share/libretro/info/
endef

$(eval $(cmake-package))
