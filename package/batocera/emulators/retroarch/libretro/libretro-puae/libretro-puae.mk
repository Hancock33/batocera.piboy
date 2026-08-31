################################################################################
#
# libretro-puae
#
################################################################################
# Version: Commits on Aug 30, 2026
LIBRETRO_PUAE_VERSION = 6de65d7d07d3530785afdf980405ff7674cdb3e5
LIBRETRO_PUAE_SITE = $(call github,sonninnos,libretro-uae,$(LIBRETRO_PUAE_VERSION))
LIBRETRO_PUAE_LICENSE = GPLv2
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
