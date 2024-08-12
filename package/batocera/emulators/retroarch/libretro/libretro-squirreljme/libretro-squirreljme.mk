################################################################################
#
# libretro-squirreljme
#
################################################################################
# Version: Commits on Aug 11, 2024
LIBRETRO_SQUIRRELJME_VERSION = 74f1c1eb253da7270d8bbfdb7cfb176a8627e369
LIBRETRO_SQUIRRELJME_SITE = $(call github,SquirrelJME,SquirrelJME,$(LIBRETRO_SQUIRRELJME_VERSION))
LIBRETRO_SQUIRRELJME_LICENSE = GPL-3.0
LIBRETRO_SQUIRRELJME_SUPPORTS_IN_SOURCE_BUILD = NO
LIBRETRO_SQUIRRELJME_SUBDIR = nanocoat

LIBRETRO_SQUIRRELJME_TARGET_CFLAGS = $(TARGET_CFLAGS) -Wno-incompatible-pointer-types
LIBRETRO_SQUIRRELJME_CONF_OPTS += -DCMAKE_C_FLAGS="$(LIBRETRO_SQUIRRELJME_TARGET_CFLAGS)"
LIBRETRO_SQUIRRELJME_CONF_OPTS += -DSQUIRRELJME_ENABLE_TESTING=OFF
LIBRETRO_SQUIRRELJME_CONF_OPTS += -DENABLE_FRONTEND_LIBRETRO=ON

define LIBRETRO_SQUIRRELJME_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/nanocoat/buildroot-build/squirreljme_libretro.so	$(TARGET_DIR)/usr/lib/libretro/squirreljme_libretro.so
	$(INSTALL) -D $(@D)/nanocoat/squirreljme_libretro.info					$(TARGET_DIR)/usr/share/libretro/info/
endef

$(eval $(cmake-package))
