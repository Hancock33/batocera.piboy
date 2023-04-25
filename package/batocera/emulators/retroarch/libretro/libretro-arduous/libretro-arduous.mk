################################################################################
#
# libretro-arduous
#
################################################################################
# Version: Commits on May 24, 2022
LIBRETRO_ARDUOUS_VERSION = aed50506962df6f965748e888b3fe7027ddb410d
LIBRETRO_ARDUOUS_SITE = https://github.com/libretro/arduous.git
LIBRETRO_ARDUOUS_SITE_METHOD=git
LIBRETRO_ARDUOUS_GIT_SUBMODULES=YES

LIBRETRO_ARDUOUS_LICENSE = GPL-3.0
LIBRETRO_ARDUOUS_DEPENDENCIES = retroarch host-ninja

LIBRETRO_ARDUOUS_SUPPORTS_IN_SOURCE_BUILD = NO

LIBRETRO_ARDUOUS_CONF_OPTS  = -DCMAKE_BUILD_TYPE=Release -GNinja
LIBRETRO_ARDUOUS_CONF_OPTS  = -DWERROR=OFF

define LIBRETRO_ARDUOUS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(LIBRETRO_ARDUOUS_BUILDDIR)
endef

define LIBRETRO_ARDUOUS_INSTALL_TARGET_CMDS
    $(INSTALL) -D $(@D)/buildroot-build/arduous_libretro.so \
	    $(TARGET_DIR)/usr/lib/libretro/arduous_libretro.so
endef

$(eval $(cmake-package))
