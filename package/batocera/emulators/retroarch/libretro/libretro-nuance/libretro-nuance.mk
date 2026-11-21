################################################################################
#
# libretro-nuance
#
################################################################################
# Version: Commits on Nov 15, 2026
LIBRETRO_NUANCE_VERSION = f28138dab38f59d8603c47f06a1b8f3cf93c9d7a
LIBRETRO_NUANCE_SITE = https://github.com/andkrau/NuanceResurrection.git
LIBRETRO_NUANCE_SITE_METHOD = git
LIBRETRO_NUANCE_GIT_SUBMODULES = YES
LIBRETRO_NUANCE_SUPPORTS_IN_SOURCE_BUILD = NO
LIBRETRO_NUANCE_LICENSE = Nuance License (non-commercial), BSD-3-Clause
LIBRETRO_NUANCE_LICENSE_FILES = License.txt
LIBRETRO_NUANCE_DEPENDENCIES = retroarch libgl
LIBRETRO_NUANCE_EMULATOR_INFO = nuance.libretro.core.yml

LIBRETRO_NUANCE_CONF_OPTS += -DBUILD_LIBRETRO=ON
LIBRETRO_NUANCE_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF

define LIBRETRO_NUANCE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/nuance
	$(INSTALL) -D $(@D)/buildroot-build/nuance_libretro.so $(TARGET_DIR)/usr/lib/libretro/nuance_libretro.so
	$(INSTALL) -D -m 0644 $(@D)/dist/nuance_libretro.info $(TARGET_DIR)/usr/share/libretro/info/nuance_libretro.info
	$(INSTALL) -m 0644 $(@D)/bios.cof $(@D)/minibios.cof $(@D)/minibiosX.cof $(TARGET_DIR)/usr/share/batocera/datainit/bios/nuance/
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
