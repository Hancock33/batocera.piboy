################################################################################
#
# yquake2-xatrix
#
################################################################################
# Version: Commits on May 26, 2026
YQUAKE2_XATRIX_VERSION = aac85f6caea45f78a0449f48d5ceffc3f54fc09c
YQUAKE2_XATRIX_SITE = $(call github,yquake2,xatrix,$(YQUAKE2_XATRIX_VERSION))
YQUAKE2_XATRIX_LICENSE = GPLv2
YQUAKE2_XATRIX_LICENSE_FILES = LICENSE
YQUAKE2_XATRIX_DEPENDENCIES += yquake2

define YQUAKE2_XATRIX_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/yquake2/xatrix
	$(INSTALL) -D -m 0644 $(@D)/Release/game.so $(TARGET_DIR)/usr/bin/yquake2/xatrix/
endef

$(eval $(cmake-package))
