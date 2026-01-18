################################################################################
#
# libretro-arduous
#
################################################################################
# Version: Commits on Jan 13, 2026
LIBRETRO_ARDUOUS_VERSION = 882ea139758fef5e5d711324d138d812abd5c10c
LIBRETRO_ARDUOUS_SITE = https://github.com/libretro/arduous.git
LIBRETRO_ARDUOUS_SITE_METHOD=git
LIBRETRO_ARDUOUS_GIT_SUBMODULES=YES
LIBRETRO_ARDUOUS_SUPPORTS_IN_SOURCE_BUILD = NO
LIBRETRO_ARDUOUS_LICENSE = GPL-2.0
LIBRETRO_ARDUOUS_DEPENDENCIES = retroarch

LIBRETRO_ARDUOUS_CONF_OPTS  = -DWERROR=OFF

define LIBRETRO_ARDUOUS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/buildroot-build/arduous_libretro.so $(TARGET_DIR)/usr/lib/libretro/arduous_libretro.so
endef

$(eval $(cmake-package))
