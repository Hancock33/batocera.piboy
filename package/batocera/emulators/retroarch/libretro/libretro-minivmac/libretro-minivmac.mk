################################################################################
#
# Libretro-miniVMac
#
# Version.: Commits on Jan 27, 2022
LIBRETRO_MINIVMAC_VERSION = 2f94ed35b96454a874996b2398c4ff631a425e14
LIBRETRO_MINIVMAC_SITE = $(call github,libretro,libretro-minivmac,$(LIBRETRO_MINIVMAC_VERSION))
LIBRETRO_MINIVMAC_LICENSE = GPLv2
LIBRETRO_MINIVMAC_DEPENDENCIES = 

define LIBRETRO_MINIVMAC_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform=unix \
        GIT_VERSION="-$(shell echo $(LIBRETRO_MINIVMAC_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_MINIVMAC_INSTALL_TARGET_CMDS
    $(INSTALL) -D $(@D)/minivmac_libretro.so \
        $(TARGET_DIR)/usr/lib/libretro/minivmac_libretro.so
endef

$(eval $(generic-package))
