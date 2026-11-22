################################################################################
#
# libretro-anygm
#
################################################################################
# Version: Commits on Nov 22, 2026
LIBRETRO_ANYGM_VERSION = 220a1dd756da6d1474f36af99ed319dca000eaed
LIBRETRO_ANYGM_SITE =  $(call github,retrodiv,AnyGM-libretro,$(LIBRETRO_ANYGM_VERSION))
LIBRETRO_ANYGM_LICENSE = MIT
LIBRETRO_ANYGM_EMULATOR_INFO = anygm.libretro.core.yml
LIBRETRO_ANYGM_DEPENDENCIES += retroarch

define LIBRETRO_ANYGM_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) platform=unix \
		CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" AR="$(TARGET_AR)" core
endef

define LIBRETRO_ANYGM_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/anygm_libretro.so $(TARGET_DIR)/usr/lib/libretro/anygm_libretro.so
	$(INSTALL) -D $(@D)/anygm_libretro.info $(TARGET_DIR)/usr/share/libretro/info/anygm_libretro.info
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
