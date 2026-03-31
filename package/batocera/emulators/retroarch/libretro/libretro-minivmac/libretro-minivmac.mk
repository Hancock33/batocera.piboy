################################################################################
#
# libretro-minivmac
#
################################################################################
# Version: Commits on Mar 31, 2026
LIBRETRO_MINIVMAC_VERSION = ac7fdac318261e1e3464081bf300cc3db30c74af
LIBRETRO_MINIVMAC_SITE = https://github.com/libretro/libretro-minivmac
LIBRETRO_MINIVMAC_LICENSE = GPLv2
LIBRETRO_MINIVMAC_SITE_METHOD=git
LIBRETRO_MINIVMAC_GIT_SUBMODULES=YES
LIBRETRO_MINIVMAC_DEPENDENCIES = retroarch
LIBRETRO_MINIVMAC_EMULATOR_INFO = minivmac.libretro.core.yml

define LIBRETRO_MINIVMAC_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform=unix \
		GIT_VERSION="-$(shell echo $(LIBRETRO_MINIVMAC_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_MINIVMAC_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/minivmac_libretro.so $(TARGET_DIR)/usr/lib/libretro/minivmac_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
