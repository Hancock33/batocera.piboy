################################################################################
#
# VIRTUALJAGUAR
#
################################################################################
# Version.: Commits on Nov 05, 2021
LIBRETRO_VIRTUALJAGUAR_VERSION = e2fd7bdbfa811a5a8cd0f2ea32a6079049d75464
LIBRETRO_VIRTUALJAGUAR_SITE = $(call github,libretro,virtualjaguar-libretro,$(LIBRETRO_VIRTUALJAGUAR_VERSION))
LIBRETRO_VIRTUALJAGUAR_LICENSE = GPLv3

define LIBRETRO_VIRTUALJAGUAR_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)
endef

define LIBRETRO_VIRTUALJAGUAR_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/virtualjaguar_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/virtualjaguar_libretro.so
endef

$(eval $(generic-package))
