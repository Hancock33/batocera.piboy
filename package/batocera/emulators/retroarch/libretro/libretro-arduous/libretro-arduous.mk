################################################################################
#
# libretro-arduous
#
################################################################################
# Version: Commits on Oct 10, 2024
LIBRETRO_ARDUOUS_VERSION = 2273b485628790a2ce954941341b5b071c3fb30e
LIBRETRO_ARDUOUS_SITE = https://github.com/libretro/arduous.git
LIBRETRO_ARDUOUS_SITE_METHOD=git
LIBRETRO_ARDUOUS_GIT_SUBMODULES=YES

LIBRETRO_ARDUOUS_LICENSE = GPL-3.0
LIBRETRO_ARDUOUS_DEPENDENCIES = retroarch

LIBRETRO_ARDUOUS_SUPPORTS_IN_SOURCE_BUILD = NO

LIBRETRO_ARDUOUS_CONF_OPTS  = -DWERROR=OFF

define LIBRETRO_ARDUOUS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/buildroot-build/arduous_libretro.so $(TARGET_DIR)/usr/lib/libretro/arduous_libretro.so
endef

$(eval $(cmake-package))
