################################################################################
#
# CHEATS
#
################################################################################
# Version.: Commits on Jun 12, 2021
LIBRETRO_CHEATS_VERSION = ec6ead2bfe450e8013eb60525bb6a90c62e6cb38
LIBRETRO_CHEATS_SITE = $(call github,libretro,libretro-database,$(LIBRETRO_CHEATS_VERSION))

define LIBRETRO_CHEATS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/cheats/cht
	cp -r $(@D)/cht/* $(TARGET_DIR)/usr/share/batocera/datainit/cheats/cht
endef

$(eval $(generic-package))
