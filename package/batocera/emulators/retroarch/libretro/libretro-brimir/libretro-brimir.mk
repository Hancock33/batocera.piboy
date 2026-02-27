################################################################################
#
# libretro-brimir
#
################################################################################
# Version: Commits on Feb 26, 2026
LIBRETRO_BRIMIR_VERSION = 6289c1c5bf48e0825b5223a43735f0404bc4df92
LIBRETRO_BRIMIR_SITE = https://github.com/coredds/brimir.git
LIBRETRO_BRIMIR_SITE_METHOD = git
LIBRETRO_BRIMIR_GIT_SUBMODULES = yes
LIBRETRO_BRIMIR_SUPPORTS_IN_SOURCE_BUILD = YES
LIBRETRO_BRIMIR_LICENSE = GPL-3.0
LIBRETRO_BRIMIR_DEPENDENCIES = retroarch
LIBRETRO_BRIMIR_EMULATOR_INFO = brimir.libretro.core.yml

define LIBRETRO_BRIMIR_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/buildroot-build/brimir_libretro.so $(TARGET_DIR)/usr/lib/libretro/brimir_libretro.so
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
