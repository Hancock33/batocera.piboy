################################################################################
#
# LIBRETRO_ARDUOUS
#
################################################################################
# Version.: Commits on Mar 06, 2022
LIBRETRO_ARDUOUS_VERSION = 995578202ed9493e304dab39b2af75ef814b7e13
LIBRETRO_ARDUOUS_SITE = https://github.com/libretro/arduous.git
LIBRETRO_ARDUOUS_SITE_METHOD=git
LIBRETRO_ARDUOUS_GIT_SUBMODULES=YES

LIBRETRO_ARDUOUS_LICENSE = GPL-3.0
LIBRETRO_ARDUOUS_DEPENDENCIES = retroarch

LIBRETRO_ARDUOUS_SUPPORTS_IN_SOURCE_BUILD = NO

LIBRETRO_ARDUOUS_CONF_OPTS  = -DCMAKE_BUILD_TYPE=Release

define LIBRETRO_ARDUOUS_INSTALL_TARGET_CMDS
    $(INSTALL) -D $(@D)/buildroot-build/arduous_libretro.so \
	    $(TARGET_DIR)/usr/lib/libretro/arduous_libretro.so
endef

$(eval $(cmake-package))
