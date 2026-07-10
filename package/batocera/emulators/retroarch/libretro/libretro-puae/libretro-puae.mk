################################################################################
#
# libretro-puae
#
################################################################################
# Version: Commits on Jul 10, 2026
LIBRETRO_PUAE_VERSION = 4c518532b15818aa32f89268c832ccb2c4867bcd
LIBRETRO_PUAE_SITE = $(call github,sonninnos,libretro-uae,$(LIBRETRO_PUAE_VERSION))
LIBRETRO_PUAE__LICENSE = GPLv2
LIBRETRO_PUAE_DEPENDENCIES += retroarch
LIBRETRO_PUAE_EMULATOR_INFO = puae.libretro.core.yml

define LIBRETRO_PUAE_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION) -Wno-int-conversion|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_PUAE_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_PUAE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/puae_libretro.so $(TARGET_DIR)/usr/lib/libretro/puae_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
