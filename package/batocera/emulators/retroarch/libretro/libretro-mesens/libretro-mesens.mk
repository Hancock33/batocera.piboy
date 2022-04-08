################################################################################
#
# libretro-mesen-s
#
################################################################################
# Version: Commits on Apr 07, 2022
LIBRETRO_MESENS_VERSION = 3694c7f9692a0be32d86979c347884ae9def0a3b
LIBRETRO_MESENS_SITE = $(call github,libretro,Mesen-S,$(LIBRETRO_MESENS_VERSION))
LIBRETRO_MESENS_LICENSE = GPL

define LIBRETRO_MESENS_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" GIT_VERSION="" -C $(@D)/Libretro -f Makefile
endef

define LIBRETRO_MESENS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/Libretro/mesen-s_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/mesens_libretro.so
endef

$(eval $(generic-package))
