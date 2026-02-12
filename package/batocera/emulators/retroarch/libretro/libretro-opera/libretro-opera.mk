################################################################################
#
# libretro-opera
#
################################################################################
# Version: Commits on Feb 11, 2026
LIBRETRO_OPERA_VERSION = 1eee72f640e4da6f1b8ca68f70b51db22cc474c8
LIBRETRO_OPERA_SITE = $(call github,libretro,opera-libretro,$(LIBRETRO_OPERA_VERSION))
LIBRETRO_OPERA_LICENSE = LGPL/Non-commercial
LIBRETRO_OPERA_DEPENDENCIES += retroarch
LIBRETRO_OPERA_EMULATOR_INFO = opera.libretro.core.yml

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_XU4),y)
    LIBRETRO_OPERA_PLATFORM = unix-odroidxu
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S922X),y)
    LIBRETRO_OPERA_PLATFORM = unix-CortexA73_G12B
else
    LIBRETRO_OPERA_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_OPERA_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION) -flto=auto|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ platform="$(LIBRETRO_OPERA_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_OPERA_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_OPERA_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/opera_libretro.so $(TARGET_DIR)/usr/lib/libretro/opera_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
