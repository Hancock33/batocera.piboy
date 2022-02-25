################################################################################
#
# LIBRETRO_CORE_INFO
#
################################################################################
# Version.: Commits on Feb 21, 2022
LIBRETRO_CORE_INFO_VERSION = f1c51da3996ea0cfeffb95326ef1b52678415019
LIBRETRO_CORE_INFO_SITE = $(call github,libretro,libretro-core-info,$(LIBRETRO_CORE_INFO_VERSION))
LIBRETRO_CORE_INFO_LICENSE = MIT

define LIBRETRO_CORE_INFO_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/libretro/cores
	cp -a $(@D)/*.info $(TARGET_DIR)/usr/share/libretro/cores/
endef

$(eval $(generic-package))
