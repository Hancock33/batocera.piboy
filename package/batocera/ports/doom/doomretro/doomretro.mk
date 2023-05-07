################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 07, 2023
DOOMRETRO_VERSION = cf7953ee73a7461a26a15e141e6fe176ccc7f239
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image host-ninja
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

DOOMRETRO_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -GNinja

define DOOMRETRO_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(DOOMRETRO_BUILDDIR)
endef

define DOOMRETRO_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(DOOMRETRO_BUILDDIR)
endef

$(eval $(cmake-package))
