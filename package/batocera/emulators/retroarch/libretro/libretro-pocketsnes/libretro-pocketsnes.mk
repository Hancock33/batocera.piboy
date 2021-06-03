################################################################################
#
# POCKETSNESS
#
################################################################################
# Version.: Commits on Jun 03, 2021
LIBRETRO_POCKETSNES_VERSION = b6f65569e8b6a21f10a50b53ca92af462d5c393f
LIBRETRO_POCKETSNES_SITE = $(call github,libretro,snes9x2002,$(LIBRETRO_POCKETSNES_VERSION))
LIBRETRO_POCKETSNES_LICENSE = Non-commercial

define LIBRETRO_POCKETSNES_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)
endef

define LIBRETRO_POCKETSNES_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/snes9x2002_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/pocketsnes_libretro.so
endef

$(eval $(generic-package))
