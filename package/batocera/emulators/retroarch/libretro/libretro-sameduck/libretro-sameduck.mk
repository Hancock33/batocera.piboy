################################################################################
#
# libretro-sameduck
#
################################################################################
# Version: Commits on Jul 03, 2022 (branch@SameDuck)
LIBRETRO_SAMEDUCK_VERSION = 5cc014b23af963f9e9a77091a1e6ff7a7852e8a7
LIBRETRO_SAMEDUCK_SITE = $(call github,LIJI32,SameBoy,$(LIBRETRO_SAMEDUCK_VERSION))
LIBRETRO_SAMEDUCK_LICENSE = GPL-3.0

define LIBRETRO_SAMEDUCK_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/libretro -f Makefile platform="unix"
endef

define LIBRETRO_SAMEDUCK_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/build/bin/sameduck_libretro.so \
    $(TARGET_DIR)/usr/lib/libretro/sameduck_libretro.so
endef

$(eval $(generic-package))
