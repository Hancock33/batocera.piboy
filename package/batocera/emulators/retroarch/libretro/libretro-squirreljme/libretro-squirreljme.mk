################################################################################
#
# libretro-squirreljme
#
################################################################################
# Version: Commits on Dec 30, 2024
LIBRETRO_SQUIRRELJME_VERSION = 38010d63daca68e5e996d584252d58480fb10fc9
LIBRETRO_SQUIRRELJME_SITE = $(call github,SquirrelJME,SquirrelJME,$(LIBRETRO_SQUIRRELJME_VERSION))
LIBRETRO_SQUIRRELJME_LICENSE = GPL-3.0
LIBRETRO_SQUIRRELJME_SUPPORTS_IN_SOURCE_BUILD = NO
LIBRETRO_SQUIRRELJME_SUBDIR = nanocoat

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
