################################################################################
#
# yquake2-zaero
#
################################################################################
# Version: Commits on Nov 11, 2026
YQUAKE2_ZAERO_VERSION = 57062e62fef6e7aeebb470ba0e104d48c73d530c
YQUAKE2_ZAERO_SITE = $(call github,yquake2,zaero,$(YQUAKE2_ZAERO_VERSION))
YQUAKE2_ZAERO_LICENSE = Quake II SDK LICENSE
YQUAKE2_ZAERO_LICENSE_FILES = LICENSE
YQUAKE2_ZAERO_DEPENDENCIES += yquake2

define YQUAKE2_ZAERO_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/yquake2/zaero
	$(INSTALL) -D -m 0644 $(@D)/Release/game.so $(TARGET_DIR)/usr/bin/yquake2/zaero/
endef

$(eval $(cmake-package))
