################################################################################
#
# libretro-mesen
#
################################################################################
# Version: Commits on Mar 11, 2023
LIBRETRO_MESEN_VERSION = caa4e6f14373c40bd2805c600d1b476e7616444a
LIBRETRO_MESEN_SITE = $(call github,libretro,Mesen,$(LIBRETRO_MESEN_VERSION))
LIBRETRO_MESEN_LICENSE = GPL

define LIBRETRO_MESEN_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" GIT_VERSION="" -C $(@D)/Libretro -f Makefile
endef

define LIBRETRO_MESEN_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/Libretro/mesen_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/mesen_libretro.so
endef

$(eval $(generic-package))
