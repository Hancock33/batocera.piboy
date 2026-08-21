################################################################################
#
# yquake2-xatrix
#
################################################################################
# Version: Commits on Aug 21, 2026
YQUAKE2_XATRIX_VERSION = 895709bdb80e4a5b496389bb2c4f5730602b1d29
YQUAKE2_XATRIX_SITE = $(call github,yquake2,xatrix,$(YQUAKE2_XATRIX_VERSION))
YQUAKE2_XATRIX_LICENSE = GPLv2
YQUAKE2_XATRIX_LICENSE_FILES = LICENSE
YQUAKE2_XATRIX_DEPENDENCIES += yquake2

define YQUAKE2_XATRIX_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/yquake2/xatrix
	$(INSTALL) -D -m 0644 $(@D)/Release/game.so $(TARGET_DIR)/usr/bin/yquake2/xatrix/
endef

$(eval $(cmake-package))
