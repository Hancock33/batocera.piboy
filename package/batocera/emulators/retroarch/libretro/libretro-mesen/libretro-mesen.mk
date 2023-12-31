################################################################################
#
# libretro-mesen
#
################################################################################
# Version: Commits on May 21, 2023
LIBRETRO_MESEN_VERSION = d25d60fc190f3f7603a1113ef1e11d9da65b7583
LIBRETRO_MESEN_SITE = $(call github,libretro,Mesen,$(LIBRETRO_MESEN_VERSION))
LIBRETRO_MESEN_LICENSE = GPL

define LIBRETRO_MESEN_BUILD_CMDS
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/Libretro/Makefile
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/Libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
	    GIT_VERSION="" -C $(@D)/Libretro -f Makefile
endef

define LIBRETRO_MESEN_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/Libretro/mesen_libretro.so $(TARGET_DIR)/usr/lib/libretro/mesen_libretro.so
endef

$(eval $(generic-package))
