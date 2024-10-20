################################################################################
#
# libretro-tamalibretro
#
################################################################################
# Version: Commits on Sept 23, 2024
LIBRETRO_TAMALIBRETRO_VERSION = 4aa7f34f2d3b32a42ee8e123bc75f8884572797f
LIBRETRO_TAMALIBRETRO_SITE = https://github.com/celerizer/tamalibretro.git
LIBRETRO_TAMALIBRETRO_SITE_METHOD=git
LIBRETRO_TAMALIBRETRO_GIT_SUBMODULES=YES
LIBRETRO_TAMALIBRETRO_LICENSE = GPL-2.0

define LIBRETRO_TAMALIBRETRO_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="unix" \
	GIT_VERSION="-$(shell echo $(LIBRETRO_TAMALIBRETRO_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_TAMALIBRETRO_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/tamalibretro_libretro.so $(TARGET_DIR)/usr/lib/libretro/tamalibretro_libretro.so
endef

$(eval $(generic-package))
