################################################################################
#
# batocera-controller-overlays
#
################################################################################
# Version: Commits on May 06, 2025
BATOCERA_CONTROLLER_OVERLAYS_VERSION = 17fd68a47e9d25f1f1880911a4931c4b916ae125
BATOCERA_CONTROLLER_OVERLAYS_SITE = $(call github,hancock33,batocera-controller-overlays,$(BATOCERA_CONTROLLER_OVERLAYS_VERSION))


define BATOCERA_CONTROLLER_OVERLAYS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/batocera/controller-overlays/
	cp -f $(@D)/solid/*.png $(TARGET_DIR)/usr/share/batocera/controller-overlays/
endef

$(eval $(generic-package))
