################################################################################
#
# libretro-jaxe
#
################################################################################
# Version: Commits on Jan 09, 2026
LIBRETRO_JAXE_VERSION = e8e90e3d683bb560df5882f0ad62ed28f96a541a
LIBRETRO_JAXE_SITE = https://github.com/kurtjd/jaxe.git
LIBRETRO_JAXE_SITE_METHOD=git
LIBRETRO_JAXE_GIT_SUBMODULES=YES
LIBRETRO_JAXE_LICENSE = MIT
LIBRETRO_JAXE_EMULATOR_INFO = jaxe.libretro.core.yml

define LIBRETRO_JAXE_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile.libretro platform="unix"
endef

define LIBRETRO_JAXE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/jaxe_libretro.so $(TARGET_DIR)/usr/lib/libretro/jaxe_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
