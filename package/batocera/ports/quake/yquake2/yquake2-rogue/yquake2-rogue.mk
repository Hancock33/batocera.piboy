################################################################################
#
# yquake2-rogue
#
################################################################################
# Version: Commits on Nov 11, 2026
YQUAKE2_ROGUE_VERSION = 9e7b3160ed27befd5c47872f8e151e5743d0a6ba
YQUAKE2_ROGUE_SITE = $(call github,yquake2,rogue,$(YQUAKE2_ROGUE_VERSION))
YQUAKE2_ROGUE_LICENSE = GPL-2.0
YQUAKE2_ROGUE_LICENSE_FILES = LICENSE
YQUAKE2_ROGUE_DEPENDENCIES += yquake2

define YQUAKE2_ROGUE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/yquake2/rogue
	$(INSTALL) -D -m 0644 $(@D)/Release/game.so $(TARGET_DIR)/usr/bin/yquake2/rogue/
endef

$(eval $(cmake-package))
