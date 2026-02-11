################################################################################
#
# libretro-ecwolf
#
################################################################################
# Version: Commits on Feb 11, 2026
LIBRETRO_ECWOLF_VERSION = 15c1aa3114b2b9cdb1baec0a6467b2b868371446
LIBRETRO_ECWOLF_SITE = https://github.com/libretro/ecwolf
LIBRETRO_ECWOLF_LICENSE = Non-commercial
LIBRETRO_ECWOLF_SITE_METHOD=git
LIBRETRO_ECWOLF_GIT_SUBMODULES=YES
LIBRETRO_ECWOLF_DEPENDENCIES = retroarch
LIBRETRO_ECWOLF_EMULATOR_INFO = ecwolf.libretro.core.yml

LIBRETRO_ECWOLF_PLATFORM = $(LIBRETRO_PLATFORM)

LIBRETRO_ECWOLF_CONF_OPTS += -DLIBRETRO=ON -DFORCE_CROSSCOMPILE=ON

define LIBRETRO_ECWOLF_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/src/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" GIT_VERSION="" \
	-C $(@D)/src/libretro/ -f Makefile platform="$(LIBRETRO_PLATFORM)"
endef

define LIBRETRO_ECWOLF_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/src/libretro/ecwolf_libretro.so $(TARGET_DIR)/usr/lib/libretro/ecwolf_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
