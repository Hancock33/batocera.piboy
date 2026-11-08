################################################################################
#
# libretro-gametank
#
################################################################################
# Version: Commits on Nov 02, 2026
LIBRETRO_GAMETANK_VERSION = v1.0.2
LIBRETRO_GAMETANK_SITE = $(call github,SundownerSport,gametank-libretro,$(LIBRETRO_GAMETANK_VERSION))
LIBRETRO_GAMETANK_LICENSE = MIT
LIBRETRO_GAMETANK_LICENSE_FILES = LICENSE
LIBRETRO_GAMETANK_DEPENDENCIES = retroarch
LIBRETRO_GAMETANK_EMULATOR_INFO = gametank.libretro.core.yml

define LIBRETRO_GAMETANK_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" -C $(@D) platform=unix \
		GIT_VERSION="-$(shell echo $(LIBRETRO_GAMETANK_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_GAMETANK_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/gametank_libretro.so $(TARGET_DIR)/usr/lib/libretro/gametank_libretro.so
	$(INSTALL) -D -m 0644 $(@D)/gametank_libretro.info $(TARGET_DIR)/usr/share/libretro/info/gametank_libretro.info
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
