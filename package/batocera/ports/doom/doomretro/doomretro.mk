################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 07, 2023
DOOMRETRO_VERSION = 5d9a63fc765449d6751ab2b99a3a81dd19fe2002
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
