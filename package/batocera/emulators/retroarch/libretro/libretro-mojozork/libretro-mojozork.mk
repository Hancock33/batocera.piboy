################################################################################
#
# libretro-mojozork
#
################################################################################
# Version: Commits on Mar 06, 2023
LIBRETRO_MOJOZORK_VERSION = 74d3e36ed89a6e44930cd103b9054f9fd8767b99
LIBRETRO_MOJOZORK_SITE = $(call github,icculus,mojozork,$(LIBRETRO_MOJOZORK_VERSION))
LIBRETRO_MOJOZORK_LICENSE = Zlib
LIBRETRO_MOJOZORK_DEPENDENCIES = retroarch host-ninja

LIBRETRO_MOJOZORK_CONF_OPTS = -DMOJOZORK_LIBRETRO=ON -DMOJOZORK_STANDALONE_DEFAULT=OFF -DMOJOZORK_MULTIZORK_DEFAULT=OFF -GNinja

define LIBRETRO_MOJOZORK_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(LIBRETRO_MOJOZORK_BUILDDIR)
endef

define LIBRETRO_MOJOZORK_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/mojozork_libretro.so   $(TARGET_DIR)/usr/lib/libretro/mojozork_libretro.so
	mkdir -p                                   $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/mojozork_libretro.info $(TARGET_DIR)/usr/share/libretro/info/mojozork_libretro.info
endef

$(eval $(cmake-package))
