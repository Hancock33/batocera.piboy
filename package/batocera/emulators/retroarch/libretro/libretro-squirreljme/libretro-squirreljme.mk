################################################################################
#
# libretro-squirreljme
#
################################################################################
# Version: Commits on Feb 01, 2025
LIBRETRO_SQUIRRELJME_VERSION = 73583d50002529ec193c8e9e25de55bcd9cb228c
LIBRETRO_SQUIRRELJME_SITE = $(call github,SquirrelJME,SquirrelJME,$(LIBRETRO_SQUIRRELJME_VERSION))
LIBRETRO_SQUIRRELJME_SUPPORTS_IN_SOURCE_BUILD = NO
LIBRETRO_SQUIRRELJME_SUBDIR = nanocoat
LIBRETRO_SQUIRRELJME_LICENSE = GPL-3.0

LIBRETRO_SQUIRRELJME_CONF_OPTS += -DSQUIRRELJME_ENABLE_TESTING=OFF
LIBRETRO_SQUIRRELJME_CONF_OPTS += -DENABLE_FRONTEND_LIBRETRO=ON
LIBRETRO_SQUIRRELJME_CONF_OPTS += -DESQUIRRELJME_IS_CROSS_COMPILE=ON

define LIBRETRO_SQUIRRELJME_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/nanocoat/buildroot-build/squirreljme_libretro.so	$(TARGET_DIR)/usr/lib/libretro/squirreljme_libretro.so
	$(INSTALL) -D $(@D)/nanocoat/squirreljme_libretro.info					$(TARGET_DIR)/usr/share/libretro/info/
endef

$(eval $(cmake-package))
