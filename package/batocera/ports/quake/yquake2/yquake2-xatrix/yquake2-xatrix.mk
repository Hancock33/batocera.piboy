################################################################################
#
# yquake2-xatrix
#
################################################################################
# Version: Commits on Dec 10, 2025
YQUAKE2_XATRIX_VERSION = cbc43db1975f71143be2eb01c9a5eaba0b62b024
YQUAKE2_XATRIX_SITE = $(call github,yquake2,xatrix,$(YQUAKE2_XATRIX_VERSION))
YQUAKE2_XATRIX_LICENSE = GPLv2
YQUAKE2_XATRIX_LICENSE_FILES = LICENSE
YQUAKE2_XATRIX_DEPENDENCIES += yquake2

define YQUAKE2_XATRIX_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(YQUAKE2_XATRIX_BUILD_ARGS) $(YQUAKE2_BUILD_ARCH) -C $(@D)
endef

define YQUAKE2_XATRIX_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/yquake2/xatrix
	$(INSTALL) -D -m 0644 $(@D)/release/game.so $(TARGET_DIR)/usr/bin/yquake2/xatrix/
endef

$(eval $(generic-package))
