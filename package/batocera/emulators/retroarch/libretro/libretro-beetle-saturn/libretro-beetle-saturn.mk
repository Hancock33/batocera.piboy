################################################################################
#
# libretro-beetle-saturn
#
################################################################################
# Version: Commits on Oct 21, 2024
LIBRETRO_BEETLE_SATURN_VERSION = 319b102d9c7779aab99e4d8b65eb474d448f703d
LIBRETRO_BEETLE_SATURN_SITE = $(call github,libretro,beetle-saturn-libretro,$(LIBRETRO_BEETLE_SATURN_VERSION))
LIBRETRO_BEETLE_SATURN_LICENSE = GPLv2

ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
LIBRETRO_BEETLE_SATURN_DEPENDENCIES += libgles
endif

define LIBRETRO_BEETLE_SATURN_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile HAVE_OPENGL=1 platform="$(LIBRETRO_PLATFORM)"
endef

define LIBRETRO_BEETLE_SATURN_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/mednafen_saturn_hw_libretro.so $(TARGET_DIR)/usr/lib/libretro/beetle-saturn_libretro.so
endef

$(eval $(generic-package))
