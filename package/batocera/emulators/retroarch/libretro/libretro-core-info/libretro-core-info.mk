################################################################################
#
# LIBRETRO_CORE_INFO
#
################################################################################
# Version.: Commits on Mar 04, 2022
LIBRETRO_CORE_INFO_VERSION = baff69f21792f463d3411e0f3a1e944a6662744f
LIBRETRO_CORE_INFO_SITE = $(call github,libretro,libretro-core-info,$(LIBRETRO_CORE_INFO_VERSION))
LIBRETRO_CORE_INFO_LICENSE = MIT

define LIBRETRO_CORE_INFO_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/libretro/cores
	cp -a $(@D)/*.info $(TARGET_DIR)/usr/share/libretro/cores/
endef

$(eval $(generic-package))
