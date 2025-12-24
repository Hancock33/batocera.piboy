################################################################################
#
# yquake2-zaero
#
################################################################################
# Version: Commits on Dec 10, 2025
YQUAKE2_ZAERO_VERSION = aec3276b792df437823b845b045368ee260dd250
YQUAKE2_ZAERO_SITE = $(call github,yquake2,zaero,$(YQUAKE2_ZAERO_VERSION))
YQUAKE2_ZAERO_LICENSE = Quake II SDK LICENSE
YQUAKE2_ZAERO_LICENSE_FILES = LICENSE
YQUAKE2_ZAERO_DEPENDENCIES += yquake2

define YQUAKE2_ZAERO_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/yquake2/zaero
	$(INSTALL) -D -m 0644 $(@D)/Release/game.so $(TARGET_DIR)/usr/bin/yquake2/zaero/
endef

$(eval $(cmake-package))
