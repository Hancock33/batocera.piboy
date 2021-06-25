################################################################################
#
# CHEATS
#
################################################################################
# Version.: Commits on Jun 25, 2021
LIBRETRO_CHEATS_VERSION = 7b2cc6dff813fcd002df2bc46df9e9669e29407d
LIBRETRO_CHEATS_SITE = $(call github,libretro,libretro-database,$(LIBRETRO_CHEATS_VERSION))

define LIBRETRO_CHEATS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/cheats/cht
	cp -r $(@D)/cht/* $(TARGET_DIR)/usr/share/batocera/datainit/cheats/cht
endef

$(eval $(generic-package))
