################################################################################
#
# libretro-quicknes
#
################################################################################
# Version: Commits on May 28, 2023
LIBRETRO_QUICKNES_VERSION = 058d66516ed3f1260b69e5b71cd454eb7e9234a3
LIBRETRO_QUICKNES_SITE = $(call github,libretro,QuickNES_Core,$(LIBRETRO_QUICKNES_VERSION))
LIBRETRO_QUICKNES_LICENSE = GPL

define LIBRETRO_QUICKNES_BUILD_CMDS
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform=unix \
		GIT_VERSION="-$(shell echo $(LIBRETRO_QUICKNES_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_QUICKNES_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/quicknes_libretro.so $(TARGET_DIR)/usr/lib/libretro/quicknes_libretro.so
endef

$(eval $(generic-package))
