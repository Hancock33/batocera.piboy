################################################################################
#
# libretro-tamalibretro
#
################################################################################
# Version: Commits on Nov 27, 2024
LIBRETRO_TAMALIBRETRO_VERSION = ec83dc1a5ea8bdbcd02cee81779c6dbe0e996ed2
LIBRETRO_TAMALIBRETRO_SITE = https://github.com/celerizer/tamalibretro.git
LIBRETRO_TAMALIBRETRO_SITE_METHOD=git
LIBRETRO_TAMALIBRETRO_GIT_SUBMODULES=YES
LIBRETRO_TAMALIBRETRO_LICENSE = GPL-2.0
LIBRETRO_TAMALIBRETRO_EMULATOR_INFO = tamalibretro.libretro.core.yml

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
$(eval $(emulator-info-package))
