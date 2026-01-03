################################################################################
#
# libretro-noods
#
################################################################################
# Version: Commits on Jan 02, 2026
LIBRETRO_NOODS_VERSION = 4975265a886a13906bb247ffade4a7e39ae78fff
LIBRETRO_NOODS_SITE = $(call github,jonian,libretro-noods,$(LIBRETRO_NOODS_VERSION))
LIBRETRO_NOODS_LICENSE = GPL-3.0

define LIBRETRO_NOODS_BUILD_CMDS
	$(SED) "s|\-Ofast|$(TARGET_OPTIMIZATION) -flto=auto|g" $(@D)/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile.libretro platform="unix" \
	GIT_VERSION="-$(shell echo $(LIBRETRO_NOODS_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_NOODS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/noods_libretro.so $(TARGET_DIR)/usr/lib/libretro/noods_libretro.so
endef

$(eval $(generic-package))
