################################################################################
#
# batocera-controller-overlays
#
################################################################################
# Version: Commits on Jan 20, 2024
BATOCERA_CONTROLLER_OVERLAYS_VERSION = a77301e60ae6fef28d4ffd149b9618cbc697a4a2
BATOCERA_CONTROLLER_OVERLAYS_SITE = $(call github,hancock33,batocera-controller-overlays,$(BATOCERA_CONTROLLER_OVERLAYS_VERSION))

define BATOCERA_CONTROLLER_OVERLAYS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/batocera/controller-overlays/
	cp -f $(@D)/solid/*.png $(TARGET_DIR)/usr/share/batocera/controller-overlays/
endef

$(eval $(generic-package))
