################################################################################
#
# libretro-squirreljme
#
################################################################################
# Version: Commits on Jun 25, 2024
LIBRETRO_SQUIRRELJME_VERSION = 03250451591c383a9f41167164a1605182134c64
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
