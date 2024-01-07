################################################################################
#
# batocera-controller-overlays
#
################################################################################
# Version: Commits on Jan 06, 2024
BATOCERA_CONTROLLER_OVERLAYS_VERSION = 27bc9f702091b6c53e5b4d0863e1263080f1a186
BATOCERA_CONTROLLER_OVERLAYS_SITE = $(call github,hancock33,batocera-controller-overlays,$(BATOCERA_CONTROLLER_OVERLAYS_VERSION))

define BATOCERA_CONTROLLER_OVERLAYS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/batocera/controller-overlays/
	cp -f $(@D)/solid/*.png $(TARGET_DIR)/usr/share/batocera/controller-overlays/
endef

$(eval $(generic-package))
