################################################################################
#
# libretro-brimir
#
################################################################################
# Version: Commits on Nov 29, 2025
LIBRETRO_BRIMIR_VERSION = v0.1.3
LIBRETRO_BRIMIR_SITE = https://github.com/coredds/brimir.git
LIBRETRO_BRIMIR_SITE_METHOD = git
LIBRETRO_BRIMIR_GIT_SUBMODULES = yes
LIBRETRO_BRIMIR_SUPPORTS_IN_SOURCE_BUILD = YES
LIBRETRO_BRIMIR_LICENSE = GPL-3.0
LIBRETRO_BRIMIR_DEPENDENCIES = retroarch

define LIBRETRO_BRIMIR_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/buildroot-build/brimir_libretro.so $(TARGET_DIR)/usr/lib/libretro/brimir_libretro.so
endef

$(eval $(cmake-package))
