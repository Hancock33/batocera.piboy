################################################################################
#
# libretro-swanstation
#
################################################################################
# Version: Commits on Oct 24, 2026
LIBRETRO_SWANSTATION_VERSION = 631f0fb31b809e0f889d7c551fe695788e39c1d3
LIBRETRO_SWANSTATION_SITE = $(call github,libretro,swanstation,$(LIBRETRO_SWANSTATION_VERSION))
LIBRETRO_SWANSTATION_SUPPORTS_IN_SOURCE_BUILD = NO
LIBRETRO_SWANSTATION_LICENSE = GPL-2.0
LIBRETRO_SWANSTATION_DEPENDENCIES = retroarch
LIBRETRO_SWANSTATION_EMULATOR_INFO = swanstation.libretro.core.yml

LIBRETRO_SWANSTATION_CONF_OPTS += -DBUILD_SHARED_LIBS=FALSE
LIBRETRO_SWANSTATION_CONF_OPTS += -DCMAKE_C_COMPILER=$(TARGET_CC)
LIBRETRO_SWANSTATION_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(TARGET_CXX)

define LIBRETRO_SWANSTATION_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/buildroot-build/swanstation_libretro.so $(TARGET_DIR)/usr/lib/libretro/swanstation_libretro.so
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
