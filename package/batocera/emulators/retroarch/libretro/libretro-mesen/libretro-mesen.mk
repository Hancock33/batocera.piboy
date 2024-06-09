################################################################################
#
# libretro-mesen
#
################################################################################
# Version: Commits on Jun 09, 2024
LIBRETRO_MESEN_VERSION = 91db6be681f70b2080525c267af6132555323ea1
LIBRETRO_MESEN_SITE = $(call github,libretro,Mesen,$(LIBRETRO_MESEN_VERSION))
LIBRETRO_MESEN_LICENSE = GPL

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
