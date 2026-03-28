################################################################################
#
# yquake2-rogue
#
################################################################################
# Version: Commits on Mar 28, 2026
YQUAKE2_ROGUE_VERSION = cf19467f79a723a3180003d956aa1867a5921bd3
YQUAKE2_ROGUE_SITE = $(call github,yquake2,rogue,$(YQUAKE2_ROGUE_VERSION))
YQUAKE2_ROGUE_LICENSE = GPLv2
YQUAKE2_ROGUE_LICENSE_FILES = LICENSE
YQUAKE2_ROGUE_DEPENDENCIES += yquake2

define YQUAKE2_ROGUE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/yquake2/rogue
	$(INSTALL) -D -m 0644 $(@D)/Release/game.so $(TARGET_DIR)/usr/bin/yquake2/rogue/
endef

$(eval $(cmake-package))
