################################################################################
#
# libretro-puae
#
################################################################################
# Version: Commits on Jul 19, 2025
LIBRETRO_PUAE_VERSION = 3fc66ee4b562910a17e2e2f3bad74572a8bcc134
LIBRETRO_PUAE_SITE = $(call github,sonninnos,libretro-uae,$(LIBRETRO_PUAE_VERSION))
LIBRETRO_PUAE__LICENSE = GPLv2
LIBRETRO_PUAE_DEPENDENCIES = retroarch

define LIBRETRO_PUAE_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION) -Wno-implicit-function-declaration|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_PUAE_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_PUAE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/puae_libretro.so $(TARGET_DIR)/usr/lib/libretro/puae_libretro.so
endef

$(eval $(generic-package))
