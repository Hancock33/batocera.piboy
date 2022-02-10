################################################################################
#
# LIBRETRO_ARDUOUS
#
################################################################################
# Version.: Commits on Feb 10, 2022
LIBRETRO_ARDUOUS_VERSION = 629bb7c9616b68e1e3b57c805a257111b98e934a
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
