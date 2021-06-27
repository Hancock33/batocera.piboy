################################################################################
#
# CHEATS
#
################################################################################
# Version.: Commits on Jun 27, 2021
LIBRETRO_CHEATS_VERSION = 658a2c2977424f656ecdb3bc6c2f12503e68c68b
LIBRETRO_CHEATS_SITE = $(call github,libretro,libretro-database,$(LIBRETRO_CHEATS_VERSION))

define LIBRETRO_CHEATS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/cheats/cht
	cp -r $(@D)/cht/* $(TARGET_DIR)/usr/share/batocera/datainit/cheats/cht
endef

$(eval $(generic-package))
