################################################################################
#
# LIBRETRO_CORE_INFO
#
################################################################################
# Version.: Commits on Feb 14, 2022
LIBRETRO_CORE_INFO_VERSION = 92bc66a63258e0083fa7b19406891e1ce7d01ad8
LIBRETRO_CORE_INFO_SITE = $(call github,libretro,libretro-core-info,$(LIBRETRO_CORE_INFO_VERSION))
LIBRETRO_CORE_INFO_LICENSE = MIT

define LIBRETRO_CORE_INFO_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/libretro/cores
	cp -a $(@D)/*.info $(TARGET_DIR)/usr/share/libretro/cores/
endef

$(eval $(generic-package))
