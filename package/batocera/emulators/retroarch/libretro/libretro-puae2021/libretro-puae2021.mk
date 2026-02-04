################################################################################
#
# libretro-puae2021
#
################################################################################
# Version: Commits on Nov 02, 2025
LIBRETRO_PUAE2021_VERSION = 58527ce9e8cc5f19faae9e6010d2f06fc70b10de
LIBRETRO_PUAE2021_BRANCH = 2.6.1
LIBRETRO_PUAE2021_SITE = $(call github,sonninnos,libretro-uae,$(LIBRETRO_PUAE2021_VERSION))
LIBRETRO_PUAE2021_LICENSE = GPLv2
LIBRETRO_PUAE2021_DEPENDENCIES += retroarch
LIBRETRO_PUAE2021_EMULATOR_INFO = puae2021.libretro.core.yml

define LIBRETRO_PUAE2021_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_PUAE2021_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_PUAE2021_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/puae2021_libretro.so $(TARGET_DIR)/usr/lib/libretro/puae2021_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
