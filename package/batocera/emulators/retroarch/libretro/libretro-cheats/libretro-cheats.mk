################################################################################
#
# CHEATS
#
################################################################################
# Version.: Commits on May 29, 2021
LIBRETRO_CHEATS_VERSION = 5e3511e8d060ad2c4eddee03a19c752ba9137421
LIBRETRO_CHEATS_SITE = $(call github,libretro,libretro-database,$(LIBRETRO_CHEATS_VERSION))

define LIBRETRO_CHEATS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/cheats/cht
	cp -r $(@D)/cht/* $(TARGET_DIR)/usr/share/batocera/datainit/cheats/cht
endef

$(eval $(generic-package))
