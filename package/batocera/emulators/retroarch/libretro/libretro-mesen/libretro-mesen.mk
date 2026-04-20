################################################################################
#
# libretro-mesen
#
################################################################################
# Version: Commits on Apr 20, 2026
LIBRETRO_MESEN_VERSION = 0102910c39ad1a62bc3f784466f3f67ca9eae335
LIBRETRO_MESEN_SITE = $(call github,libretro,Mesen,$(LIBRETRO_MESEN_VERSION))
LIBRETRO_MESEN_LICENSE = GPL
LIBRETRO_MESEN_DEPENDENCIES += retroarch
LIBRETRO_MESEN_EMULATOR_INFO = mesen.libretro.core.yml

define LIBRETRO_MESEN_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
	    GIT_VERSION="" -C $(@D)/Libretro -f Makefile
endef

define LIBRETRO_MESEN_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/Libretro/mesen_libretro.so $(TARGET_DIR)/usr/lib/libretro/mesen_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
